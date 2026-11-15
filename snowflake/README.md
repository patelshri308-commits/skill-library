# Snowflake add-on

This add-on copies the skill library's governance records into Snowflake, enforces the permission ladder with Snowflake roles, and makes the data queryable in plain English with Cortex Analyst.

- **What gets loaded:** `REGISTRY.md`, every row of `tests/RESULTS.md` in log order, and `requests/*.md`.
- **Where it goes:** `SKILL_LIBRARY.GOVERNANCE`.
- **Source of truth:** the markdown files. `load_governance.py` reloads the Snowflake copy, and is safe to run again.

This add-on changes nothing in `skills/`, `tests/` or `scripts/`.

## What's here

| File | What it does |
| --- | --- |
| `01_setup.sql` | Database, schema, tables, the three ladder roles, the ownership-checking procedures and Cortex Analyst access. Runs as-is in a Snowsight worksheet, and is safe to re-run. |
| `load_governance.py` | Parses the markdown files and reloads `SKILL_REGISTRY`, `TEST_RESULTS` and `SKILL_REQUESTS` in one transaction, then prints row counts. |
| `02_semantic_view.sql` | Semantic view `SKILL_GOVERNANCE` with metrics, dimensions, synonyms and five verified questions for Cortex Analyst. |
| `03_role_demo.sql` | Proves the ladder: what each role can and can't change. |
| `requirements.txt` | `snowflake-connector-python`. |

### Tables

| Table | Rows | Notes |
| --- | --- | --- |
| `SKILL_REGISTRY` | one per skill | skill, function, tier, owner, version, last_reviewed, status |
| `TEST_RESULTS` | one per RESULTS.md row | Includes the case number, run N of M, the raw case label, result and note, plus four flags: `IS_MANUAL` (run by hand in the Claude app), `IS_RECHECK` (a correction row that re-grades an earlier run), `IS_SMOKE`, and `IS_SUPERSEDED` (an original row a re-check corrected) |
| `SKILL_REQUESTS` | one per request file | The `REQUEST_TEMPLATE.md` fields, plus parsed numbers for frequency, minutes and priority |
| `SKILL_OWNERSHIP` | maintained in Snowflake | Maps a Snowflake user (or role) to the skills it owns. The loader doesn't touch it. |

How the counts work:
- **Runs** exclude re-check rows, because a re-check re-grades an earlier run rather than adding a new one.
- **Pass rate and fail count** use corrected results: a superseded row is left out, and its re-check counts instead.

## The permission ladder in Snowflake

| Role | Can do |
| --- | --- |
| `PLATFORM_OWNER` | Owns the database and every object in it: full control. |
| `SKILL_OWNER` | Reads everything. Changes data only through two procedures, and only for skills that `SKILL_OWNERSHIP` maps to their user. `UPDATE_SKILL_REGISTRY` changes version, last review date and status. `ADD_TEST_RESULT` adds a test result row. Tier and owner changes stay with the platform owner. |
| `SKILL_MEMBER` | Reads everything. |

All three roles are granted to SYSADMIN and to the user who runs `01_setup.sql`. Setup also seeds one ownership row that maps that user to `sales-call-recap`, for the demo.

Why procedures and not a row access policy:
- **Edition:** row access policies need Enterprise Edition, and this account is Standard.
- **Inserts:** a row access policy never filters INSERT, so adding test results would need a procedure anyway.

`SKILL_OWNER` has no direct UPDATE, INSERT or DELETE on any table. The procedures run with the platform owner's rights and check `CURRENT_USER()` against `SKILL_OWNERSHIP`. An owner's-rights procedure can't see the caller's roles, so only `USER` rows grant ownership.

**Note:** a row added with `ADD_TEST_RESULT` is replaced on the next reload unless it's also added to `tests/RESULTS.md`.

## Setup

You need:
- A Snowflake account and a user with ACCOUNTADMIN.
- Python 3.10 or later. Connector 5.x needs Python 3.11 or later.
- An MFA method that works outside a browser. A passkey only works in a browser, so add an authenticator app as a second method if a passkey is all you have: in Snowsight, click your name, then **Settings → Authentication**.

