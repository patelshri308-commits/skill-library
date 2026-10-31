# Skill library for Acme Data Co.

Acme Data Co. is a fictional company. All sample data in this repo is made up.

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
- Skills have not been tested yet, and tests will only use made-up sample data.
- Skills work from pasted or uploaded text. No live connectors to Salesforce, Otter.ai or Microsoft 365 are set up.
- The ladder is a written policy. Nothing yet stops someone editing a skill they don't own.
- Usage isn't tracked, so the 60-day retirement rule can't be measured yet.
