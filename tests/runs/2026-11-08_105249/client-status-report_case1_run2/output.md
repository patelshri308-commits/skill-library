# Harlow Foods Data Platform: weekly status, week of 26 Oct

**Overall status:** Amber. The start of user testing is likely to move from 9 Nov to 23 Nov, because the testing environment is still waiting to be set up and the inventory reports need more work.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data foundations complete | 16 Oct | Complete |
| Business reporting data sets complete | 6 Nov | At risk: 7 of 11 complete, revised date to be confirmed |
| User testing starts | 9 Nov | **Likely to slip to 23 Nov**, plan to be confirmed next week |
| Go-live | 7 Dec | Not yet reassessed, to be confirmed once the testing plan is set |

## Done this week
- The daily data feed from your ERP system is now stable, after a fix to how failed loads are retried.
- Customer and product records now keep a full history of changes. This is live in production.
- We traced the missing store IDs to two older point-of-sale feeds. The issue is closed.
- 7 of the 11 business reporting data sets have passed quality checks. The other 4 are in review.
- We demonstrated the sales reporting to Greg on Wednesday, including the drill-down by region. He gave positive feedback.

## Next week
- Finish the remaining 4 reporting data sets. The inventory ones need the most work (Elena).
- Set up access controls so regional managers only see data for their own region.
- Refresh the testing environment once Harlow IT has set it up.
- Confirm the revised user testing plan and dates.
- Start the operating guide and handover documents.
- Steering committee meeting, now on Thursday.

## Risks and blockers (with owner)
- **Net sales figures don't match finance's month-end numbers (blocker).** Net sales in the new reporting is about 1.5% off finance's month-end figure. We think this is down to when returns are counted. We can't sign off the sales reporting until Harlow finance confirms which definition is correct. Owner: to be confirmed.
- **Testing environment not yet set up.** The request has been with Harlow IT since 19 Oct, and Greg is following up. This is the main cause of the likely delay to user testing. Owner: to be confirmed.
- **Inventory reports need extra work.** This adds to the risk of delay to user testing. Owner: Elena.
- **Black Friday code freeze.** We need the exact freeze dates to check whether they affect user testing or go-live. Owner: to be confirmed.

## Decisions needed from you
1. **Net sales definition:** Harlow finance to confirm how returns should be counted in net sales, so we can sign off the sales reporting.
2. **Black Friday code freeze:** please share the exact dates.
3. **Loyalty data:** adding a loyalty data source isn't in the current scope. If you want to go ahead, we'll raise a change request covering effort and impact on the timeline.

---

## Left out of the report
- Cloud data platform costs running high because of reloading historical data (an internal cost matter).
- Diego possibly moving part-time to another client (an internal staffing matter, still unconfirmed).
- Meera wanting the update before the steering committee (an internal note on timing).
- Ticket numbers (HFD-412, 398, 431, 440) and technical terms (CDC, SCD2, dbt, RLS, gold/silver/bronze, marts).

## Check before sending
- **Status level:** I set it to Amber. The net sales mismatch is a P1 blocker on sign-off, so consider whether it should be Red.
- **Reporting data sets milestone (6 Nov):** 4 of 11 were still open as of these notes. Is 6 Nov already missed, and is there a revised date?
- **User testing date:** your notes say "prob 23 Nov". Are you comfortable telling the client that, or would you rather wait for next week's plan?
- **Go-live (7 Dec):** your notes don't say whether this is affected by the testing slip or the Black Friday freeze. Confirm the outlook.
- **Owners:** check who owns the net sales decision (someone in Harlow finance?), the testing environment (Harlow IT, with Greg chasing?) and the code freeze dates.
- **Steering committee:** add the actual date for "Thursday next week".
- **Year:** the notes don't give one, so I wrote dates without a year. Add it if your house style needs it.

This is a draft for you to review and send. I haven't sent it to anyone.