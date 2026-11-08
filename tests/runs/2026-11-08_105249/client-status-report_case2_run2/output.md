# Harlow Foods data platform: weekly status, week of 26 October

**Overall status:** Amber. User testing is likely to start about two weeks late, and sales figures need a decision from your finance team before we can sign off the sales reporting.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data loaded into the new platform | 16 Oct | Complete |
| Business-ready reporting data complete | 6 Nov | At risk: 7 of 11 reporting datasets have passed quality checks; the other 4 are in progress |
| User testing starts | 9 Nov | **Slipped:** now likely 23 Nov (revised plan to follow next week) |
| Go-live | 7 Dec | Under review following the user testing delay |

## Done this week

- The daily feed of changes from your ERP system is now running reliably.
- Customer and product records now keep a full history of changes, and this is live.
- We found the cause of missing store identifiers in sales data: two older point-of-sale feeds.
- 7 of the 11 reporting datasets have passed quality checks. The other 4 are in review.
- We demoed the sales reporting to Greg on Wednesday, including the drill-down by region.

## Next week

- Finish the remaining 4 reporting datasets. The inventory datasets need the most work (Elena).
- Set up access controls so each regional manager sees only their own region's data in Power BI.
- Prepare the user testing environment once Harlow IT has provided the workspace.
- Share a revised plan for user testing.
- Start the operating guide and handover documents.

## Risks and blockers (with owner)

- **Sales figures don't match finance's month-end number (high priority).** Net sales in the new reporting are about 1.5% off finance's month-end figure. We think the cause is when returns are counted. We can't sign off the sales reporting until finance confirms which definition is correct. Owner: to be confirmed.
- **User testing workspace not yet provided.** We asked Harlow IT for the workspace on 19 October and are still waiting. This is a main reason user testing is likely to start late. Owner: Greg (following up with Harlow IT).
- **Inventory reporting needs rework.** This adds to the risk on the reporting and user testing dates. Owner: Elena.
- **Black Friday code freeze.** We need the exact freeze dates so we can plan user testing and go-live around them. Owner: to be confirmed.

## Decisions needed from you

1. **Net sales definition:** finance to confirm which way of counting returns is correct, so the sales reporting can be signed off.
2. **Code freeze dates:** please confirm the Black Friday code freeze dates.
3. **Loyalty data:** adding a loyalty data source is outside the current scope. If you want it, we'll raise a change request covering effort and timing impact.

---

## Left out of the report

- Snowflake credit usage running high from backfills (our internal cost).
- Diego possibly moving part-time to Brightwell (our staffing).
- Ticket numbers (HFD-412, 398, 431, 440).
- Steering committee moving to Thursday next week, and Meera wanting this update before it.

## Check before sending

- **23 Nov user testing date:** the notes say "prob" and the plan gets sorted next week. Are you comfortable sharing it as "likely", or should it say "to be confirmed"?
- **Go-live 7 Dec:** the notes don't say whether it's affected. I wrote "under review", so check that's the message you want to give.
- **6 Nov reporting milestone:** the notes don't say whether it will slip. I marked it "at risk" because 4 datasets are still open.
- **Status Amber vs Red:** with a slipped milestone plus a high-priority blocker on sign-off, decide whether Red fits better.
- **Owners:** Greg is listed for the workspace because he's "chasing". Confirm he's happy to be named. The net sales and code freeze items need a named owner at Harlow.
- **Returns timing:** this is a working theory ("think it's"). Check you're happy to share it with the client.
- **Missing store identifiers:** the cause is found. Confirm whether there's a fix or follow-up to mention.