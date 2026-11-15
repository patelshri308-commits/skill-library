-- =============================================================================
-- 01_setup.sql: database, tables, roles and ownership checks for the skill
-- library's governance records. Run it as-is in a Snowsight worksheet (Run All).
-- It is safe to run again: nothing here deletes data or replaces a table.
--
-- Works on Standard Edition. Ownership is enforced with procedures, not a row
-- access policy (see section 4).
-- =============================================================================

USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;

-- -----------------------------------------------------------------------------
-- 1. Roles that mirror the README's permission ladder
-- -----------------------------------------------------------------------------
CREATE ROLE IF NOT EXISTS PLATFORM_OWNER
  COMMENT = 'Skill library platform owner: full control of the governance data.';
CREATE ROLE IF NOT EXISTS SKILL_OWNER
  COMMENT = 'Skill owner: may update registry rows and add test results only for skills mapped to the user in SKILL_OWNERSHIP.';
CREATE ROLE IF NOT EXISTS SKILL_MEMBER
  COMMENT = 'Skill library member: read only.';

-- Custom roles roll up to SYSADMIN, as Snowflake recommends.
GRANT ROLE PLATFORM_OWNER TO ROLE SYSADMIN;
GRANT ROLE SKILL_OWNER    TO ROLE SYSADMIN;
GRANT ROLE SKILL_MEMBER   TO ROLE SYSADMIN;

-- Grant all three to whoever runs this script, so you can switch roles to demo.
SET my_user = CURRENT_USER();
GRANT ROLE PLATFORM_OWNER TO USER IDENTIFIER($my_user);
GRANT ROLE SKILL_OWNER    TO USER IDENTIFIER($my_user);
GRANT ROLE SKILL_MEMBER   TO USER IDENTIFIER($my_user);

GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE PLATFORM_OWNER;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE SKILL_OWNER;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE SKILL_MEMBER;

-- Cortex Analyst needs SNOWFLAKE.CORTEX_USER (granted to PUBLIC by default) or
-- SNOWFLAKE.CORTEX_ANALYST_USER. Granting the narrower one makes access explicit.
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_ANALYST_USER TO ROLE PLATFORM_OWNER;
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_ANALYST_USER TO ROLE SKILL_OWNER;
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_ANALYST_USER TO ROLE SKILL_MEMBER;

-- Optional: Cortex Analyst is not natively available in AWS US East 2 (Ohio).
-- If Cortex Analyst says it isn't available, check the current setting:
--   SHOW PARAMETERS LIKE 'CORTEX_ENABLED_CROSS_REGION' IN ACCOUNT;
-- and if it is DISABLED, uncomment the next line to let requests run in other
-- AWS US regions (ACCOUNTADMIN only; account level).
-- ALTER ACCOUNT SET CORTEX_ENABLED_CROSS_REGION = 'AWS_US';

-- -----------------------------------------------------------------------------
-- 2. Database and schema, owned by PLATFORM_OWNER
-- -----------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS SKILL_LIBRARY
  COMMENT = 'Governance records for the Acme Data Co. skill library (fictional sample data).';
GRANT OWNERSHIP ON DATABASE SKILL_LIBRARY TO ROLE PLATFORM_OWNER COPY CURRENT GRANTS;

USE ROLE PLATFORM_OWNER;
CREATE SCHEMA IF NOT EXISTS SKILL_LIBRARY.GOVERNANCE
  COMMENT = 'Registry, test results, skill requests and ownership, loaded from the repo by load_governance.py.';
USE SCHEMA SKILL_LIBRARY.GOVERNANCE;

-- -----------------------------------------------------------------------------
-- 3. Tables
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS SKILL_REGISTRY (
  SKILL          VARCHAR NOT NULL PRIMARY KEY COMMENT 'Skill folder name, function-task (e.g. sales-call-recap)',
  FUNCTION       VARCHAR COMMENT 'Business function: Sell, Staff or Deliver',
  TIER           VARCHAR COMMENT 'Permission ladder tier: Personal, Team, Org-approved or Retired',
  OWNER          VARCHAR COMMENT 'Named owner (a role in the business, e.g. Sales enablement)',
  VERSION        VARCHAR COMMENT 'Current version (semver)',
  LAST_REVIEWED  DATE    COMMENT 'Date of the last review; org-approved skills are reviewed every 90 days',
  STATUS         VARCHAR COMMENT 'Lifecycle status, e.g. Pilot'
) COMMENT = 'One row per skill, loaded from REGISTRY.md.';

