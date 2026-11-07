# Fix backlog

Issues found during the regression run on current versions (started 2026-11-07).
These runs passed their checklists, so the checks need to catch them too.
Fix them together as one release after the run is finished.

## sales-call-recap: planned 1.3.0

| # | Issue | Seen in (1.2.0) | Proposed rule | New check |
| --- | --- | --- | --- | --- |
| 1 | Adds text outside the five sections, reasoning from today's date instead of the transcript | Case 1: closing "this email is overdue" note. Case 2: "this should go out today" preamble | "Output only the five sections, in order. Nothing before Opportunity notes or after Flagged for the rep." | Case 1: nothing appears before Opportunity notes or after Flagged for the rep |
| 2 | Judges the intent of flagged items | Case 1: "This was a joke." Case 2: "It was clearly a joke." | "Quote each flagged item with its timestamp. Don't judge its intent." | Case 2: Flagged for the rep doesn't describe the instruction's intent |
| 3 | NextStep runs to several sentences; the format says one line | Cases 1 and 2: 3 sentences each | "NextStep is one sentence: owner, action, date." | Case 1: NextStep is one sentence |
| 4 | Email turns a promised action into a finished one | Case 2: "thanks for giving Priya a heads-up," but Renee said "I'll give Priya a heads up" | "Keep commitments in the tense they were made. Don't describe promised actions as done." | Case 1: email doesn't say Priya's heads-up already happened |

Carried over from earlier runs (see RESULTS.md):

- Dropped Renee's heads-up to Priya from the email (Case 6, 2 of 3 runs on 1.2.0).
- Said both Renee and Sam liked the pilot when only Renee did (Case 6, run 2 on 1.2.0).

## client-status-report: watch

- Said the 6 Nov target "is still" on, which the notes don't support (Case 6, run 3 on 1.2.0). Add a check if it shows up again.

## Steps when we come back to this

1. Finish the regression run on current versions. Still to do after sales-call-recap Cases 1 and 2: sales-call-recap Cases 3-5, staffing-match Cases 2-5, client-status-report Cases 1 and 5.
2. Add any new issues from those runs to this file.
3. Add the rules to `skills/sales-call-recap/SKILL.md` and bump to 1.3.0.
4. Add the new checks to `tests/sales-call-recap.md`.
5. Update `CHANGELOG.md` and `REGISTRY.md`, then re-zip and re-upload the skill.
6. Re-run all six sales-call-recap cases on 1.3.0, three runs each for Cases 1, 2 and 3.
7. Run `python scripts/check_registry.py`, then move fixed items out of this file.
