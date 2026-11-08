# Harlow Foods data platform: weekly status, week of 26 October

**Overall status:** Amber. User testing will likely start two weeks late, and net sales figures don't yet match Finance's month-end number.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data loaded | 16 Oct | Complete |
| Business reporting data ready | 6 Nov | At risk: 7 of 11 reporting datasets have passed quality checks. The other 4 are in progress, and the inventory datasets need extra rework |
| User testing starts | 9 Nov | **Slipping: likely 23 Nov** because of the testing environment delay and the inventory rework. We'll confirm a revised plan next week |
| Go-live | 7 Dec | Under review: depends on the revised testing plan and Harlow's Black Friday code freeze dates |

## Done this week
- Changes from the ERP system now sync to the platform reliably, after we fixed how failed loads are retried.
- Customer and product records now keep a full history of changes. This is live in production.
- We found where missing store identifiers were coming from: two older point-of-sale feeds.
- 7 of the 11 business reporting datasets passed all quality checks. The other 4 are in review.
- We demonstrated the sales reporting to Greg on Wednesday. The drill-down by region got good feedback.

## Next week
- Finish the remaining 4 reporting datasets, starting with inventory.
- Set up Power BI so regional managers see only their own region's data.
- Refresh the environments once Harlow IT has set up the testing workspace.
- Confirm a revised plan for user testing and go-live.
- Start the operating guide and handover documents.

## Risks and blockers (with owner)
- **Net sales doesn't match Finance's month-end figure (high priority).** Our net sales number is about 1.5% off Finance's month-end figure. We think the cause is when returns are counted. We can't sign off the sales reporting until Harlow Finance confirms which definition is correct. Owner: to be confirmed
- **Testing workspace not yet set up.** This has been waiting with Harlow IT since 19 October and is holding up the start of user testing. Owner: to be confirmed (Greg is following up with Harlow IT)
- **Black Friday code freeze.** We need the exact dates to plan user testing and go-live around them. Owner: to be confirmed
- **Inventory reporting rework.** This adds pressure on the reporting and user testing dates. Owner: Elena

## Decisions needed from you
1. **Net sales definition:** Harlow Finance to confirm how returns should be counted, so the sales reporting can be signed off.
2. **Code freeze dates:** please confirm Harlow's Black Friday code freeze dates.
3. **Loyalty data:** adding a loyalty data source is outside the current scope. If you want it, we'll raise a change request so you can review the cost and timing impact.

---

## Left out of the report
- Snowflake credits running high because of backfills (our internal costs).
- Diego possibly moving part time to Brightwell (internal staffing, not confirmed).
- All ticket numbers (HFD-412, 398, 431, 440).
- The steering committee moving to Thursday next week, and Meera wanting the update first. I treated both as notes for you, not report content.

## Check before sending
- **Business reporting data (6 Nov):** the notes don't say whether this date will slip. I marked it "at risk", not "slipped". Please confirm or give a new date.
- **User testing on 23 Nov:** the notes say "prob". Are you comfortable telling the client that date before next week's plan is done?
- **Go-live:** a two-week testing slip plus a Black Friday freeze could push go-live. Decide whether to say more than "under review."
- **Owners:** please assign owners for the net sales issue (someone in Harlow Finance?), the workspace delay (Greg or Harlow IT?) and the code freeze dates.
- **Overall status:** I chose Amber. Consider Red, since a high-priority sign-off blocker comes on top of the testing slip.
- **Timing:** Meera wants the update before the steering committee on Thursday next week.

This is a draft only. I haven't sent it anywhere.