# Skill library for Acme Data Co.

A small governed library of Claude skills for a fictional 40-person consultancy: three tested skills, plus the rules, registry and test history a company needs to trust them. Acme and all sample data here are made up.

## What's inside

- `skills/`: three skills, one each for Sell, Staff and Deliver
- `REGISTRY.md`: every skill with its owner, version and status
- `tests/`: test cases built to break the skills, with every run in `RESULTS.md`
- `CHANGELOG.md`: what changed and why
- `guides/`: a one-page how-to for each skill
- `requests/`: how a vague ask becomes a skill
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

Every test run is logged in `tests/RESULTS.md`: 94 runs so far, 88 passed, across all versions. The current versions (`sales-call-recap` 1.3.0, `staffing-match` 1.2.0, `client-status-report` 1.3.0) haven't been re-run yet; their pass rates go here once they are.

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
