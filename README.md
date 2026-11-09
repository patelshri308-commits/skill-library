# Skill library for Acme Data Co.

A small governed library of Claude skills for a fictional 40-person consultancy: three tested skills, plus the rules, registry and test history a company needs to trust them. Acme and all sample data here are made up.

## What's inside

- `skills/`: three skills, one each for Sell, Staff and Deliver
- `REGISTRY.md`: every skill with its owner, version and status
- `tests/`: test cases built to break the skills, with every run in `RESULTS.md`
- `CHANGELOG.md`: what changed and why
- `guides/`: a one-page how-to for each skill
- `requests/`: how a vague ask becomes a skill
- `scripts/run_tests.py`: runs the test cases with Claude Code and grades them (see Running the tests)
- `scripts/check_registry.py`: checks that every skill is registered, named, tested, documented and has the required rules

## Try it

1. Add a folder from `skills/` to Claude from your skills settings.
2. Start a chat and attach a file from `sample-data/`, such as `call-transcript-01.txt`.
3. Ask for what the skill does: "Recap this call and draft the follow-up."

## Results

### Time saved

Each output was written once by hand and once with the skill (one timed run per skill, 2026-11-08). The skill time includes reviewing the output and fixing anything before it was ready to send.

| Skill | By hand | With the skill, incl. review | Time saved | Reduction |
| --- | --- | --- | --- | --- |
| `sales-call-recap` | 7:16 | 1:52 | 5:24 | 74% |
| `client-status-report` | 5:07 | 1:52 | 3:15 | 64% |
| `staffing-match` | 3:28 | 1:35 | 1:53 | 54% |
| All three | 15:51 | 5:19 | 10:32 | 66% |

Treat these as a floor. The sample call is 6 minutes long, and the person timing it had read every sample file many times. A rep working from a fresh, full-length call would take longer by hand. Timing a full-length call is the next step.

### Testing

Every test run is logged in `tests/RESULTS.md`: 178 runs across all versions. Since 2026-11-08 the runs are automated with `scripts/run_tests.py`: three runs per case, checked by code where possible and by a Claude judge for the rest, with every fail reviewed by hand. Latest results on the current versions:

| Skill | Version | Passed | Run |
| --- | --- | --- | --- |
| `sales-call-recap` | 1.3.2 | 15 of 15 | 2026-11-09 |
| `staffing-match` | 1.2.0 | 18 of 18 | 2026-11-08 |
| `client-status-report` | 1.3.0 | 17 of 18, then Case 3 3 of 3 after rewording its checklist item | 2026-11-08 |

Reviewing every fail by hand is part of the process, because the grading can be wrong too. It found two checklist items the judge scored inconsistently, and a bug in the email word count that failed four emails that were under the limit. Both were fixed and logged in `tests/FIX_BACKLOG.md`. The trigger cases depend on the Claude app itself and are run there by hand.

## Running the tests

`scripts/run_tests.py` runs each test case in `tests/<skill>.md` with Claude Code's headless mode, grades it and saves the results.

**Requirements:** Claude Code installed and signed in (`claude` on your PATH), and Python 3.10 or later. No other dependencies. Every case makes two `claude -p` calls, one to run the skill and one to grade it, and both count against your plan's usage. One Case 1 run cost about $0.20 as reported by the CLI.

**Commands:**

```bash
python3 scripts/run_tests.py --dry-run                           # list what would run; no Claude calls
python3 scripts/run_tests.py --skill sales-call-recap --case 1   # one case
python3 scripts/run_tests.py --repeat 3 --log                    # every case 3 times, logged to RESULTS.md
python3 scripts/run_tests.py --invoke                            # start prompts with /skill-name
```

Without `--log`, nothing is written to `tests/RESULTS.md`. Every run saves to `tests/runs/<timestamp>/`: the prompt, the raw stream, the output, the judge's JSON, the check results and a `summary.md` with pass counts and total cost.

**Automated and manual cases:** 17 cases run automatically. Three test whether a skill triggers in the Claude app, including the clash with the app's built-in docs skill, which Claude Code can't reproduce: sales-call-recap Cases 4 and 7, and client-status-report Case 7. The script skips them and lists them, with their prompts, under "Run these in the Claude app".

**How grading works:**

1. **Isolation.** Each case runs in a fresh temp directory holding only copies of the three skills. The run can't see this repo, its CLAUDE.md or the checklists. `--setting-sources project` keeps out personal skills, skills synced from claude.ai, plugins and MCP servers.
2. **Prompt.** The case's Prompt line plus the input, as if pasted into a chat, so the skill has to load on its own. The stream-json output shows whether it loaded and that it was the repo's copy. A skill that didn't load is "Fail: not loaded".
3. **Deterministic checks.** Code checks what it can verify reliably: the output's first and last sections, NextStep length, email word count, required timestamps, names that must not be recommended, and no reference to today's date. These live in `tests/auto_checks.json` with each case's input.
4. **Judge.** A second `claude -p` call, with no skills and no tools, grades every checklist item and returns pass/fail with one line of evidence each. It's told to be strict and fail anything it's unsure about.
5. **Result.** A case passes only if every check and every checklist item passes. A crash or timeout is logged as "Error", not "Fail". Logged notes start with "Auto:".
6. **Conditions.** A condition in a test file, such as "only if Case 2 passes", is for testing by hand. Automated runs run the case anyway; if the condition wasn't met, the Note says so, for example "Auto: all checks pass (Case 2 failed 1 of 3 this run)".

## Purpose

One approved set of Claude skills for Acme's Sell, Staff and Deliver teams, replacing personal versions.

## Permission ladder

| Tier | Who can create | Review before use | Who can use it |
| --- | --- | --- | --- |
| Personal | Anyone | None | The creator |
| Team | Anyone on the team | One teammate | That team |
| Org-approved | Submitted through a request | Platform owner plus the function's owner; passes its tests | Everyone; only the owner can edit |
| Retired | — | Owner flags low use or a replacement | No one; kept in the changelog |

## Naming

Skill folders are named function-task, lowercase with hyphens (`sales-call-recap`).

## Required in every skill

Every `SKILL.md` must include this rule, word for word:

> Work only from the input's own dates. Never refer to today's date or speculate about what has happened since.

In the 2026-11-07 test round, all three skills compared their input to today's date and guessed what had happened since, such as calling a recap "overdue". `scripts/check_registry.py` fails if any skill is missing the rule.

## Versioning

- **Major:** an output-format change people depend on.
- **Minor:** a new capability.
- **Patch:** wording fixes.

## Ownership and review

Every org-approved skill has one named owner and is reviewed every 90 days. Skills unused for 60 days, or replaced, are retired.

## Known limitations

- All three skills are pilots. None has been approved for org-wide use.
- Skills have only been tested on made-up sample data, with Claude grading most runs.
- Skills work from pasted or uploaded text. No live connectors to Salesforce, Otter.ai or Microsoft 365 are set up.
- The ladder is a written policy. Nothing yet stops someone editing a skill they don't own.
- Usage isn't tracked, so the 60-day retirement rule can't be measured yet.
