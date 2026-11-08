# Fix backlog

Issues found during the regression run on current versions (started 2026-11-07).
These runs passed their checklists, so the checks need to catch them too.
Fix them together as one release after the run is finished.

Update 2026-11-08: the current versions were re-run with `scripts/run_tests.py`, three runs per automated case (`tests/runs/2026-11-08_105249/`). The statuses below reflect that run. The manual trigger cases (sales-call-recap 4 and 7, client-status-report 7) still need a run in the Claude app.

## sales-call-recap: planned 1.3.0

Shipped 2026-11-08: 1.3.1 for issues 8 and 9, awaiting re-run.

1.3.0 covers issues 1, 2, 3, 6, 7 and 8 (fix pass 2026-11-07). Issues 4 and 5 are still watching. Issue 7's negative check is Case 7 in the tests. Issue 2 shipped as "Quote them neutrally. Don't characterize their intent", and issue 3 as "one line under 255 characters (the Salesforce field limit): action, owner and date".

| # | Status | Issue | Seen in (1.2.0) | Proposed rule | New check |
| --- | --- | --- | --- | --- | --- |
| 1 | Verified 2026-11-08: no date reasoning or speculation in Cases 1, 2, 3 and 5 (12 runs). One Case 3 run failed for "Thanks for your time today" in the email; that's allowed, and the checklist now says so (see G1) | Compares the call to today's date and guesses what has or hasn't happened since. The guesses are unfounded: nothing in the transcript says what happened after the call. It shows up as extra text outside the sections and inside allowed ones | Case 1: closing "this email is overdue" note. Case 2: "this should go out today" preamble. Case 3 (run 1 of 3): closing paragraph saying the recap "doesn't appear to have gone out." Case 3 (run 2 of 3): ended after Flagged, but the first open question asked "Has the Nov 12 invite gone out? Today is Nov 7." Case 3 (run 3 of 3): paragraph after Flagged referring to today's date. Case 5: open question said "Today is Nov 7… the written recap is overdue" ("overdue" is a guess too), and a summary paragraph came before Opportunity notes, though the response ended at Flagged | Root-cause fix: "Write the recap as if it's being produced right after the call. Don't refer to today's date or speculate about what has happened since." End of output: "The response ends with Flagged for the rep. Nothing comes after it." Start of output: "Begin with Opportunity notes. Nothing comes before it." | Cases 1, 2 and 3: no mention of today's date and no guesses about what happened after the call, anywhere in the output. Nothing before Opportunity notes or after Flagged for the rep |
| 2 | Verified 2026-11-08: Case 2 passed 3 of 3 | Judges the intent of flagged items | Case 1: "This was a joke." Case 2: "It was clearly a joke." | "Quote each flagged item with its timestamp. Don't judge its intent." | Case 2: Flagged for the rep doesn't describe the instruction's intent |
| 3 | Verified 2026-11-08: NextStep one line under 255 characters with an owner in Cases 1, 2 and 3 (9 runs) | NextStep runs to several sentences; the format says one line | Cases 1 and 2: 3 sentences each. Case 3 (run 2 of 3): no owner named for the Nov 12 session (Case 3 doesn't check owners; Case 2 does) | "NextStep is one sentence: owner, action, date." | Case 1: NextStep is one sentence. Case 3: NextStep names an owner |
| 4 | Watching: didn't recur 2026-11-08 (Priya's heads-up stayed a future action in all 15 runs) | Email turns a promised action into a finished one | Case 2: "thanks for giving Priya a heads-up," but Renee said "I'll give Priya a heads up" | "Keep commitments in the tense they were made. Don't describe promised actions as done." | Case 1: email doesn't say Priya's heads-up already happened |
| 5 | Watching: recurred 2026-11-08 in Case 5 run 1 of 3 (NextStep says "anonymized dispatch sample"). Case 5 doesn't check this, so the run passed | Broadens data-handling commitments beyond what was said | Case 3 (run 1 of 3): "anonymized sample," but Sam said "with the driver names stripped out" (4:27). The reviewer counts this as the third run with drifted wording; the earlier two aren't in RESULTS.md. Didn't recur in Case 3 (run 2 of 3), which used "driver names removed" | "Use the transcript's exact wording for data-handling commitments." | Case 1: the sample is described as having driver names removed, not as anonymized |
| 6 | Verified 2026-11-08: Case 3 passed this item 3 of 3 | Puts comments about individuals' standing or credibility in the Description, a CRM field | Case 3 (run 2 of 3): definitions caused a "damaging argument" in a leadership meeting. Case 3 (run 3 of 3): sponsor's credibility. The transcript has Renee saying "I lost a lot of credibility in that room" (1:27) | "Keep comments about individuals' standing, credibility or internal conflicts out of Description; they may appear in Call details." | Case 3: Description doesn't mention anyone's credibility, standing or internal conflict |
| 7 | Done in 1.3.0, awaiting a manual run of Cases 4 and 7 in the Claude app | Skill doesn't trigger on short or off-topic calls. The frontmatter description only covers "a sales or discovery call transcript," so Claude answers directly and the small-talk rule in the body never runs | Case 4: Claude judged the call non-sales and answered without the skill | Frontmatter description: "Turns a call transcript into Salesforce opportunity notes and a follow-up email draft. Use whenever someone shares a call transcript (for example from Otter.ai) and asks for a recap, CRM notes or a follow-up, even if the call is short or turns out to have no sales content." | Case 4: the skill loads. Plus a negative check: a request with no call transcript doesn't load the skill |
| 8 | Done in 1.3.1, awaiting re-run. Reopened 2026-11-08: Case 1 run 2 of 3 turned "We can build that into how we roll it out" into "We'll build that into how we approach the rollout." Shipped as "Keep each commitment as firm as it was said" | Email adds commitments Jordan didn't make on the call | Case 5: "We'll also plan with you how to bring the depot managers along." The reviewer saw the same line in an earlier run, which isn't in RESULTS.md. At 5:26 Jordan only said "We can build that into how we roll it out," which isn't a promise to plan it with the client | "The email commits Acme only to actions the rep stated on the call, in the rep's own scope." | Case 1: every commitment in the email matches something Jordan said, with no joint plans he didn't offer |
| 9 | Done in 1.3.1, awaiting re-run | Treats an unrelated past cost as a budget signal | Found 2026-11-08 on 1.3.0: Case 6 run 2 of 3 listed "Background: the earlier freelancer engagement cost $40k" under Budget signals | "Budget signals holds only what the prospect said about budget for this project. Costs of past vendors or other projects stay out." | Case 6 already checks this. Possible code check: $40k doesn't appear under Budget signals |

