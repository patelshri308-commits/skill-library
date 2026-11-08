# Harlow Foods data platform: weekly status, week of 26 October

**Overall status:** Amber. User testing will probably start two weeks late because the testing workspace hasn't been set up yet and the inventory reports need more work.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Core data loading and cleansing | 16 October | Done |
| Business reporting tables | 6 November | At risk: 7 of 11 complete, 4 still in progress |
| User testing starts | 9 November | **Likely to slip to 23 November.** We'll share a revised plan next week |
| Go-live | 7 December | Under review as part of the revised plan |

## Done this week
- The daily feed of changes from the ERP system is now running reliably.
- Customer and product data now keeps a full history of changes, and this is live in production.
- We found where the missing store IDs come from: two older point-of-sale feeds.
- 7 of the 11 business reporting tables have passed quality checks. The other 4 are in review.
- We demoed the sales reporting to Greg on Wednesday. He was pleased with the drill-down by region.

## Next week
- Finish the remaining 4 reporting tables. The inventory tables need the most rework.
- Set up access controls in Power BI so each regional manager sees only their own region's data.
- Refresh the environments once the user testing workspace is ready.
- Share a revised plan for user testing.
- Start the operations runbook and handover documents.
- Steering committee, which has moved to Thursday next week.

## Risks and blockers (with owner)
- **Net sales doesn't match finance's month-end figure (high priority).** Our net sales number is about 1.5% off finance's. We think the cause is when returns are counted. We can't sign off the sales reporting until Harlow Finance confirms which definition is correct. Owner: to be confirmed
- **User testing workspace not yet set up.** The request has been with Harlow IT since 19 October, and this is the main reason user testing is slipping. Greg is following up. Owner: to be confirmed
- **Inventory reporting rework.** This is also contributing to the delay. Owner: Elena
- **Black Friday code freeze.** We need the exact dates so we can plan user testing and go-live around them. Owner: to be confirmed

## Decisions needed from you
1. **Net sales definition:** Harlow Finance to confirm how returns should be counted in net sales, so we can sign off the sales reporting.
2. **Black Friday code freeze:** please confirm the start and end dates.
3. **Loyalty data source:** adding this is outside the current scope. If you want to go ahead, we'll raise a change request covering the effort and the impact on the timeline.

---

## Left out of the report
- Snowflake costs running high because of data backfills (internal cost).
- Diego possibly moving part-time to Brightwell (internal staffing).
- Ticket numbers (HFD-412, 398, 431, 440) and technical names (CDC, DAG retries, SCD2, gold/silver/bronze, marts, dbt).
- Meera wanting the update before steerco (internal instruction).

## Check before sending
- **User testing on 23 November:** the notes only say "prob". Confirm you're comfortable telling the client this date, or soften it to "about two weeks late".
- **Reporting tables (6 November):** the notes don't give a revised date. Check whether this milestone has a new date or is covered by the revised plan.
- **Go-live (7 December):** the notes don't say whether it's affected. I've marked it "under review". Confirm that's the message you want to give.
- **Owners:** decide who owns the net sales issue (Harlow Finance or Greg?), the workspace delay (Harlow IT, or Greg since he's chasing it?) and getting the code freeze dates.
- **Steerco:** add the actual date, since the notes only say "Thursday next week".
- **Meera:** confirm whether she's a recipient, and send it to her before steerco.

This is a draft for you to review. I haven't sent it to anyone.