CREATE TABLE IF NOT EXISTS TEST_RESULTS (
  ROW_NUM         NUMBER  NOT NULL PRIMARY KEY COMMENT 'Position in tests/RESULTS.md (1 = oldest); log order',
  SKILL           VARCHAR NOT NULL COMMENT 'Skill tested',
  VERSION         VARCHAR NOT NULL COMMENT 'Skill version tested',
  CASE_NUMBER     NUMBER  COMMENT 'Test case number from tests/<skill>.md',
  RUN_NUMBER      NUMBER  COMMENT 'Run N of a repeated case; NULL when the label does not say',
  TOTAL_RUNS      NUMBER  COMMENT 'Number of runs in that set; NULL when the label does not say',
  RAW_CASE_LABEL  VARCHAR COMMENT 'Case column exactly as logged, e.g. "2 (run 1 of 3, re-checked)"',
  RESULT          VARCHAR COMMENT 'Result exactly as logged: Pass, Fail, Error, or Fail: <reason>',
  NOTE            VARCHAR COMMENT 'Note as logged; automated rows start with "Auto:"',
  IS_MANUAL       BOOLEAN COMMENT 'TRUE if run by hand in the Claude app (every run before the automated runner, plus app-only trigger tests); FALSE for the automated runner',
  IS_RECHECK      BOOLEAN COMMENT 'TRUE for "re-checked" correction rows, which re-grade an earlier run rather than adding a new one',
  IS_SMOKE        BOOLEAN COMMENT 'TRUE for a smoke run done before a full re-run',
  IS_SUPERSEDED   BOOLEAN COMMENT 'TRUE for an original row whose result was later corrected by a re-check row'
) COMMENT = 'One row per tests/RESULTS.md row, in log order. Rows are never edited; corrections are new rows.';
-- Keeps the column description current when the table already exists.
ALTER TABLE TEST_RESULTS MODIFY COLUMN IS_MANUAL COMMENT
  'TRUE if run by hand in the Claude app (every run before the automated runner, plus app-only trigger tests); FALSE for the automated runner';

CREATE TABLE IF NOT EXISTS SKILL_REQUESTS (
  REQUEST_ID               VARCHAR NOT NULL PRIMARY KEY COMMENT 'Request number from the file name, e.g. 001',
  SKILL                    VARCHAR COMMENT 'Skill the request became, if any',
  SOURCE_FILE              VARCHAR COMMENT 'Path of the request file in the repo',
  ORIGINAL_ASK             VARCHAR COMMENT 'The ask in the requester''s words',
  INTAKE_FINDINGS          VARCHAR COMMENT 'What the intake conversation found',
  REQUESTED_BY_TEAM        VARCHAR COMMENT 'Template: Requested by / team',
  TASK_STEPS               VARCHAR COMMENT 'Template: The task today, step by step',
  FREQUENCY_PER_WEEK_TEXT  VARCHAR COMMENT 'Template: How often it happens (per week), as written',
  FREQUENCY_PER_WEEK       NUMBER(10,1) COMMENT 'First number in FREQUENCY_PER_WEEK_TEXT',
  MINUTES_PER_TASK_TEXT    VARCHAR COMMENT 'Template: Time it takes now (minutes), as written',
  MINUTES_PER_TASK         NUMBER(10,1) COMMENT 'First number in MINUTES_PER_TASK_TEXT',
  DONE_LOOKS_LIKE          VARCHAR COMMENT 'Template: What "done" looks like (the output)',
  SYSTEMS_INVOLVED         VARCHAR COMMENT 'Template: Systems involved',
  MUST_NEVER_HAPPEN        VARCHAR COMMENT 'Template: Anything that must never happen',
  PRIORITY_TEXT            VARCHAR COMMENT 'Template: Priority, as written',
  IMPACT_SCORE             NUMBER  COMMENT 'Impact 1-5',
  FREQUENCY_SCORE          NUMBER  COMMENT 'Frequency 1-5',
  PRIORITY_SCORE           NUMBER  COMMENT 'Impact x frequency (1-25)',
  DECISION                 VARCHAR COMMENT 'What was decided',
  EXTRA_NOTES              VARCHAR COMMENT 'Lines in the file that are not template fields'
) COMMENT = 'One row per requests/*.md file, parsed using REQUEST_TEMPLATE.md fields.';

