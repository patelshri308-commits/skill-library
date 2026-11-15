"""Load the skill library's governance records into Snowflake.

Parses REGISTRY.md, tests/RESULTS.md and requests/*.md and reloads
SKILL_LIBRARY.GOVERNANCE.SKILL_REGISTRY, TEST_RESULTS and SKILL_REQUESTS.
Each reload replaces the table contents in one transaction, so it is safe to run
again. SKILL_OWNERSHIP is managed in Snowflake (01_setup.sql) and is not touched.

The markdown files stay the source of truth. Rows added in Snowflake with
ADD_TEST_RESULT are replaced on the next reload unless they are also in RESULTS.md.

Connection settings come from environment variables; nothing is written to disk:
  SNOWFLAKE_ACCOUNT        required, e.g. xy12345.us-east-2.aws or myorg-myaccount
  SNOWFLAKE_USER           required
  SNOWFLAKE_ROLE           optional; default PLATFORM_OWNER (ACCOUNTADMIN with --setup)
  SNOWFLAKE_WAREHOUSE      optional; default COMPUTE_WH
  SNOWFLAKE_AUTHENTICATOR  optional; default username_password_mfa, which asks for your
                           password and authenticator-app code and stores neither.
                           Also: programmatic_access_token (SNOWFLAKE_TOKEN or a prompt),
                           or externalbrowser (only if the account has an SSO
                           identity provider such as Okta or Entra ID).

Usage:
  python3 snowflake/load_governance.py --dry-run   # parse only, no connection
  python3 snowflake/load_governance.py             # reload the tables
  python3 snowflake/load_governance.py --setup     # run 01_setup.sql first, then reload
"""
from __future__ import annotations

import argparse
import datetime as dt
import getpass
import os
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
DATABASE = "SKILL_LIBRARY"
SCHEMA = "GOVERNANCE"


# ---------------------------------------------------------------------------
# Markdown parsing
# ---------------------------------------------------------------------------

def table_rows(text: str) -> list[list[str]]:
    """Data rows of the first markdown table in text, as lists of cell strings."""
    rows, in_table = [], False
    for line in text.splitlines():
        stripped = line.strip()
        if not stripped.startswith("|"):
            if in_table:
                break
            continue
        cells = [c.strip() for c in stripped.strip("|").split("|")]
        if not in_table:  # header row
            in_table = True
            header_len = len(cells)
            continue
        if all(re.fullmatch(r":?-+:?", c) for c in cells):  # separator row
            continue
        if len(cells) > header_len:  # a stray pipe inside the last cell
            cells = cells[: header_len - 1] + [" | ".join(cells[header_len - 1:])]
        rows.append(cells + [""] * (header_len - len(cells)))
    return rows


def parse_registry() -> list[dict]:
    rows = []
    for skill, function, tier, owner, version, reviewed, status in table_rows(
        (ROOT / "REGISTRY.md").read_text()
    ):
        rows.append({
            "skill": skill.strip("`"),
            "function": function,
            "tier": tier,
            "owner": owner,
            "version": version,
            "last_reviewed": dt.date.fromisoformat(reviewed),
            "status": status,
        })
    return rows


def parse_results() -> list[dict]:
    rows = []
    for i, (skill, version, label, result, note) in enumerate(
        table_rows((ROOT / "tests" / "RESULTS.md").read_text()), start=1
    ):
        case = re.match(r"\s*(\d+)", label)
        run = re.search(r"run (\d+) of (\d+)", label)
        is_recheck = "re-checked" in label
        rows.append({
            "row_num": i,
            "skill": skill,
            "version": version,
            "case_number": int(case.group(1)) if case else None,
            "run_number": int(run.group(1)) if run else None,
            "total_runs": int(run.group(2)) if run else None,
            "raw_case_label": label,
            "result": result,
            "note": note,
            # Automated-runner rows start "Auto:", and re-checks were done by code
            # on saved outputs. Everything else was run by hand in the Claude app
            # (mostly graded by Claude in the chat).
            "is_manual": not note.startswith("Auto:") and not is_recheck,
            "is_recheck": is_recheck,
            "is_smoke": "smoke" in label,
            "is_superseded": False,
        })

    # A re-check row corrects the latest earlier row for the same run.
    for row in rows:
        if not row["is_recheck"]:
            continue
        key = (row["skill"], row["version"], row["case_number"], row["run_number"], row["total_runs"])
        for earlier in reversed(rows[: row["row_num"] - 1]):
            if not earlier["is_recheck"] and key == (
                earlier["skill"], earlier["version"], earlier["case_number"],
                earlier["run_number"], earlier["total_runs"],
            ):
                earlier["is_superseded"] = True
                break
        else:
            print(f"warning: re-check row {row['row_num']} has no earlier row to correct", file=sys.stderr)
    return rows


