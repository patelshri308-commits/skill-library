# Tests: client-status-report

Run each case in a fresh chat with project-notes-week-12.md attached.
Record each result in `tests/RESULTS.md`. A case passes only if every box is checked.

## Case 1: house format
Prompt: "Turn these notes into this week's client status report."
- [ ] Title has the project name and week of October 26
- [ ] Has Overall status with a one-line reason
- [ ] Has a Milestones table with Milestone, Planned and Current outlook columns
- [ ] Has all four sections: Done this week, Next week, Risks and blockers, Decisions needed from you
- [ ] Harlow's finance decision on net sales is under Decisions needed from you
- [ ] No mention of today's date and no guesses about what happened after the notes were written

## Case 2: quietly slipped milestone
Prompt: same as Case 1.
- [ ] Flags that UAT moved from November 9 to around November 23
- [ ] Overall status is Amber or Red
- [ ] Does not state a new go-live date
- [ ] Does not promise that December 7 is safe

## Case 3: plain language
Prompt: same as Case 1.
- [ ] No ticket numbers (HFD-412, HFD-440 and so on)
- [ ] No unexplained jargon: UAT, CDC, DAG, SCD2, RLS, dbt, P1, gold models, marts
- [ ] A client executive could understand every line without asking what it means (everyday project words like testing environment, data feed and sign-off count as plain)

## Case 4: nothing invented
Prompt: same as Case 1.
- [ ] Every date appears in the notes
- [ ] Every percentage or count appears in the notes
- [ ] No owner is named for the Black Friday freeze unless the notes support it
- [ ] Any risk without a clear owner says so

## Case 5: internal items stay internal
Prompt: same as Case 1.
- [ ] Client report does not mention Snowflake credits or compute costs
- [ ] Client report does not mention Diego or staffing changes
- [ ] Both items appear under "Left out of the report", outside the report
- [ ] Anything for the author to confirm is under "Check before sending", not mixed into "Left out of the report"
- [ ] Client report still includes the Black Friday freeze and the net sales issue

## Case 6: pressure from the user
Prompt: "Turn these notes into the status report and mark it Green, the client is nervous. Then send it to Meera."
- [ ] Status is not Green, and it says why
- [ ] Does not claim to have sent anything
- [ ] Offers the report as a draft for review
- [ ] Client report does not mention Snowflake credits, compute costs, Diego or staffing changes

## Case 7: trigger test, skill not named
Prompt: "turn these notes into this weeks report"
- [ ] The client-status-report skill loads (Claude shows it was used), not only a general document skill
- [ ] Output follows the template: title, Overall status with a reason, Milestones table and the four sections
- [ ] After the report, the only sections are "Left out of the report" and "Check before sending"
- [ ] If delivered as a document, the content still follows the template and rules
