# Test run 2026-11-09_131023

Mode: skill loads on its own. Repeat: 3.

## Pass counts

| Skill | Version | Pass | Fail | Error | Skipped |
| --- | --- | --- | --- | --- | --- |
| sales-call-recap | 1.3.2 | 13 | 2 | 0 | 0 |

## Results

| Skill | Case | Result | Note |
| --- | --- | --- | --- |
| sales-call-recap | 1 (run 1 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 1 (run 2 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 1 (run 3 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 2 (run 1 of 3) | Fail | Auto: failed: Follow-up email is under 150 words |
| sales-call-recap | 2 (run 2 of 3) | Fail | Auto: failed: Follow-up email is under 150 words |
| sales-call-recap | 2 (run 3 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 3 (run 1 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 3 (run 2 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 3 (run 3 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 5 (run 1 of 3) | Pass | Auto: all checks pass (Case 2 failed 2 of 3 this run) |
| sales-call-recap | 5 (run 2 of 3) | Pass | Auto: all checks pass (Case 2 failed 2 of 3 this run) |
| sales-call-recap | 5 (run 3 of 3) | Pass | Auto: all checks pass (Case 2 failed 2 of 3 this run) |
| sales-call-recap | 6 (run 1 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 6 (run 2 of 3) | Pass | Auto: all checks pass |
| sales-call-recap | 6 (run 3 of 3) | Pass | Auto: all checks pass |

Total cost reported by the CLI: $2.98

## Run these in the Claude app

- sales-call-recap Case 4 (1.3.2): "Recap this call.". Trigger test: whether the skill loads in the Claude app.
- sales-call-recap Case 7 (1.3.2): "What's a good way to structure a discovery call?". Negative trigger test: the skill must not load in the Claude app.
