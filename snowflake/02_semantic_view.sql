-- =============================================================================
-- 02_semantic_view.sql: a semantic view over the governance tables, so Cortex
-- Analyst can answer plain-English questions about skills, tests and requests.
-- Run after 01_setup.sql and load_governance.py. Safe to run again.
-- =============================================================================

USE ROLE PLATFORM_OWNER;
USE WAREHOUSE COMPUTE_WH;
USE SCHEMA SKILL_LIBRARY.GOVERNANCE;

CREATE OR REPLACE SEMANTIC VIEW SKILL_LIBRARY.GOVERNANCE.SKILL_GOVERNANCE

  TABLES (
    skill_registry AS SKILL_LIBRARY.GOVERNANCE.SKILL_REGISTRY
      PRIMARY KEY (skill)
      WITH SYNONYMS ('registry', 'skills', 'skill list', 'skill catalog', 'skill library')
      COMMENT = 'One row per skill in the library: function, permission tier, owner, current version, last review date and status.',

    test_results AS SKILL_LIBRARY.GOVERNANCE.TEST_RESULTS
      PRIMARY KEY (row_num)
      WITH SYNONYMS ('tests', 'test runs', 'test log', 'runs', 'results', 'evals')
      COMMENT = 'One row per line of the test log, in log order. Each row is one run of one test case on one skill version, except re-check rows, which re-grade an earlier run.',

    skill_requests AS SKILL_LIBRARY.GOVERNANCE.SKILL_REQUESTS
      PRIMARY KEY (request_id)
      WITH SYNONYMS ('requests', 'intake', 'skill asks', 'backlog requests')
      COMMENT = 'One row per skill request submitted through the request template: who asked, the task, its frequency and time, and the decision.'
  )

  RELATIONSHIPS (
    results_to_skill AS test_results (skill) REFERENCES skill_registry,
    requests_to_skill AS skill_requests (skill) REFERENCES skill_registry
  )

  FACTS (
    test_results.run_flag AS IFF(is_recheck, 0, 1)
      COMMENT = '1 for a real run, 0 for a re-check row (a re-grade, not a new run).',
    test_results.graded_flag AS IFF(NOT is_superseded AND (STARTSWITH(result, 'Pass') OR STARTSWITH(result, 'Fail')), 1, 0)
      COMMENT = '1 if the row counts toward the pass rate: a Pass or Fail that was not later corrected by a re-check.',
    test_results.pass_flag AS IFF(NOT is_superseded AND STARTSWITH(result, 'Pass'), 1, 0)
      COMMENT = '1 for a current Pass.',
    test_results.fail_flag AS IFF(NOT is_superseded AND STARTSWITH(result, 'Fail'), 1, 0)
      COMMENT = '1 for a current Fail (corrected fails excluded).',
    test_results.manual_run_flag AS IFF(is_manual AND NOT is_recheck, 1, 0)
      COMMENT = '1 for a run done by hand in the Claude app (not the automated runner).',

    skill_requests.frequency_per_week AS frequency_per_week
      COMMENT = 'How many times a week the task happens, per the requester.',
    skill_requests.minutes_per_task AS minutes_per_task
      COMMENT = 'Minutes the task takes by hand today, per the requester.',
    skill_requests.priority_score AS priority_score
      COMMENT = 'Impact (1-5) times frequency (1-5).'
  )

  DIMENSIONS (
    -- Registry
    skill_registry.skill AS skill
      WITH SYNONYMS ('skill name', 'skill id')
      COMMENT = 'Skill name, function-task in lowercase with hyphens: sales-call-recap, staffing-match, client-status-report.',
    skill_registry.function AS function
      WITH SYNONYMS ('team', 'business function', 'department')
      COMMENT = 'Business function the skill serves: Sell (sales), Staff (staffing) or Deliver (delivery).',
    skill_registry.tier AS tier
      WITH SYNONYMS ('permission tier', 'ladder tier', 'access level')
      COMMENT = 'Permission ladder tier: Personal, Team, Org-approved or Retired.',
    skill_registry.owner AS owner
      WITH SYNONYMS ('skill owner', 'responsible', 'accountable')
      COMMENT = 'Named owner of the skill, as a business role (e.g. Sales enablement).',
    skill_registry.current_version AS version
      WITH SYNONYMS ('latest version', 'live version')
      COMMENT = 'Version of the skill currently in the library.',
    skill_registry.status AS status
      WITH SYNONYMS ('lifecycle status', 'stage')
      COMMENT = 'Lifecycle status, e.g. Pilot.',
    skill_registry.last_reviewed AS last_reviewed
      WITH SYNONYMS ('review date', 'last review', 'reviewed on')
      COMMENT = 'Date the skill was last reviewed. Org-approved skills must be reviewed every 90 days.',
    skill_registry.next_review_due AS DATEADD(day, 90, last_reviewed)
      WITH SYNONYMS ('review due date', 'next review')
      COMMENT = 'Date the next 90-day review is due.',
    skill_registry.days_since_review AS DATEDIFF(day, last_reviewed, CURRENT_DATE())
      WITH SYNONYMS ('review age')
      COMMENT = 'Days since the last review. More than 90 means the skill is due for review.',

    -- Test results
    test_results.skill AS skill
      WITH SYNONYMS ('tested skill')
      COMMENT = 'Skill that was tested.',
    test_results.version AS version
      WITH SYNONYMS ('skill version', 'tested version', 'release')
      COMMENT = 'Skill version that was tested (semver, e.g. 1.3.2). Versions were released in log order.',
    test_results.row_num AS row_num
      WITH SYNONYMS ('log order', 'row number')
      COMMENT = 'Position in the test log; higher is later.',
    test_results.case_number AS case_number
      WITH SYNONYMS ('test case', 'case')
      COMMENT = 'Test case number within the skill''s test file.',
    test_results.run_number AS run_number
      COMMENT = 'Run N of a repeated case (cases usually run 3 times). Empty when the log does not say.',
    test_results.raw_case_label AS raw_case_label
      WITH SYNONYMS ('case label')
      COMMENT = 'Case column exactly as logged, e.g. 2 (run 1 of 3, re-checked).',
    test_results.result AS result
      WITH SYNONYMS ('outcome detail')
      COMMENT = 'Result exactly as logged: Pass, Fail, Error, or Fail: <reason>.',
    test_results.outcome AS SPLIT_PART(result, ':', 1)
      WITH SYNONYMS ('pass or fail', 'test outcome', 'verdict')
      COMMENT = 'Pass, Fail or Error, without any reason suffix.',
    test_results.note AS note
      WITH SYNONYMS ('notes', 'comment', 'reason', 'evidence', 'what happened')
      COMMENT = 'Free-text note on the run: why it failed or anything notable. Automated runs start with "Auto:".',
    test_results.run_method AS IFF(is_manual, 'Claude app (by hand)', 'Automated runner')
      WITH SYNONYMS ('manual or automated', 'how it was run', 'run type', 'manual runs', 'by hand or automated')
      COMMENT = 'How the run was done. Claude app (by hand): run by hand in the Claude app, mostly graded by Claude in the chat; covers every run before the automated runner plus the app-only trigger tests. Automated runner: run and graded by scripts/run_tests.py, including re-checks of saved outputs.',
    test_results.is_manual AS is_manual
      WITH SYNONYMS ('by hand', 'manual')
      COMMENT = 'TRUE if the run was done by hand in the Claude app rather than by the automated runner.',
    test_results.is_recheck AS is_recheck
      WITH SYNONYMS ('correction', 're-check')
      COMMENT = 'TRUE for a re-check row that re-grades an earlier run after a grading fix. Not a new run.',
    test_results.is_smoke AS is_smoke
      WITH SYNONYMS ('smoke test')
      COMMENT = 'TRUE for a quick smoke run done before a full re-run.',
    test_results.is_superseded AS is_superseded
      WITH SYNONYMS ('corrected', 'overturned')
      COMMENT = 'TRUE if a later re-check row corrected this row''s result. Superseded rows are left out of pass and fail counts.',

    -- Requests
    skill_requests.request_id AS request_id
      COMMENT = 'Request number, e.g. 001.',
    skill_requests.requested_skill AS skill
      COMMENT = 'Skill the request became.',
    skill_requests.requested_by_team AS requested_by_team
      WITH SYNONYMS ('requester', 'requested by')
      COMMENT = 'Who asked, and their team.',
    skill_requests.original_ask AS original_ask
      COMMENT = 'The ask in the requester''s own words.',
    skill_requests.done_looks_like AS done_looks_like
      WITH SYNONYMS ('desired output', 'definition of done')
      COMMENT = 'What a finished output looks like.',
    skill_requests.systems_involved AS systems_involved
      WITH SYNONYMS ('systems', 'tools')
      COMMENT = 'Systems the task touches, e.g. Salesforce, Microsoft 365, Otter.ai.',
    skill_requests.must_never_happen AS must_never_happen
      WITH SYNONYMS ('guardrails', 'red lines')
      COMMENT = 'Things the skill must never do.',
    skill_requests.decision AS decision
      COMMENT = 'What was decided about the request.'
  )

  METRICS (
    test_results.run_count AS SUM(test_results.run_flag)
      WITH SYNONYMS ('number of runs', 'runs', 'total runs', 'how many runs')
      COMMENT = 'Number of test runs. Re-check rows are not counted, because they re-grade an earlier run.',
    test_results.graded_count AS SUM(test_results.graded_flag)
      COMMENT = 'Runs that count toward the pass rate (current Pass or Fail results).',
    test_results.pass_count AS SUM(test_results.pass_flag)
      WITH SYNONYMS ('passes', 'number passed')
      COMMENT = 'Runs whose current result is Pass.',
    test_results.fail_count AS SUM(test_results.fail_flag)
      WITH SYNONYMS ('fails', 'failures', 'number failed')
      COMMENT = 'Runs whose current result is Fail. Fails later corrected by a re-check are not counted.',
    test_results.manual_run_count AS SUM(test_results.manual_run_flag)
      WITH SYNONYMS ('manual runs', 'runs by hand', 'Claude app runs')
      COMMENT = 'Runs done by hand in the Claude app rather than by the automated runner.',
    test_results.pass_rate AS ROUND(100 * test_results.pass_count / NULLIF(test_results.graded_count, 0), 1)
      WITH SYNONYMS ('pass percentage', 'success rate', 'pass %')
      COMMENT = 'Percent (0-100) of current Pass or Fail results that are Pass. Uses corrected results: a run fixed by a re-check counts with its re-checked result.',

    skill_registry.skill_count AS COUNT(skill_registry.skill)
      WITH SYNONYMS ('number of skills')
      COMMENT = 'Number of skills.',
    skill_requests.request_count AS COUNT(skill_requests.request_id)
      WITH SYNONYMS ('number of requests')
      COMMENT = 'Number of skill requests.',
    skill_requests.weekly_minutes_by_hand AS SUM(skill_requests.frequency_per_week * skill_requests.minutes_per_task)
      COMMENT = 'Minutes per week the requested tasks take by hand, per requester estimates.'
  )

  COMMENT = 'Skill library governance: registry, test results and skill requests for the Acme Data Co. skill library (fictional).'

  AI_SQL_GENERATION 'Pass rate is a percentage from 0 to 100. Always use the pass_rate, pass_count and fail_count definitions, which leave out superseded rows (results later corrected by a re-check). Re-check rows are not new runs, so never count them as runs. Order versions by their first appearance in the test log (MIN(row_num)), not alphabetically. "Manual" or "by hand" means run_method = ''Claude app (by hand)'': run by hand in the Claude app and mostly graded by Claude in the chat, not by a person. "Automated" means run_method = ''Automated runner'' (scripts/run_tests.py). A skill is due for review when last_reviewed is more than 90 days before today.'

  AI_VERIFIED_QUERIES (
    pass_rate_by_skill_version AS (
      QUESTION 'What is the pass rate by skill and version?'
      VERIFIED_AT 1794700800
      ONBOARDING_QUESTION TRUE
      SQL 'SELECT t.skill, t.version, SUM(IFF(NOT t.is_superseded AND STARTSWITH(t.result, ''Pass''), 1, 0)) AS pass_count, SUM(IFF(NOT t.is_superseded AND (STARTSWITH(t.result, ''Pass'') OR STARTSWITH(t.result, ''Fail'')), 1, 0)) AS graded_count, ROUND(100 * pass_count / NULLIF(graded_count, 0), 1) AS pass_rate FROM test_results AS t GROUP BY t.skill, t.version ORDER BY t.skill, MIN(t.row_num)'
    ),
    versions_with_fails AS (
      QUESTION 'Which versions had fails, and what do the notes say?'
      VERIFIED_AT 1794700800
      ONBOARDING_QUESTION TRUE
      SQL 'SELECT t.skill, t.version, t.raw_case_label, t.result, t.note FROM test_results AS t WHERE STARTSWITH(t.result, ''Fail'') AND NOT t.is_superseded ORDER BY t.row_num'
    ),
    skills_due_for_review AS (
      QUESTION 'Which skills are due for review (last reviewed more than 90 days ago)?'
      VERIFIED_AT 1794700800
      ONBOARDING_QUESTION TRUE
      SQL 'SELECT r.skill, r.owner, r.last_reviewed, DATEADD(day, 90, r.last_reviewed) AS next_review_due, DATEDIFF(day, r.last_reviewed, CURRENT_DATE()) AS days_since_review FROM skill_registry AS r WHERE r.last_reviewed < DATEADD(day, -90, CURRENT_DATE()) ORDER BY r.last_reviewed'
    ),
    manual_run_count AS (
      QUESTION 'How many runs were manual?'
      VERIFIED_AT 1794700800
      ONBOARDING_QUESTION TRUE
      SQL 'SELECT SUM(IFF(t.is_manual AND NOT t.is_recheck, 1, 0)) AS manual_runs, SUM(IFF(t.is_recheck, 0, 1)) AS total_runs FROM test_results AS t'
    ),
    sales_call_recap_pass_rate_trend AS (
      QUESTION 'How did the pass rate change across sales-call-recap versions?'
      VERIFIED_AT 1794700800
      ONBOARDING_QUESTION TRUE
      SQL 'SELECT t.version, SUM(IFF(NOT t.is_superseded AND STARTSWITH(t.result, ''Pass''), 1, 0)) AS pass_count, SUM(IFF(NOT t.is_superseded AND (STARTSWITH(t.result, ''Pass'') OR STARTSWITH(t.result, ''Fail'')), 1, 0)) AS graded_count, ROUND(100 * pass_count / NULLIF(graded_count, 0), 1) AS pass_rate FROM test_results AS t WHERE t.skill = ''sales-call-recap'' GROUP BY t.version ORDER BY MIN(t.row_num)'
    )
  );

-- Read access down the ladder. Querying a semantic view needs SELECT on it.
GRANT SELECT ON SEMANTIC VIEW SKILL_LIBRARY.GOVERNANCE.SKILL_GOVERNANCE TO ROLE SKILL_MEMBER;
GRANT SELECT ON SEMANTIC VIEW SKILL_LIBRARY.GOVERNANCE.SKILL_GOVERNANCE TO ROLE SKILL_OWNER;

-- Quick check: pass rate by skill and version through the semantic view.
SELECT * FROM SEMANTIC_VIEW(
  SKILL_LIBRARY.GOVERNANCE.SKILL_GOVERNANCE
  DIMENSIONS test_results.skill, test_results.version
  METRICS test_results.run_count, test_results.pass_count, test_results.fail_count, test_results.pass_rate
)
ORDER BY skill, version;
