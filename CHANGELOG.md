# Changelog

All skill changes, newest first, with the reason for each.

## 2026-11-08
- sales-call-recap 1.3.1: two rule fixes from the first automated run
  (`tests/runs/2026-11-08_105249/`, `tests/FIX_BACKLOG.md` issues 8 and 9).
  - The email keeps each commitment as firm as it was said ("we can" stays "we can"),
    with no possibilities turned into promises and no timing the rep didn't give. Behind
    it: Case 1 run 2, which turned "We can build that into how we roll it out" into
    "We'll build that into how we approach the rollout."
  - Budget signals holds only what the prospect said about budget for this project. Past
    spend on other work never goes there and, if it matters, appears once under Pain
    points or current tools as history. Replaces the "report past spend as background"
    rule. Behind it: Case 6 run 2, which followed that rule but listed "Background: the
    earlier freelancer engagement cost $40k" under Budget signals.
- Added `scripts/run_tests.py`, an automated test runner using Claude Code's headless mode,
  and `tests/auto_checks.json` for each case's input and deterministic checks. Grading by
  hand took a reviewer per run and drifted between reviewers: two reviews flagged the
  staffing table's columns as drift when the spec already had them. Each case now runs in
  an isolated temp directory, is checked by code where possible and by a strict judge for
  the rest, and is saved under `tests/runs/`. No skill, checklist or registry changes.
- First automated run of the current versions (`tests/runs/2026-11-08_105249/`, three runs
  per case): sales-call-recap 1.3.0 passed 12 of 15, staffing-match 1.2.0 18 of 18,
  client-status-report 1.3.0 17 of 18. Every fail was reviewed by hand. Two were real
  (`tests/FIX_BACKLOG.md` issues 8 and 9). In the other two, the judge failed wording it
  had passed in another run of the same case.
- Tests: reworded the two checklist items behind those judge fails. sales-call-recap
  Cases 1 and 3: "today" in the email draft (as in "Thanks for your time today") is fine.
  client-status-report Case 3: everyday project words like testing environment, data feed
  and sign-off count as plain.
- REGISTRY.md: Last reviewed set to 2026-11-08 for all three skills.

## 2026-11-07
Fixes from the 2026-11-07 regression round. Row references are to `tests/RESULTS.md`.

- All skills: added the required rule "Work only from the input's own dates. Never refer
  to today's date or speculate about what has happened since." It's now a library standard
  in README, and `check_registry.py` fails without it. Behind it: sales-call-recap 1.2.0
  Cases 1, 2, 3 (runs 1-3) and 5, which called the recap "overdue" or asked whether the
  invite had gone out "today"; client-status-report 1.2.0 Case 1 and Case 5 run 3.
- sales-call-recap 1.3.0:
  - Description now covers short or off-topic transcripts shared for a recap. Behind it:
    Case 4 failed because the skill never loaded.
  - The response starts with Opportunity notes and ends with Flagged for the rep, or right
    after saying the transcript is too short, with no preamble or offers of further work.
    Behind it: Case 1 ("overdue" note after Flagged), Case 2 ("send today" preamble),
    Case 3 runs 1 and 3 (paragraph after Flagged), Case 5 (summary before Opportunity notes).
  - Comments on individuals' credibility, standing or conflicts stay out of Description
    and may go in Call details. Behind it: Case 3 runs 2 ("damaging argument") and 3
    (sponsor credibility).
  - The follow-up email holds only commitments stated on the call. Behind it: Case 5
    ("We'll also plan with you how to bring the depot managers along").
  - NextStep is one line under 255 characters, the Salesforce field limit: action, owner
    and date. Behind it: Cases 1 and 2 (3 sentences each) and Case 3 run 2 (no owner).
  - Flagged items are quoted neutrally with their timestamp, without characterizing
    intent. Behind it: Case 1 ("This was a joke") and Case 2 ("It was clearly a joke").
- staffing-match 1.2.0:
  - If no one meets the seniority asked for, recommend the closest match and say so in
    Gaps and risks. Behind it: Cases 2 and 5, which picked Marcus for a senior role
    with no written rule.
  - A current project is not a skill. Behind it: Case 4, which got this right but
    without a rule backing it.
  - The table columns (Role | Recommended | Availability | Backup | Why | Gaps and
    risks) were already in the spec; no change. Cases 2 and 3 logged this as drift by mistake.
- client-status-report 1.3.0:
  - Description is now more specific than a general document skill, says to use it
    instead for weekly reports, and allows delivery as a document. Behind it: Case 1
    "Fail: collision", where the built-in docs skill loaded instead.
  - template.md gained a Milestones table (Milestone | Planned | Current outlook).
    Behind it: Case 5 run 3 added a Milestones section on its own.
  - After the report: "Left out of the report" and "Check before sending", replacing
    "Left out for your review". Behind it: Case 5 run 2 mixed review notes into the
    left-out list.

## 2026-10-31
- sales-call-recap 1.2.0: StageName, Amount and CloseDate now hold values only, after a
  Case 6 run put a paragraph in StageName, a Salesforce picklist. Added a rule against
  using past spend as a budget reference, after a borderline run called a $40k freelancer
  fee "the only reference point". Flags now carry timestamps and cover CRM requests.
- staffing-match 1.1.0: added a rule to list no consultants until the project's skills
  and dates are known. All 4 Case 6 runs listed everyone at 50% or more, which works
  as a shortlist before the dates that decide availability are known.
- client-status-report 1.2.0: added plain-language and risk-owner rules after 3 of 18
  runs failed. Two kept terms like "sales mart", and one named an owner the notes didn't
  assign. Three runs per case found these; the first single-run round did not.
- sales-call-recap 1.1.0: added a Call details section and a sentence check after
  every full recap ran 7-9 sentences against a limit of 5. Added "Flagged for the rep"
  because injection attempts were ignored but the rep was never told about them.
- client-status-report 1.1.0: added a rule keeping internal matters out of client
  reports, after a run put compute costs in a report even though its checklist passed.
  Added a "Left out for your review" list and the draft-only rule CLAUDE.md requires.
- sales-call-recap 1.0.0: first version, piloting with sales enablement.
- staffing-match 1.0.0: first version, piloting with the staffing lead.
- client-status-report 1.0.0: first version, piloting with the delivery lead.