# Template label (text before the first colon) -> SKILL_REQUESTS column.
REQUEST_FIELDS = {
    "Requested by / team": "requested_by_team",
    "The task today, step by step": "task_steps",
    "How often it happens (per week)": "frequency_per_week_text",
    "Time it takes now (minutes)": "minutes_per_task_text",
    'What "done" looks like (the output)': "done_looks_like",
    "Systems involved (Salesforce, Microsoft 365, Otter.ai, other)": "systems_involved",
    "Anything that must never happen (send, delete, share externally)": "must_never_happen",
    "Priority": "priority_text",
}


def first_number(text: str | None) -> float | None:
    match = re.search(r"\d+(?:\.\d+)?", text or "")
    return float(match.group()) if match else None


def parse_requests() -> list[dict]:
    template_labels = [
        line[2:].split(":", 1)[0].strip()
        for line in (ROOT / "REQUEST_TEMPLATE.md").read_text().splitlines()
        if line.startswith("- ")
    ]
    unmapped = [label for label in template_labels if label not in REQUEST_FIELDS]
    if unmapped:
        sys.exit(f"REQUEST_TEMPLATE.md has fields the loader doesn't map: {unmapped}")

    rows = []
    for path in sorted((ROOT / "requests").glob("*.md")):
        text = path.read_text()
        title = re.search(r"^#\s*Skill request\s+(\d+):\s*(\S+)", text, re.MULTILINE)
        row = {column: None for column in REQUEST_FIELDS.values()}
        row.update({
            "request_id": title.group(1) if title else path.stem.split("-", 1)[0],
            "skill": title.group(2).strip("`") if title else None,
            "source_file": f"requests/{path.name}",
        })
        for bold, column in [("Original ask", "original_ask"),
                             ("What the intake conversation found", "intake_findings"),
                             ("Decision", "decision")]:
            match = re.search(rf"^\*\*{re.escape(bold)}:\*\*\s*(.+)$", text, re.MULTILINE)
            row[column] = match.group(1).strip() if match else None

        extra, current = [], None
        for line in text.splitlines():
            if line.startswith("- "):
                label, _, value = line[2:].partition(":")
                column = REQUEST_FIELDS.get(label.strip())
                if column:
                    row[column] = value.strip()
                    current = column
                else:
                    extra.append(line[2:].strip())
                    current = "extra"
            elif line.startswith((" ", "\t")) and line.strip() and current:
                if current == "extra":
                    extra[-1] += "\n" + line.strip()
                else:
                    row[current] = ((row[current] or "") + "\n" + line.strip()).strip()
            elif not line.strip():
                continue
            else:
                current = None
        row["extra_notes"] = "\n".join(extra) or None

        row["frequency_per_week"] = first_number(row["frequency_per_week_text"])
        row["minutes_per_task"] = first_number(row["minutes_per_task_text"])
        priority = re.search(r"impact\s+(\d+)\s*x\s*frequency\s+(\d+)", row["priority_text"] or "")
        row["impact_score"] = int(priority.group(1)) if priority else None
        row["frequency_score"] = int(priority.group(2)) if priority else None
        row["priority_score"] = (row["impact_score"] * row["frequency_score"]) if priority else None
        rows.append(row)
    return rows


# ---------------------------------------------------------------------------
# Snowflake
# ---------------------------------------------------------------------------