1. **Run `01_setup.sql`** in a Snowsight worksheet as ACCOUNTADMIN (Run All).

2. **Enable cross-region inference.** This step is required in AWS US East 2 (Ohio) and any other region where Cortex Analyst isn't natively available. Run it as ACCOUNTADMIN:
   ```sql
   SHOW PARAMETERS LIKE 'CORTEX_ENABLED_CROSS_REGION' IN ACCOUNT;
   ALTER ACCOUNT SET CORTEX_ENABLED_CROSS_REGION = 'AWS_US';
   ```
   This sends Cortex requests to other AWS US regions. The same line is in `01_setup.sql`, commented out.

3. **Set the environment variables.** The loader reads them at run time and writes nothing to disk:
   ```bash
   export SNOWFLAKE_ACCOUNT=<account_locator>.us-east-2.aws   # or <orgname>-<accountname>
   export SNOWFLAKE_USER=<your login name>
   # optional: SNOWFLAKE_ROLE (default PLATFORM_OWNER), SNOWFLAKE_WAREHOUSE (default COMPUTE_WH)
   ```
   Find the locator in Snowsight under your name → **Account**. Don't keep these in a committed file. `.env` and `connections.toml` are already in `.gitignore`.

4. **Install the connector:**
   ```bash
   pip install -r snowflake/requirements.txt
   ```

5. **Run the loader:**
   ```bash
   python3 snowflake/load_governance.py --dry-run   # parse only, no connection
   python3 snowflake/load_governance.py
   ```
   It asks for your password and your authenticator app's 6-digit code, and stores neither. Then it prints the row count of each table.

   Other login methods, set with `SNOWFLAKE_AUTHENTICATOR`:
   - `programmatic_access_token`: reads `SNOWFLAKE_TOKEN` or asks for the token.
   - `externalbrowser`: only works if the account has an SSO identity provider such as Okta or Entra ID.

   `--setup` runs `01_setup.sql` through the connector before loading, if you'd rather not use Snowsight for step 1.

6. **Run `02_semantic_view.sql`** in Snowsight. It ends with a quick check query: pass rate by skill and version through the semantic view.

7. **Run `03_role_demo.sql`** in Snowsight with Run All. The comment on each step says what you should see:
   - **SKILL_MEMBER:** a direct UPDATE is blocked.
   - **SKILL_OWNER:**
     - Direct UPDATE and INSERT are blocked.
     - `UPDATE_SKILL_REGISTRY` updates 1 row for sales-call-recap and 0 rows for staffing-match.
     - `ADD_TEST_RESULT` refuses staffing-match and adds a sales-call-recap row.
   - **PLATFORM_OWNER:** everything works, and the demo row is deleted.

   The script starts with `USE SECONDARY ROLES NONE`. Without it, roles granted to you, ACCOUNTADMIN included, stay active and every step would succeed.

## Try it in Cortex Analyst

In Snowsight, open Cortex Analyst (under AI & ML) and choose the semantic view `SKILL_LIBRARY.GOVERNANCE.SKILL_GOVERNANCE`. These five questions have verified SQL:

1. What is the pass rate by skill and version?
2. Which versions had fails, and what do the notes say?
3. Which skills are due for review (last reviewed more than 90 days ago)?
4. How many runs were manual?
5. How did the pass rate change across sales-call-recap versions?

Other questions to try:
- Which skill has the most fails, and on which cases?
- How many runs did the automated runner do for each skill?
- Which test results were corrected by a re-check?
- Who owns each skill, and when is its next review due?
- What must never happen for the sales-call-recap request?

What the answers mean:
- **Manual** means run by hand in the Claude app, mostly graded by Claude in the chat. **Automated** means run by `scripts/run_tests.py`.
- **Due for review:** with the current data, no skill is due yet. All three were reviewed on 2026-11-08.

Snowflake now recommends Cortex Agents (Snowflake Intelligence) for new work. An agent can use this same semantic view as its Cortex Analyst tool.
