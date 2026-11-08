# Harlow Foods data platform: weekly status, week of 26 October

**Overall status:** Amber. User testing is likely to start two weeks late, and sign-off on the sales figures is waiting on a decision from Harlow Finance.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data foundations | 16 Oct | Complete |
| Reporting-ready business data (sales, inventory and others) | 6 Nov | At risk. 7 of 11 data sets are complete and tested. The inventory data sets need extra work. The sales data can't be signed off until Finance confirms the definition of net sales |
| User testing start | 9 Nov | **Slipped:** now expected around 23 Nov because the test environment and the inventory work are both late. We will confirm a revised plan next week |
| Go-live | 7 Dec | Under review. We will assess the impact of the later user testing start in next week's revised plan |

## Done this week
- Changes from your ERP system now flow into the platform reliably, after we fixed the automatic retry process.
- Customer and product records now keep their full change history, so reports can show how a customer or product looked at any point in time. This is live in production.
- We traced the missing store IDs to two older point-of-sale feeds.
- 7 of the 11 reporting data sets passed quality checks. The other 4 are in review.
- We demoed the sales reporting to Greg on Wednesday, including the drill-down by region.

## Next week
- Finish the remaining 4 reporting data sets, starting with inventory (Elena).
- Set up Power BI security so regional managers see only their own region's data.
- Refresh the environments once Harlow IT provides the user testing workspace.
- Send a revised plan for user testing and go-live.
- Start the operating guide and handover documentation.

## Risks and blockers (with owner)
- **Net sales doesn't match Finance's month-end figure (high priority).** Our figure is about 1.5% off. We think the gap comes from when returns are counted. We can't sign off the sales data until Finance confirms which definition is correct. *Owner: to be confirmed (Harlow Finance)*
- **The user testing workspace hasn't been provided.** The request has been with Harlow IT since 19 Oct, and this is pushing back the start of user testing. *Owner: Greg (following up with Harlow IT)*
- **The inventory data sets need extra work,** which adds to the risk on the reporting data milestone and the user testing start. *Owner: Elena*
- **We don't yet know the Black Friday code freeze dates.** The freeze could overlap with user testing and go-live preparation. We need the exact dates to plan around it. *Owner: to be confirmed*

## Decisions needed from you
1. **Net sales definition:** Harlow Finance needs to confirm how returns should be counted in net sales so we can sign off the sales data.
2. **Black Friday code freeze:** please share the exact start and end dates.
3. **Loyalty data source:** adding loyalty data is outside the agreed scope. If you'd like to go ahead, we'll prepare a change request covering effort and timeline impact.

The steering committee has moved to Thursday next week.

---

## Left out of the report
- Snowflake credits running high because of the backfills (our internal cost).
- Diego possibly moving part-time to Brightwell (internal staffing, not confirmed yet).
- Meera wanting the update before the steering committee (internal deadline for sending this).
- Ticket numbers HFD-412, 398, 431 and 440 (rewritten in plain language).

## Check before sending
- **User testing date:** your notes say "prob looking at 11/23" and that you'll sort the plan next week. Are you comfortable telling the client "around 23 Nov," or would you rather not give a date until the plan is done?
- **Go-live:** your notes don't say whether 7 Dec is affected. I put "under review." Check that's how you want to frame it, especially with the code freeze still unknown.
- **Reporting data milestone (6 Nov):** your notes don't give a new date. I marked it "at risk," not slipped. Confirm whether it will actually be late.
- **Overall status:** I set it to Amber. Consider Red if the user testing slip is likely to push go-live, or if the net sales issue is unlikely to be resolved quickly.
- **Owners:** I made Greg the owner of the workspace blocker because your notes say he's chasing it. Confirm he's happy to be named. Net sales and the code freeze have no named owner. Is there a specific Harlow Finance contact to name?
- **Steering committee:** confirm the exact date before you send, since "Thursday next week" depends on when the client reads it.
- **Loyalty request:** confirm you want to raise the change request with the client now rather than handle it separately with Greg.

This is a draft only and hasn't been sent.