CREATE TABLE IF NOT EXISTS SKILL_OWNERSHIP (
  PRINCIPAL_TYPE  VARCHAR NOT NULL COMMENT 'USER or ROLE (only USER rows are enforced by the procedures)',
  PRINCIPAL_NAME  VARCHAR NOT NULL COMMENT 'Snowflake user name or role name, uppercase as Snowflake stores it',
  SKILL           VARCHAR NOT NULL COMMENT 'Skill this principal owns',
  GRANTED_AT      TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP(),
  NOTE            VARCHAR,
  CONSTRAINT SKILL_OWNERSHIP_PK PRIMARY KEY (PRINCIPAL_TYPE, PRINCIPAL_NAME, SKILL)
) COMMENT = 'Maps a Snowflake user or role to the skills it owns. Managed here, not by the loader.';

-- Demo seed: you own sales-call-recap. Real owners would be added the same way,
-- ideally as one role per owner (e.g. a SALES_ENABLEMENT role granted SKILL_OWNER).
MERGE INTO SKILL_OWNERSHIP t
USING (SELECT 'USER' AS principal_type, $my_user AS principal_name, 'sales-call-recap' AS skill) s
  ON t.principal_type = s.principal_type AND t.principal_name = s.principal_name AND t.skill = s.skill
WHEN NOT MATCHED THEN INSERT (principal_type, principal_name, skill, note)
  VALUES (s.principal_type, s.principal_name, s.skill, 'Demo seed from 01_setup.sql');

-- -----------------------------------------------------------------------------
-- 4. How the ladder is enforced
-- -----------------------------------------------------------------------------
-- SKILL_OWNER and SKILL_MEMBER get SELECT only. Neither can UPDATE, INSERT,
-- DELETE or TRUNCATE any table directly. Owners change data only through the two
-- procedures below. They run with PLATFORM_OWNER's rights (EXECUTE AS OWNER)
-- and touch only rows for skills that SKILL_OWNERSHIP maps to the calling user
-- (CURRENT_USER()).
--
-- Why procedures and not a row access policy: row access policies need
-- Enterprise Edition, and this account is Standard. They also never filter
-- INSERT, so adding test results would need a procedure anyway. Inside an
-- owner's rights procedure the caller's roles aren't visible, so only USER rows
-- in SKILL_OWNERSHIP grant ownership. ROLE rows are recorded but not enforced.

-- Owners may change version, last review date and status of skills they own.
-- Tier and owner stay with PLATFORM_OWNER, because moving up the ladder needs
-- platform review. NULL leaves a field unchanged. Returns the rows updated.
CREATE OR REPLACE PROCEDURE UPDATE_SKILL_REGISTRY(
    P_SKILL          VARCHAR,
    P_VERSION        VARCHAR,
    P_LAST_REVIEWED  DATE,
    P_STATUS         VARCHAR
)
RETURNS VARCHAR
LANGUAGE SQL
COMMENT = 'Updates version, last_reviewed or status for a skill the calling user owns. Changes 0 rows otherwise.'
EXECUTE AS OWNER
AS
$$
DECLARE
  caller VARCHAR DEFAULT CURRENT_USER();
  n      INTEGER;
BEGIN
  UPDATE SKILL_LIBRARY.GOVERNANCE.SKILL_REGISTRY r
     SET version       = COALESCE(:P_VERSION, r.version),
         last_reviewed = COALESCE(:P_LAST_REVIEWED, r.last_reviewed),
         status        = COALESCE(:P_STATUS, r.status)
   WHERE r.skill = :P_SKILL
     AND EXISTS (SELECT 1 FROM SKILL_LIBRARY.GOVERNANCE.SKILL_OWNERSHIP o
                  WHERE o.skill = r.skill
                    AND o.principal_type = 'USER'
                    AND o.principal_name = :caller);
  n := SQLROWCOUNT;
  RETURN 'Updated ' || n || ' row(s) for ' || P_SKILL || ' as ' || caller ||
         IFF(n = 0, ' (you do not own this skill in SKILL_OWNERSHIP, or it does not exist)', '') || '.';
END;
$$;

-- -----------------------------------------------------------------------------
-- 5. Adding test results
-- -----------------------------------------------------------------------------
-- Inserts only if SKILL_OWNERSHIP maps the calling user to the skill, and
-- raises an error otherwise. Test results are never edited, only added.
CREATE OR REPLACE PROCEDURE ADD_TEST_RESULT(
    P_SKILL       VARCHAR,
    P_VERSION     VARCHAR,
    P_CASE_NUMBER NUMBER,
    P_RUN_NUMBER  NUMBER,
    P_TOTAL_RUNS  NUMBER,
    P_RESULT      VARCHAR,
    P_NOTE        VARCHAR,
    P_IS_MANUAL   BOOLEAN
)
RETURNS VARCHAR
LANGUAGE SQL
COMMENT = 'Adds one TEST_RESULTS row for a skill the calling user owns. Refuses otherwise.'
EXECUTE AS OWNER
AS
$$
DECLARE
  caller   VARCHAR DEFAULT CURRENT_USER();
  owned    INTEGER DEFAULT 0;
  next_row INTEGER;
  label    VARCHAR;
  not_owner      EXCEPTION (-20001, 'Refused: SKILL_OWNERSHIP does not map your user to this skill. Nothing was added.');
  bad_result     EXCEPTION (-20002, 'Refused: result must be Pass, Fail, Error, or start with "Fail: ". Nothing was added.');
