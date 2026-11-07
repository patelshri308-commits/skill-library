# Fix backlog

Issues found during the regression run on current versions (started 2026-11-07).
These runs passed their checklists, so the checks need to catch them too.
Fix them together as one release after the run is finished.

## sales-call-recap: planned 1.3.0

Version stays 1.3.0. Issues 1-3 are planned for 1.3.0; issues 4-6 are watching. Final scope is decided after the test round.

| # | Status | Issue | Seen in (1.2.0) | Proposed rule | New check |
| --- | --- | --- | --- | --- | --- |
| 1 | Planned for 1.3.0 | Compares the call to today's date and guesses what has or hasn't happened since. The guesses are unfounded: nothing in the transcript says what happened after the call. It shows up as extra text outside the sections and inside allowed ones | Case 1: closing "this email is overdue" note. Case 2: "this should go out today" preamble. Case 3 (run 1 of 3): closing paragraph saying the recap "doesn't appear to have gone out." Case 3 (run 2 of 3): ended after Flagged, but the first open question asked "Has the Nov 12 invite gone out? Today is Nov 7." Case 3 (run 3 of 3): paragraph after Flagged referring to today's date | Root-cause fix: "Write the recap as if it's being produced right after the call. Don't refer to today's date or speculate about what has happened since." End of output: "The response ends with Flagged for the rep. Nothing comes after it." Start of output: "Begin with Opportunity notes. Nothing comes before it." | Cases 1, 2 and 3: no mention of today's date and no guesses about what happened after the call, anywhere in the output. Nothing before Opportunity notes or after Flagged for the rep |
| 2 | Planned for 1.3.0 | Judges the intent of flagged items | Case 1: "This was a joke." Case 2: "It was clearly a joke." | "Quote each flagged item with its timestamp. Don't judge its intent." | Case 2: Flagged for the rep doesn't describe the instruction's intent |
| 3 | Planned for 1.3.0 | NextStep runs to several sentences; the format says one line | Cases 1 and 2: 3 sentences each. Case 3 (run 2 of 3): no owner named for the Nov 12 session (Case 3 doesn't check owners; Case 2 does) | "NextStep is one sentence: owner, action, date." | Case 1: NextStep is one sentence. Case 3: NextStep names an owner |
| 4 | Watching | Email turns a promised action into a finished one | Case 2: "thanks for giving Priya a heads-up," but Renee said "I'll give Priya a heads up" | "Keep commitments in the tense they were made. Don't describe promised actions as done." | Case 1: email doesn't say Priya's heads-up already happened |
| 5 | Watching | Broadens data-handling commitments beyond what was said | Case 3 (run 1 of 3): "anonymized sample," but Sam said "with the driver names stripped out" (4:27). The reviewer counts this as the third run with drifted wording; the earlier two aren't in RESULTS.md. Didn't recur in Case 3 (run 2 of 3), which used "driver names removed" | "Use the transcript's exact wording for data-handling commitments." | Case 1: the sample is described as having driver names removed, not as anonymized |
| 6 | Watching | Puts comments about individuals' standing or credibility in the Description, a CRM field | Case 3 (run 2 of 3): definitions caused a "damaging argument" in a leadership meeting. Case 3 (run 3 of 3): sponsor's credibility. The transcript has Renee saying "I lost a lot of credibility in that room" (1:27) | "Keep comments about individuals' standing, credibility or internal conflicts out of Description; they may appear in Call details." | Case 3: Description doesn't mention anyone's credibility, standing or internal conflict |

Notes on issue 1:

- Root cause found: all three Case 3 runs point to the same cause. Runs 1 and 3 reasoned about today's date in a paragraph after Flagged. Run 2 did the same inside an open question. An end-of-output rule alone would have passed run 2, so the main fix targets the date reasoning directly. The end-of-output rule stays as a backstop.
- Seen in 3 of 3 Case 3 runs and 5 runs across Cases 1-3.
- `SKILL.md` 1.2.0 has no end-of-output or date rule yet; the 1.2.0 format just ends with Flagged for the rep. So these rules are new, not rewordings of a shipped rule.
- The Gmail offer the reviewer mentioned is the same kind of extra output: helpful-sounding, unrequested and outside the spec. That run isn't logged in RESULTS.md.

Checked and not an issue: Case 3 run 1 has no Closed Won flag. That's expected, because the Closed Won request only exists in the Case 6 version of the transcript. In `call-transcript-01.txt`, the 5:04 line is just Renee's heads-up to Priya.

Carried over from earlier runs (see RESULTS.md):

- Dropped Renee's heads-up to Priya from the email (Case 6, 2 of 3 runs on 1.2.0).
- Said both Renee and Sam liked the pilot when only Renee did (Case 6, run 2 on 1.2.0).

Note on issue 6: it first showed up in run 2 and came back in run 3. It's in the table but marked Watching until scope is final. `SKILL.md` 1.2.0 has no rule about interpersonal detail; the 1.1.0 changes were Call details and the sentence check. The proposed rule is new, and it sends the detail to Call details rather than dropping it.

## client-status-report: watch

- Said the 6 Nov target "is still" on, which the notes don't support (Case 6, run 3 on 1.2.0). Add a check if it shows up again.

## Steps when we come back to this

1. Finish the regression run on current versions. Still to do: sales-call-recap Case 3 run 3, Cases 4-5, staffing-match Cases 2-5, client-status-report Cases 1 and 5.
2. Add any new issues from those runs to this file.
3. Add the rules to `skills/sales-call-recap/SKILL.md` and bump to 1.3.0.
4. Add the new checks to `tests/sales-call-recap.md`.
5. Update `CHANGELOG.md` and `REGISTRY.md`, then re-zip and re-upload the skill.
6. Re-run all six sales-call-recap cases on 1.3.0, three runs each for Cases 1, 2 and 3.
7. Run `python scripts/check_registry.py`, then move fixed items out of this file.
