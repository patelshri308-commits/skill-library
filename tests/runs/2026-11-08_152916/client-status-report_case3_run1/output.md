# Harlow Foods data platform: weekly status, week of 26 October

**Overall status:** Amber. User testing is likely to start two weeks late, and a gap between our sales figures and Finance's month-end figures needs a decision from Harlow Finance.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data in place | 16 Oct | Done |
| Business-ready reporting data complete | 6 Nov | At risk: 7 of 11 data sets have passed quality checks and the other 4 are in progress. The inventory data sets need extra work. |
| User testing starts | 9 Nov | **Slipped:** likely 23 Nov (not yet final). Causes are the delay in setting up the testing environment and the extra inventory work. A revised plan will follow next week. |
| Go-live | 7 Dec | Under review. We will confirm it alongside the revised testing plan. |

## Done this week
- Daily updates from the finance and operations system now arrive reliably, after a fix to the automatic retry process.
- Customer and product data now keep a full history of changes, so reports can show how records looked at any point in time. This is live.
- We found the cause of missing store details in sales data: two older point-of-sale feeds.
- 7 of the 11 business-ready data sets have passed quality checks. The other 4 are in review.
- We demonstrated the sales reporting to Greg on Wednesday, including drilling down by region, and he gave positive feedback.

## Next week
- Finish the remaining 4 data sets, inventory first (Elena).
- Set up Power BI access so each regional manager sees only their own region's data.
- Refresh the environments once Harlow IT has set up the user testing workspace.
- Confirm the revised user testing plan and dates.
- Start the operating guide and handover documents.
- Steering committee, now moved to Thursday.

## Risks and blockers (with owner)
- **Net sales gap with Finance (high priority):** Net sales in the new reporting are about 1.5% off Finance's month-end figure. We think the cause is when returns are counted. We can't sign off the sales reporting until Finance confirms which definition is correct. Owner: to be confirmed.
- **User testing workspace delay:** Harlow IT has had the request to set up the user testing workspace since 19 October. This delay is the main reason user testing is slipping. Greg is following up with Harlow IT. Owner: to be confirmed.
- **Inventory data sets need extra work:** This could hold up user testing further. Owner: Elena.
- **Black Friday change freeze:** Harlow has a change freeze around Black Friday, but we don't have the dates yet. It could affect testing and go-live. Owner: to be confirmed.

## Decisions needed from you
1. **Net sales definition:** Harlow Finance needs to confirm which net sales definition is correct, especially how returns are timed, so we can close the gap and sign off the sales reporting.
2. **Black Friday freeze dates:** Please share the exact dates so we can plan around them.
3. **Loyalty data:** Adding loyalty data as a new source is outside the current scope. Do you want us to prepare a change request for it?

---

## Left out of the report
- Ticket numbers (HFD-412, 398, 431, 440).
- Snowflake credits running high because of data reloads. This is an internal cost.
- Diego possibly moving part-time to Brightwell. This is an internal staffing matter.
- The note that Meera wants the update before the steering committee. That's an internal timing point, not report content.
- Technical terms like "CDC", "SCD2", "gold marts", "bronze/silver" and "RLS", which I rewrote in plain language.

## Check before sending
- **Overall status:** I chose Amber because go-live hasn't officially moved. If you think the net sales gap or the workspace delay puts 7 Dec at real risk, consider Red.
- **User testing date:** The notes say "prob 23 Nov", so I called it likely and not final. Are you happy sharing that date with the client?
- **6 Nov reporting milestone:** The notes don't say whether it will slip, so I marked it "at risk". Please confirm.
- **Owners:** I left the workspace delay as "to be confirmed" even though Greg is chasing Harlow IT. If Greg has agreed to own it, name him. Also, is there a named contact in Harlow Finance for the net sales question?
- **Returns timing:** The notes only say "think it's returns timing". Are you comfortable telling the client that's the likely cause?
- **Steering committee:** Please confirm the date for Thursday and send this to Meera before then.
- **Diego:** If staffing changes affect delivery, raise that separately, not in this report.

This is a draft only and hasn't been sent to anyone.