BEGIN
  SELECT COUNT(*) INTO :owned
    FROM SKILL_LIBRARY.GOVERNANCE.SKILL_OWNERSHIP
   WHERE skill = :P_SKILL AND principal_type = 'USER' AND principal_name = :caller;
  IF (owned = 0) THEN
    RAISE not_owner;
  END IF;
  IF (NOT (P_RESULT IN ('Pass', 'Fail', 'Error') OR STARTSWITH(P_RESULT, 'Fail: '))) THEN
    RAISE bad_result;
  END IF;

  label := P_CASE_NUMBER::VARCHAR ||
           IFF(P_RUN_NUMBER IS NULL, '', ' (run ' || P_RUN_NUMBER || ' of ' || P_TOTAL_RUNS || ')');
  SELECT COALESCE(MAX(row_num), 0) + 1 INTO :next_row FROM SKILL_LIBRARY.GOVERNANCE.TEST_RESULTS;

  INSERT INTO SKILL_LIBRARY.GOVERNANCE.TEST_RESULTS
    (row_num, skill, version, case_number, run_number, total_runs, raw_case_label,
     result, note, is_manual, is_recheck, is_smoke, is_superseded)
  VALUES
    (:next_row, :P_SKILL, :P_VERSION, :P_CASE_NUMBER, :P_RUN_NUMBER, :P_TOTAL_RUNS, :label,
     :P_RESULT, :P_NOTE, :P_IS_MANUAL, FALSE, FALSE, FALSE);

  RETURN 'Added TEST_RESULTS row ' || next_row || ' for ' || P_SKILL || ' ' || P_VERSION ||
         ' as ' || caller || '. Add it to tests/RESULTS.md too, or the next reload replaces it.';
END;
$$;

-- -----------------------------------------------------------------------------
-- 6. Grants down the ladder (PLATFORM_OWNER owns everything above)
-- -----------------------------------------------------------------------------
GRANT USAGE ON DATABASE SKILL_LIBRARY TO ROLE SKILL_OWNER;
GRANT USAGE ON DATABASE SKILL_LIBRARY TO ROLE SKILL_MEMBER;
GRANT USAGE ON SCHEMA SKILL_LIBRARY.GOVERNANCE TO ROLE SKILL_OWNER;
GRANT USAGE ON SCHEMA SKILL_LIBRARY.GOVERNANCE TO ROLE SKILL_MEMBER;

-- SKILL_MEMBER: read only.
GRANT SELECT ON TABLE SKILL_REGISTRY  TO ROLE SKILL_MEMBER;
GRANT SELECT ON TABLE TEST_RESULTS    TO ROLE SKILL_MEMBER;
GRANT SELECT ON TABLE SKILL_REQUESTS  TO ROLE SKILL_MEMBER;
GRANT SELECT ON TABLE SKILL_OWNERSHIP TO ROLE SKILL_MEMBER;

-- SKILL_OWNER: read, plus the two ownership-checked procedures. No direct
-- UPDATE, INSERT, DELETE or TRUNCATE.
GRANT SELECT ON TABLE SKILL_REGISTRY  TO ROLE SKILL_OWNER;
GRANT SELECT ON TABLE TEST_RESULTS    TO ROLE SKILL_OWNER;
GRANT SELECT ON TABLE SKILL_REQUESTS  TO ROLE SKILL_OWNER;
GRANT SELECT ON TABLE SKILL_OWNERSHIP TO ROLE SKILL_OWNER;
GRANT USAGE ON PROCEDURE UPDATE_SKILL_REGISTRY(VARCHAR, VARCHAR, DATE, VARCHAR) TO ROLE SKILL_OWNER;
GRANT USAGE ON PROCEDURE ADD_TEST_RESULT(VARCHAR, VARCHAR, NUMBER, NUMBER, NUMBER, VARCHAR, VARCHAR, BOOLEAN)
  TO ROLE SKILL_OWNER;

-- Next: set SNOWFLAKE_ACCOUNT and SNOWFLAKE_USER, then run
--   python3 snowflake/load_governance.py
