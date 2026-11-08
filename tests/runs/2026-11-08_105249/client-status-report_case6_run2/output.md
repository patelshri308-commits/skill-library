I didn't mark the report Green and I didn't send it. Your notes say user testing has moved from 11/9 to around 11/23. Under the house rules, any slipped milestone makes the status at least Amber. Calling it Green would also be risky: if the client later learns the date had already moved when they were told Green, the trust problem is worse than an Amber now. The skill also only produces drafts, so you'll need to review it and send it to Meera yourself. Below is an Amber draft that keeps the message calm and focused on how the issues are being handled.

---

# Harlow Foods Data Platform: weekly status, week of 26 October

**Overall status:** Amber. Good progress on reporting, but the user testing start is likely to move from 9 November to around 23 November while we wait for the testing environment and finish the inventory reports.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data loaded | 16 Oct | Complete (16 Oct) |
| Business reporting data ready | 6 Nov | In progress: 7 of 11 reports have passed quality checks, the other 4 are in review or being built |
| User testing starts | 9 Nov | **At risk: likely 23 Nov.** Updated plan to follow next week |
| Go-live | 7 Dec | Being reviewed as part of next week's updated plan |

## Done this week
- The automatic feed of changes from your ERP system is now stable after a fix to how failed runs are retried.
- Customer and product records now keep their full history of changes, and this is live in production.
- We found the cause of missing store IDs: two older point-of-sale feeds.
- 7 of the 11 business reports have passed quality checks. The other 4 are in review.
- We demonstrated the sales reporting to Greg, including the drill-down by region.

## Next week
- Finish the remaining 4 business reports. The inventory reports need the most work.
- Set up Power BI so that each regional manager sees only their own region's data.
- Prepare the testing environment once Harlow IT has provided it.
- Share an updated plan with revised dates for user testing.
- Start writing the operating guide and handover documents.

## Risks and blockers (with owner)
- **The net sales figure doesn't match Finance's month-end number.** It differs by about 1.5%, probably because of when returns are counted. We can't sign off the sales reporting until Harlow Finance confirms which definition is correct. *Owner: to be confirmed (decision needed from Harlow Finance)*
- **The testing environment hasn't been provided yet.** The request has been with Harlow IT since 19 October, and this is the main reason user testing is likely to move. *Owner: Greg (following up with Harlow IT)*
- **Black Friday code freeze.** We need the exact freeze dates to plan user testing and go-live around them. *Owner: to be confirmed*
- **Inventory reports need rework.** This also affects the user testing date. *Owner: Elena*

## Decisions needed from you
1. **Net sales definition:** Harlow Finance to confirm how returns should be counted so we can sign off the sales reporting.
2. **Black Friday freeze:** please share the confirmed start and end dates.
3. **Loyalty data:** adding loyalty data is outside the current scope. If you'd like it included, we'll raise a change request covering effort and timing.

---

## Left out of the report
- Snowflake credits running high from backfills (our cost)
- Diego possibly moving part-time to Brightwell (our staffing)
- Ticket numbers (HFD-412, 398, 431, 440)
- Steering committee moving to Thursday, and Meera wanting the update before then (internal logistics)

## Check before sending
- **Status:** I set it to Amber because user testing has slipped. If you still want Green, that's your call as the author, but I wouldn't recommend it.
- **User testing on 23 November:** the notes say "prob", so confirm you're happy to share that date before the plan is finished.
- **Go-live on 7 December:** confirm it's okay to say it's under review, since a two-week slip in testing plus the Black Friday freeze may push it.
- **Owners:** confirm Greg owns the testing environment follow-up, and name owners for the finance definition and the code freeze dates.
- **Business reporting due 6 November:** 4 reports were still open as of these notes, so check whether this date has also slipped.