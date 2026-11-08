# Test run 2026-11-08_105249

Mode: skill loads on its own. Repeat: 3.

## Pass counts

| Skill | Version | Pass | Fail | Error | Skipped |
| --- | --- | --- | --- | --- | --- |
| sales-call-recap | 1.3.0 | 12 | 3 | 0 | 0 |
| staffing-match | 1.2.0 | 18 | 0 | 0 | 0 |
| client-status-report | 1.3.0 | 17 | 1 | 0 | 0 |

## Results

| Skill | Case | Result | Note |
| --- | --- | --- | --- |
| sales-call-recap | 1 (run 1 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 1 (run 2 of 3) | Fail | Auto: failed: Every commitment in the email matches something Jordan said on the cal |
| sales-call-recap | 1 (run 3 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 2 (run 1 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 2 (run 2 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 2 (run 3 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 3 (run 1 of 3) | Fail | Auto: failed: No mention of today's date and no guesses about what happened after th |
| sales-call-recap | 3 (run 2 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 3 (run 3 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 5 (run 1 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 5 (run 2 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 5 (run 3 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 6 (run 1 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 6 (run 2 of 3) | Fail | Auto: failed: $40k is not treated as Acme's price, deal value or Quillbrook's budget |
| sales-call-recap | 6 (run 3 of 3) | Pass | Auto: all checks pass |
| staffing-match | 1 (run 1 of 3) | Pass | Auto: all checks pass |
| staffing-match | 1 (run 2 of 3) | Pass | Auto: all checks pass |
| staffing-match | 1 (run 3 of 3) | Pass | Auto: all checks pass |
| staffing-match | 2 (run 1 of 3) | Pass | Auto: all checks pass |
| staffing-match | 2 (run 2 of 3) | Pass | Auto: all checks pass |
| staffing-match | 2 (run 3 of 3) | Pass | Auto: all checks pass |
| staffing-match | 3 (run 1 of 3) | Pass | Auto: all checks pass |
| staffing-match | 3 (run 2 of 3) | Pass | Auto: all checks pass |
| staffing-match | 3 (run 3 of 3) | Pass | Auto: all checks pass |
| staffing-match | 4 (run 1 of 3) | Pass | Auto: all checks pass |
| staffing-match | 4 (run 2 of 3) | Pass | Auto: all checks pass |
| staffing-match | 4 (run 3 of 3) | Pass | Auto: all checks pass |
| staffing-match | 5 (run 1 of 3) | Pass | Auto: all checks pass |
| staffing-match | 5 (run 2 of 3) | Pass | Auto: all checks pass |
| staffing-match | 5 (run 3 of 3) | Pass | Auto: all checks pass |
| staffing-match | 6 (run 1 of 3) | Pass | Auto: all checks pass |
| staffing-match | 6 (run 2 of 3) | Pass | Auto: all checks pass |
| staffing-match | 6 (run 3 of 3) | Pass | Auto: all checks pass |
| client-status-report | 1 (run 1 of 3) | Pass | Auto: all checks pass |
| client-status-report | 1 (run 2 of 3) | Pass | Auto: all checks pass |
| client-status-report | 1 (run 3 of 3) | Pass | Auto: all checks pass |
| client-status-report | 2 (run 1 of 3) | Pass | Auto: all checks pass |
| client-status-report | 2 (run 2 of 3) | Pass | Auto: all checks pass |
| client-status-report | 2 (run 3 of 3) | Pass | Auto: all checks pass |
| client-status-report | 3 (run 1 of 3) | Pass | Auto: all checks pass |
| client-status-report | 3 (run 2 of 3) | Pass | Auto: all checks pass |
| client-status-report | 3 (run 3 of 3) | Fail | Auto: failed: A client executive could understand every line without asking what it  |
| client-status-report | 4 (run 1 of 3) | Pass | Auto: all checks pass |
| client-status-report | 4 (run 2 of 3) | Pass | Auto: all checks pass |
| client-status-report | 4 (run 3 of 3) | Pass | Auto: all checks pass |
| client-status-report | 5 (run 1 of 3) | Pass | Auto: all checks pass |
| client-status-report | 5 (run 2 of 3) | Pass | Auto: all checks pass |
| client-status-report | 5 (run 3 of 3) | Pass | Auto: all checks pass |
| client-status-report | 6 (run 1 of 3) | Pass | Auto: all checks pass |
| client-status-report | 6 (run 2 of 3) | Pass | Auto: all checks pass |
| client-status-report | 6 (run 3 of 3) | Pass | Auto: all checks pass |

Total cost reported by the CLI: $8.01

## Run these in the Claude app

- sales-call-recap Case 4 (1.3.0): "Recap this call.". Trigger test: whether the skill loads in the Claude app.
- sales-call-recap Case 7 (1.3.0): "What's a good way to structure a discovery call?". Negative trigger test: the skill must not load in the Claude app.
- client-status-report Case 7 (1.3.0): "turn these notes into this weeks report". Trigger test: whether the skill loads instead of the app's built-in docs skill.
