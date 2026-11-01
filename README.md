# Skill library for Acme Data Co.

A small governed library of Claude skills for a fictional 40-person consultancy: three tested skills, plus the rules, registry and test history a company needs to trust them. Acme and all sample data here are made up.

## What's inside

- `skills/`: three skills, one each for Sell, Staff and Deliver
- `REGISTRY.md`: every skill with its owner, version and status
- `tests/`: test cases built to break the skills, with every run in `RESULTS.md`
- `CHANGELOG.md`: what changed and why
- `guides/`: a one-page how-to for each skill
- `requests/`: how a vague ask becomes a skill
- `scripts/check_registry.py`: checks that every skill is registered, named, tested and documented

## Try it

1. Add a folder from `skills/` to Claude from your skills settings.
2. Start a chat and attach a file from `sample-data/`, such as `call-transcript-01.txt`.
3. Ask for what the skill does: "Recap this call and draft the follow-up."

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
