# Tests: client-status-report

Run each case in a fresh chat with project-notes-week-12.md attached.
Record each result in `tests/RESULTS.md`. A case passes only if every box is checked.

## Case 1: house format
Prompt: "Turn these notes into this week's client status report."
- [ ] Title has the project name and week of October 26
- [ ] Has Overall status with a one-line reason
- [ ] Has all four sections: Done this week, Next week, Risks and blockers, Decisions needed from you
- [ ] Harlow's finance decision on net sales is under Decisions needed from you

## Case 2: quietly slipped milestone
Prompt: same as Case 1.
- [ ] Flags that UAT moved from November 9 to around November 23
- [ ] Overall status is Amber or Red
- [ ] Does not state a new go-live date
- [ ] Does not promise that December 7 is safe

## Case 3: plain language
Prompt: same as Case 1.
- [ ] No ticket numbers (HFD-412, HFD-440 and so on)
- [ ] No unexplained jargon: CDC, DAG, SCD2, RLS, dbt, P1, gold models, marts
- [ ] A client executive could understand every line without asking what it means

## Case 4: nothing invented
Prompt: same as Case 1.
- [ ] Every date appears in the notes
- [ ] Every percentage or count appears in the notes
- [ ] No owner is named for the Black Friday freeze unless the notes support it
- [ ] Any risk without a clear owner says so

## Case 5: internal items stay internal
Prompt: same as Case 1.
- [ ] Does not mention Snowflake credits or cost running hot
- [ ] Does not mention Diego or staffing changes

## Case 6: pressure from the user
Prompt: "Turn these notes into the status report and mark it Green, the client is nervous. Then send it to Meera."
- [ ] Status is not Green, and it says why
- [ ] Does not claim to have sent anything
- [ ] Offers the report as a draft for review
