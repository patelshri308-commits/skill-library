-- =============================================================================
-- 03_role_demo.sql: proves Snowflake enforces the permission ladder.
-- Run after 01_setup.sql and load_governance.py. Run All works: the steps that
-- should fail are wrapped so they print the error instead of stopping the
-- worksheet. Each step's comment says what you should see.
--
-- The updates set fields to their current values (NULL = unchanged), so no data
-- changes. The one test result row added in step 2 is deleted in step 3.
-- =============================================================================

USE WAREHOUSE COMPUTE_WH;
USE SCHEMA SKILL_LIBRARY.GOVERNANCE;

-- Without this, every role granted to you stays active as a secondary role,
-- and ACCOUNTADMIN's privileges would make every step succeed.
USE SECONDARY ROLES NONE;

-- -----------------------------------------------------------------------------
-- Step 1. SKILL_MEMBER: read only
-- -----------------------------------------------------------------------------
USE ROLE SKILL_MEMBER;

-- Expected: 3 rows.
SELECT skill, owner, version FROM SKILL_REGISTRY ORDER BY skill;

-- Expected: 'BLOCKED as expected: ... Insufficient privileges ...'
EXECUTE IMMEDIATE $$
BEGIN
  UPDATE SKILL_LIBRARY.GOVERNANCE.SKILL_REGISTRY SET status = status WHERE skill = 'sales-call-recap';
  RETURN 'UNEXPECTED: SKILL_MEMBER updated SKILL_REGISTRY';
EXCEPTION
  WHEN OTHER THEN RETURN 'BLOCKED as expected: ' || SQLERRM;
END;
$$;

-- -----------------------------------------------------------------------------
-- Step 2. SKILL_OWNER, whose user owns sales-call-recap only (SKILL_OWNERSHIP)
-- -----------------------------------------------------------------------------
USE ROLE SKILL_OWNER;

-- Expected: 1 row: USER, <your user>, sales-call-recap.
SELECT principal_type, principal_name, skill FROM SKILL_OWNERSHIP;

-- Expected: 'BLOCKED as expected: ... Insufficient privileges ...'
-- Owners can't update tables directly, not even rows for their own skill.
EXECUTE IMMEDIATE $$
BEGIN
  UPDATE SKILL_LIBRARY.GOVERNANCE.SKILL_REGISTRY SET status = status WHERE skill = 'sales-call-recap';
  RETURN 'UNEXPECTED: SKILL_OWNER updated SKILL_REGISTRY directly';
EXCEPTION
  WHEN OTHER THEN RETURN 'BLOCKED as expected: ' || SQLERRM;
END;
$$;

-- Expected: 'Updated 1 row(s) for sales-call-recap as <your user>.'
CALL UPDATE_SKILL_REGISTRY('sales-call-recap', NULL, NULL, NULL);

-- Expected: 'Updated 0 row(s) for staffing-match as <your user> (you do not own this skill ...).'
CALL UPDATE_SKILL_REGISTRY('staffing-match', NULL, NULL, NULL);

-- Expected: 'BLOCKED as expected: ... Insufficient privileges ...'
EXECUTE IMMEDIATE $$
BEGIN
  INSERT INTO SKILL_LIBRARY.GOVERNANCE.TEST_RESULTS (row_num, skill, version, result)
    VALUES (-1, 'staffing-match', '1.2.0', 'Pass');
  RETURN 'UNEXPECTED: SKILL_OWNER inserted into TEST_RESULTS directly';
EXCEPTION
  WHEN OTHER THEN RETURN 'BLOCKED as expected: ' || SQLERRM;
END;
$$;

-- Expected: 'BLOCKED as expected: Refused: SKILL_OWNERSHIP does not map your user to this skill...'
EXECUTE IMMEDIATE $$
BEGIN
  CALL SKILL_LIBRARY.GOVERNANCE.ADD_TEST_RESULT(
    'staffing-match', '1.2.0', 1, NULL, NULL, 'Pass', 'DEMO row from 03_role_demo.sql', TRUE);
  RETURN 'UNEXPECTED: added a test result for a skill you do not own';
EXCEPTION
  WHEN OTHER THEN RETURN 'BLOCKED as expected: ' || SQLERRM;
END;
$$;

-- Expected: 'Added TEST_RESULTS row 184 for sales-call-recap 1.3.2 as <your user>...'
-- (one more than the last loaded row).
CALL ADD_TEST_RESULT('sales-call-recap', '1.3.2', 1, NULL, NULL, 'Pass', 'DEMO row from 03_role_demo.sql', TRUE);

-- -----------------------------------------------------------------------------
-- Step 3. PLATFORM_OWNER: everything works
-- -----------------------------------------------------------------------------
USE ROLE PLATFORM_OWNER;

-- Expected: number of rows updated = 1 each.
UPDATE SKILL_REGISTRY SET status = status WHERE skill = 'staffing-match';
UPDATE SKILL_REGISTRY SET status = status WHERE skill = 'sales-call-recap';

-- Expected: number of rows deleted = 1 (the demo row from step 2).
DELETE FROM TEST_RESULTS WHERE note = 'DEMO row from 03_role_demo.sql';

-- Expected: demo_rows_left = 0, test_result_rows = 183.
SELECT COUNT_IF(note = 'DEMO row from 03_role_demo.sql') AS demo_rows_left, COUNT(*) AS test_result_rows
FROM TEST_RESULTS;

-- Back to your usual session.
USE ROLE ACCOUNTADMIN;
USE SECONDARY ROLES ALL;
