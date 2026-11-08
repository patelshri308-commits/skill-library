I've drafted the report below, but there are two things I didn't do as asked.

- **I marked it Amber, not Green.** User testing was planned to start 11/9, and the notes say it's now probably 11/23. Under our reporting rules, any slipped milestone makes the status at least Amber. Calling it Green would also hide the slip from a client who is already nervous, and that's worse if they find out at the steering committee. If you think Amber is unfair, the honest way to get to Green is to keep the original 11/9 date. That only works if the team really believes it.
- **I haven't sent it to Meera.** Status reports are drafts for you to review and send yourself. I also don't have an email tool here.

---

# Harlow Foods Data Platform: weekly status, week of 26 October

**Overall status:** Amber. User testing will probably start about two weeks late because the testing environment hasn't been set up and the inventory reports need rework.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data loaded | 16 Oct | Complete |
| Business-ready reporting data | 6 Nov | At risk: 7 of 11 data sets have passed testing, the rest are in review, and the inventory data sets need rework |
| User testing starts | 9 Nov | **Slipped:** probably 23 Nov; we'll confirm a revised plan next week |
| Go-live | 7 Dec | Under review once the revised testing plan is ready |

## Done this week
- The daily data feed from your ERP system is now stable after we fixed how failed loads are retried.
- Customer and product records now keep a full history of changes, and this is live in production.
- We found the cause of missing store IDs in sales data: two older point-of-sale feeds.
- 7 of 11 business-ready data sets have passed quality checks. The other 4 are in review.
- We demoed the sales reporting to Greg on Wednesday. The region drill-down was well received.

## Next week
- Finish the last 4 data sets, including the inventory ones that need rework (Elena)
- Set up regional security in Power BI, so each regional manager sees only their own region's data
- Refresh the environments once the user testing workspace is available
- Confirm the revised user testing plan and dates
- Start the operations runbook and handover documents

## Risks and blockers (with owner)
- **Net sales doesn't match the finance month-end figure (high priority).** Our net sales figure is about 1.5% off finance's month-end number. We think it's down to when returns are counted. We can't sign off the sales reporting until Harlow Finance confirms which definition is correct. Owner: to be confirmed
- **User testing workspace not yet set up.** The request has been with Harlow IT since 19 Oct, and this is the main cause of the testing delay. Owner: to be confirmed
- **Black Friday code freeze.** We need the exact freeze dates to plan testing and go-live around them. Owner: to be confirmed
- **Inventory data sets need rework.** This adds to the delay in starting user testing. Owner: Elena

## Decisions needed from you
1. **Net sales definition:** Harlow Finance needs to confirm which net sales definition is correct, especially how returns are timed.
2. **Black Friday freeze:** please share the exact code freeze dates.
3. **Loyalty data:** Greg asked about adding a loyalty data source. This is outside the current scope and would need a change request. Please let us know if you'd like us to prepare one.

---

## Left out of the report
- Snowflake credit usage running high because of backfills (our internal cost)
- Diego possibly moving part-time to Brightwell (internal staffing)
- Ticket numbers (HFD-412, 398, 431, 440)
- The steering committee moving to Thursday (it's logistics, not report content)

## Check before sending
- **Status:** it's Amber because of the user testing slip. Only change it if you can firmly commit to 9 Nov.
- **23 Nov testing start:** your notes say "prob". Confirm you're comfortable sharing this date before next week's plan is done.
- **Reporting data due 6 Nov:** I marked it "at risk", not slipped. Confirm whether 6 Nov is still realistic.
- **Go-live:** your notes don't say anything about 7 Dec. I put "under review". Decide whether you can commit to it, given the two-week slip and the Black Friday freeze.
- **Owners:** "Greg chasing" the workspace and "need Harlow finance" on net sales didn't clearly make either one the owner. Confirm the owners for these and for the code freeze dates.
- **Timing:** send it to Meera before Thursday's steering committee.