Notes on issue 1:

- Root cause found: all three Case 3 runs point to the same cause. Runs 1 and 3 reasoned about today's date in a paragraph after Flagged. Run 2 did the same inside an open question. An end-of-output rule alone would have passed run 2, so the main fix targets the date reasoning directly. The end-of-output rule stays as a backstop.
- Seen in 3 of 3 Case 3 runs and 6 runs across Cases 1, 2, 3 and 5: the best-evidenced issue in the backlog. (The reviewer called Case 5 the 4th occurrence; counting every run that referred to today's date, it's the 6th.)
- Case 5 kept the end of the output clean but added a summary paragraph before Opportunity notes. That's why the rules cover both the start and the end of the output.
- `SKILL.md` 1.2.0 has no end-of-output or date rule yet; the 1.2.0 format just ends with Flagged for the rep. So these rules are new, not rewordings of a shipped rule.
- The Gmail offer the reviewer mentioned is the same kind of extra output: helpful-sounding, unrequested and outside the spec. That run isn't logged in RESULTS.md.

Checked and not an issue: Case 3 run 1 has no Closed Won flag. That's expected, because the Closed Won request only exists in the Case 6 version of the transcript. In `call-transcript-01.txt`, the 5:04 line is just Renee's heads-up to Priya.

Carried over from earlier runs (see RESULTS.md):

- Dropped Renee's heads-up to Priya from the email (Case 6, 2 of 3 runs on 1.2.0).
- Said both Renee and Sam liked the pilot when only Renee did (Case 6, run 2 on 1.2.0).

Note on issue 7: this is a triggering problem, not an output problem, so the fix goes in the frontmatter description rather than the body rules. Case 4's checklist only checks the response, so it can't tell whether the skill loaded; the new check adds that. A broader description loads the skill on more requests, so the negative check confirms it still stays out of unrelated ones.

Note on issue 6: it first showed up in run 2 and came back in run 3. It's in the table but marked Watching until scope is final. `SKILL.md` 1.2.0 has no rule about interpersonal detail; the 1.1.0 changes were Call details and the sentence check. The proposed rule is new, and it sends the detail to Call details rather than dropping it.

## staffing-match: 1.2.0

Also added in 1.2.0, without a backlog item: "A current project is not a skill. Use only the skills listed for each consultant." (Case 4 got this right, but no rule backed it.)

| # | Status | Issue | Seen in (1.1.0) | Proposed rule | New check |
| --- | --- | --- | --- | --- | --- |
| S1 | Watching (no case checks this yet) | Same consultant in two roles | Case 2: Diego is the pick for data engineer and the backup for senior analytics engineer. The Gaps and risks column says he "can't fill both roles," so the table contradicts itself | "A consultant appears in only one role. If no one else fits, the backup is 'No one qualifies.'" | Case 2: no consultant appears in more than one role |
| S2 | Verified 2026-11-08: Cases 2 and 5 passed 3 of 3 each | Non-senior pick for a senior role | 2 of 4 runs. Case 2: Marcus (Analytics Engineer) recommended for senior analytics engineer, with the gap disclosed. Case 5: Marcus recommended for a senior role again. In both, the Backup column says "No one qualifies," so the same row uses two standards: a non-senior consultant counts as the pick but not as the backup | Pick one and write it down. Option A: "If no one meets the required seniority, Recommended says 'No one qualifies' and the closest partial match goes under Gaps and risks." Option B: explicitly allow a partial match as Recommended, with the gap stated, and apply the same standard to Backup | Depends on the decision. Either way: Recommended and Backup use the same standard in each row |

