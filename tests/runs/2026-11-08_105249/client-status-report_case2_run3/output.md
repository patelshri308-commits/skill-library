# Harlow Foods Data Platform: weekly status, week of 26 October

**Overall status:** Amber. User testing is likely to start about two weeks late, and we need a decision from Harlow Finance on how net sales is calculated before we can sign off the sales reporting.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data loaded into the platform | 16 Oct | Complete |
| Business-ready reporting tables complete | 6 Nov | At risk: 7 of 11 have passed quality checks and the other 4 are in progress. The inventory tables need extra work. |
| User testing starts | 9 Nov | **Slipping:** now likely around 23 Nov. We will confirm the revised plan next week. |
| Go-live | 7 Dec | Under review. We will assess the effect of the testing delay and the Black Friday code freeze next week. |

## Done this week
- The daily data feed from the ERP system is now running reliably.
- The platform now keeps a full history of changes to customer and product records. This is live in production.
- We traced the missing store IDs in sales data to two older point-of-sale feeds.
- 7 of the 11 business-ready reporting tables have passed quality checks. The other 4 are in review.
- We demonstrated the sales reporting to Greg on Wednesday, including the drill-down by region.

## Next week
- Finish the remaining 4 reporting tables, including the more complex inventory tables.
- Set up Power BI security so each regional manager sees only their own region's data.
- Refresh the test environment once Harlow IT has provided the user testing workspace.
- Confirm the revised user testing plan and dates.
- Start the operating guide and handover documents.
- Share this update ahead of the steering committee, which has moved to Thursday next week.

## Risks and blockers (with owner)
- **Net sales doesn't match Finance's month-end figure (high priority).** Net sales in the new reporting is about 1.5% different from Finance's month-end number. We think this comes from when returns are counted. We can't sign off the sales reporting until Harlow Finance confirms which definition is correct. Owner: to be confirmed (Harlow Finance)
- **User testing workspace not yet provided.** We have been waiting on Harlow IT since 19 Oct, and this is the main cause of the testing delay. Owner: Greg (following up with Harlow IT)
- **Inventory reporting needs extra work.** This puts the 6 Nov completion date at risk and adds to the testing delay. Owner: Elena
- **Black Friday code freeze.** We need the exact freeze dates to check whether they clash with testing or go-live. Owner: to be confirmed

## Decisions needed from you
1. **Net sales definition:** Harlow Finance needs to confirm how returns should be treated so that net sales matches the month-end figure.
2. **Code freeze dates:** please confirm the exact dates of the Black Friday code freeze.
3. **Loyalty data:** adding loyalty data was not part of the agreed scope. If you'd like to go ahead, we'll raise a change request covering effort and timeline effects.

---

## Left out of the report
- Snowflake credits running high because of backfills (our internal cost and cloud usage).
- Diego possibly moving part-time to Brightwell (internal staffing).
- Ticket numbers (HFD-412, 398, 431, 440) and technical terms (CDC, SCD2, DAG retries, RLS, dbt).
- Meera wanting the update before the steering committee. This was an instruction for us, so the report only says the update is going out ahead of the meeting.

## Check before sending
- **User testing date:** the notes say "prob looking at UAT 11/23". Check you're happy to share 23 Nov as the likely date before the plan is confirmed.
- **Go-live:** the notes don't say whether 7 Dec is affected. I've marked it "under review". Confirm that's the message you want to give.
- **Reporting tables (6 Nov):** the notes don't give a revised date, so I marked it "at risk" without one. Update this if you have a firmer view.
- **Owners:** I've listed Greg as owner of the workspace risk because the notes say he's chasing it. Confirm he has agreed to own it. The net sales and code freeze risks need named owners.
- **Status:** with a two-week testing slip and a high-priority open issue, check whether Amber is right or whether Red would be more accurate.
- **Steering committee:** the notes say "thurs next wk". Add the exact date if you want it in the report.

This is a draft and hasn't been sent to anyone.