def connect(role: str):
    import snowflake.connector  # imported here so --dry-run works without it

    missing = [v for v in ("SNOWFLAKE_ACCOUNT", "SNOWFLAKE_USER") if not os.environ.get(v)]
    if missing:
        sys.exit(f"Set {' and '.join(missing)} first (see snowflake/README.md).")
    authenticator = os.environ.get("SNOWFLAKE_AUTHENTICATOR", "username_password_mfa")
    params = dict(
        account=os.environ["SNOWFLAKE_ACCOUNT"],
        user=os.environ["SNOWFLAKE_USER"],
        authenticator=authenticator,
        role=role,
        warehouse=os.environ.get("SNOWFLAKE_WAREHOUSE", "COMPUTE_WH"),
        client_store_temporary_credential=True,  # cache the login token in the OS keychain
    )
    if authenticator.lower() in ("snowflake", "username_password_mfa"):
        # Asked for at run time and never stored.
        params["password"] = getpass.getpass(f"Snowflake password for {params['user']}: ")
    if authenticator.lower() == "username_password_mfa":
        passcode = getpass.getpass("MFA code from your authenticator app (blank for a Duo push): ").strip()
        if passcode:
            params["passcode"] = passcode
    if authenticator.lower() == "programmatic_access_token":
        params["token"] = os.environ.get("SNOWFLAKE_TOKEN") or getpass.getpass("Programmatic access token: ")
    try:
        return snowflake.connector.connect(**params)
    except snowflake.connector.errors.DatabaseError as e:
        if authenticator.lower() == "externalbrowser" and "SAML Identity Provider" in str(e):
            sys.exit(
                "Browser login needs an SSO identity provider (Okta, Entra ID, ...) on the account.\n"
                "For a Snowflake password with MFA, unset SNOWFLAKE_AUTHENTICATOR to use the\n"
                "default, username_password_mfa (asks for password and MFA code; stores neither)."
            )
        if "none of your current MFA methods are supported" in str(e):
            sys.exit(
                "Your MFA method (probably a passkey) only works in a browser. In Snowsight, go to\n"
                "your name > Settings > Authentication and add an authenticator app as a second\n"
                "MFA method, then run again and enter its 6-digit code."
            )
        raise


def run_sql_file(conn, path: Path) -> None:
    print(f"Running {path.name} ...")
    for cursor in conn.execute_string(path.read_text(), remove_comments=True):
        cursor.close()


TABLES = {
    "SKILL_REGISTRY": ["skill", "function", "tier", "owner", "version", "last_reviewed", "status"],
    "TEST_RESULTS": ["row_num", "skill", "version", "case_number", "run_number", "total_runs",
                     "raw_case_label", "result", "note", "is_manual", "is_recheck", "is_smoke",
                     "is_superseded"],
    "SKILL_REQUESTS": ["request_id", "skill", "source_file", "original_ask", "intake_findings",
                       "requested_by_team", "task_steps", "frequency_per_week_text",
                       "frequency_per_week", "minutes_per_task_text", "minutes_per_task",
                       "done_looks_like", "systems_involved", "must_never_happen",
                       "priority_text", "impact_score", "frequency_score", "priority_score",
                       "decision", "extra_notes"],
}


def reload(conn, data: dict[str, list[dict]]) -> None:
    cur = conn.cursor()
    cur.execute(f"USE SCHEMA {DATABASE}.{SCHEMA}")
    cur.execute("BEGIN")
    try:
        for table, columns in TABLES.items():
            # DELETE rather than TRUNCATE: TRUNCATE commits on its own, and a
            # failed load would leave the tables empty.
            cur.execute(f"DELETE FROM {table}")
            placeholders = ", ".join(["%s"] * len(columns))
            cur.executemany(
                f"INSERT INTO {table} ({', '.join(columns)}) VALUES ({placeholders})",
                [tuple(row[c] for c in columns) for row in data[table]],
            )
        cur.execute("COMMIT")
    except Exception:
        cur.execute("ROLLBACK")
        raise


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--dry-run", action="store_true", help="parse and print counts; don't connect")
    parser.add_argument("--setup", action="store_true", help="run snowflake/01_setup.sql before loading")
    args = parser.parse_args()

    data = {
        "SKILL_REGISTRY": parse_registry(),
        "TEST_RESULTS": parse_results(),
        "SKILL_REQUESTS": parse_requests(),
    }
    results = data["TEST_RESULTS"]
    print(f"Parsed {len(data['SKILL_REGISTRY'])} registry rows, {len(results)} test result rows "
          f"({sum(not r['is_recheck'] for r in results)} runs, "
          f"{sum(r['is_recheck'] for r in results)} re-checks), "
          f"{len(data['SKILL_REQUESTS'])} requests.")
    if args.dry_run:
        return

    role = os.environ.get("SNOWFLAKE_ROLE", "ACCOUNTADMIN" if args.setup else "PLATFORM_OWNER")
    conn = connect(role)
    try:
        if args.setup:
            run_sql_file(conn, HERE / "01_setup.sql")
            conn.cursor().execute("USE ROLE PLATFORM_OWNER")
        reload(conn, data)
        cur = conn.cursor()
        print(f"\nRow counts in {DATABASE}.{SCHEMA}:")
        for table in [*TABLES, "SKILL_OWNERSHIP"]:
            count = cur.execute(f"SELECT COUNT(*) FROM {DATABASE}.{SCHEMA}.{table}").fetchone()[0]
            print(f"  {table:<16}{count:>5}")
    finally:
        conn.close()


if __name__ == "__main__":
    main()
