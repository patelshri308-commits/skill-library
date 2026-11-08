# Harlow Foods data platform: weekly status, week of 26 October

**Overall status:** Amber. The start of user testing is likely to move from 9 November to around 23 November, and we need Harlow Finance to confirm how net sales should be calculated before we can sign off the sales reporting data.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Data loading and cleansing | 16 October | Complete |
| Business-ready reporting data | 6 November | At risk: 7 of 11 datasets have passed quality checks. The other 4 are in progress, and the inventory datasets need extra work. Sales reporting sign-off is waiting on the net sales decision below. |
| User testing starts | 9 November | **Likely to slip to about 23 November.** This is because of the delay in setting up the testing environment and the extra inventory work. We'll confirm the revised plan next week. |
| Go-live | 7 December | Not yet reassessed. We'll review it with the revised testing plan. |

## Done this week
- The daily data feed from your ERP system is now running reliably.
- Customer and product records now keep a full history of changes. This is live in production.
- We found the cause of the missing store IDs: two older point-of-sale feeds.
- 7 of the 11 business-ready reporting datasets have passed quality checks. The other 4 are in review.
- We demonstrated the sales reporting to Greg on Wednesday. The drill-down by region was well received.

## Next week
- Finish the remaining 4 reporting datasets, starting with inventory (Elena).
- Set up access controls in Power BI so regional managers see only their own region's data.
- Prepare the testing environment once Harlow IT has set it up.
- Confirm the revised user testing plan and dates.
- Start the operating guide and handover documents.

## Risks and blockers (with owner)
- **Net sales figures don't match Finance's month-end numbers (high priority).** Our net sales figure is about 1.5% different from Finance's month-end figure. We think this comes down to when returns are counted. We can't sign off the sales reporting data until Finance confirms which definition is correct. Owner: to be confirmed.
- **Testing environment not yet set up.** The request has been with Harlow IT since 19 October, and this is holding up the start of user testing. Owner: Greg (following up with Harlow IT).
- **Black Friday code freeze.** We need the exact dates of Harlow's code freeze so we can plan testing and go-live around them. Owner: to be confirmed.
- **Inventory datasets need extra work.** This adds to the pressure on the testing start date. Owner: Elena.

## Decisions needed from you
1. **Net sales definition:** Harlow Finance to confirm how returns should be counted in net sales, so we can sign off the sales reporting data.
2. **Code freeze dates:** please confirm the start and end dates of the Black Friday code freeze.
3. **Loyalty data:** adding loyalty data is outside the current scope. If you'd like to go ahead, we'll raise a change request covering the effort and the effect on the timeline.

---

## Left out of the report
- Snowflake costs running high because of data reloads (an internal cost matter).
- Diego possibly moving part-time to Brightwell (an internal staffing matter).
- Meera wanting the update before steerco (an internal note).
- Ticket numbers (HFD-412, 398, 431, 440) and technical terms (CDC, SCD2, dbt, RLS, gold/bronze/silver).
- Steerco moving to Thursday next week. Add it back if the client doesn't already know.

## Check before sending
- **Status:** I set it to Amber. Think about Red instead, given the high-priority net sales issue and the testing slip.
- **23 November testing date:** your notes say "prob". Confirm you're happy to share it with the client, or soften the wording.
- **Go-live, 7 December:** the notes don't reassess it. A two-week testing slip plus the Black Friday freeze could affect it. Decide whether to flag it now.
- **6 November reporting data milestone:** the notes don't say it has slipped. I marked it "At risk" because 4 of 11 datasets are still in progress. Confirm.
- **Owners:** I named Greg as owner of the testing environment risk because he's following it up. Confirm that's right. The net sales and code freeze risks still need owners, possibly someone in Harlow Finance and Greg.
- **Project name:** I read "DP" as "data platform". Confirm.
- **Elena:** check that it's appropriate to name Elena in a client-facing report.