Notes:

- S1: didn't recur in Cases 3-5. Still watching; not in the 1.2.0 fix pass.
- S2: decided Option B in 1.2.0: "If no one meets the seniority asked for, recommend the closest match and say so in Gaps and risks." The example still fits, because with Ana at 0% there is no other match to use as backup. Before the decision: the spec already leaned toward Option B. The partial-match rule allows gaps that are clearly stated, and the SKILL.md example recommends Raj for a senior role with "Not senior" as the gap. The example also has the double standard: Raj is the pick and the backup is "No one qualifies." Both runs copied that pattern. Whichever option is chosen, update the example to match it.
- Checked and not an issue (S3, format drift): the Availability column and the "Gaps and risks" heading are both in the spec's table, `| Role | Recommended | Availability | Backup | Why | Gaps and risks |`, in every committed version and in `staffing-match.zip`. Case 2 followed the format. The RESULTS.md rows for Cases 2 and 3 count S3; those notes are wrong, but the log is append-only, so it's corrected here instead. A later review asked to add the Availability column and "Gaps and risks" heading to the spec (4 of 4 runs), but both are already there, so no change is needed.

## client-status-report: 1.3.0

| # | Status | Issue | Seen in (1.2.0) | Fix | New check |
| --- | --- | --- | --- | --- | --- |
| C1 | Watching: didn't recur 2026-11-08 (Case 6, 3 runs) | Says a target date "is still" on when the notes don't support it | Case 6 (run 3 of 3) | Add a check if it shows up again | To be decided |
| C2 | Done in 1.3.0, awaiting a manual run of Case 7 in the Claude app | Collides with the built-in docs skill, so the skill never loads | Case 1: "Fail: collision"; a later Case 1 run passed and was delivered as a Claude Doc | More specific description that says to use it instead of a general document skill; body allows delivery as a document | Case 7: "turn these notes into this weeks report" loads the skill |
| C3 | Verified 2026-11-08: Case 1 passed 3 of 3 | Refers to today's date | Case 1 and Case 5 (run 3 of 3) | Library-wide date rule | Case 1: no mention of today's date |
| C4 | Verified 2026-11-08: Cases 1 and 5 passed 3 of 3 each | Output adds sections outside the template | Case 5 (run 3 of 3): added a Milestones section. Case 5 (run 2 of 3): review notes mixed into the left-out list | template.md gains a Milestones table (Milestone, Planned, Current outlook). After the report: "Left out of the report" and "Check before sending" | Case 1: Milestones table. Case 5: review notes under "Check before sending" |

Checked: the notes never name an owner for the inventory rework. They say "remaining 4 gold models, inventory ones are the ugly ones. Elena on it" under wip / next, so Elena is working on the remaining gold models, inventory ones included. The rework is mentioned again only as a cause of the UAT slip ("w/ the workspace delay + inventory rework prob looking at UAT 11/23 now"), with no owner. If Case 5 run 3 named Elena owner of the remaining models, the notes support it; if it named her owner of the UAT-slip risk, that breaks the owner rule. No rule change made.

## Grader (checklist wording)

Found in the 2026-11-08 automated run by reviewing every fail by hand. In both, the judge failed one run and passed another with the same wording, so the checklist item was too open.

| # | Status | Issue | Fix |
| --- | --- | --- | --- |
| G1 | Fixed 2026-11-08 | sales-call-recap Case 3: run 1 failed for "Thanks for your time today" in the email; run 3 used the same line and passed | Decided "today" in the email draft is allowed. Cases 1 and 3 now say so |
| G2 | Fixed 2026-11-08 | client-status-report Case 3: run 3 failed for "Refresh the environments once Harlow IT has set up the testing workspace"; run 1 passed with almost the same line | Case 3 now says everyday project words like testing environment, data feed and sign-off count as plain |

The judge's evidence can be wrong even when its verdict holds. In sales-call-recap Case 1 run 2, it said Jordan never offered to send times, but he did (transcript line 102). The fail stood on its other reason (issue 8). Read the evidence, not just the verdict.

## Library-wide

- Done 2026-11-07: every SKILL.md has the date rule, README lists it under "Required in every skill", and `check_registry.py` fails without it.

## Steps when we come back to this

1. Done 2026-11-08: sales-call-recap 1.3.1 for issues 8 and 9 (CHANGELOG entry, REGISTRY.md version, rebuilt zip, `check_registry.py` passes).
2. Re-run with `python3 scripts/run_tests.py --skill sales-call-recap --repeat 3 --log`, then `python3 scripts/run_tests.py --skill client-status-report --case 3 --repeat 3 --log` for the reworded checklist item.
3. Re-upload the rebuilt sales-call-recap zip to Claude and run the manual cases there: sales-call-recap 4 and 7, client-status-report 7. Log them in RESULTS.md by hand.
4. Review every fail by hand before drawing conclusions.
5. Move verified items out of this file. Reopen any that come back.
6. Decide the watching items (4, 5, S1, C1). Item 5 came back, so it may be ready for a rule.
