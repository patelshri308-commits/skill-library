# Harlow Foods data platform: weekly status, week of 26 October

**Overall status:** Amber. User testing will likely start about two weeks late (around 23 November instead of 9 November). A difference in the net sales figures needs a decision from Harlow Finance before we can sign off the sales reporting.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data loaded into the platform | 16 Oct | Done |
| Business-ready reporting data complete | 6 Nov | At risk: 7 of 11 data sets have passed quality checks. The remaining 4 are in final review, and the inventory ones need extra work. |
| User testing starts | 9 Nov | **Slipped:** now likely around 23 Nov. We'll confirm this in next week's plan. |
| Go-live | 7 Dec | Under review. We'll reassess once the user testing plan is updated. |

## Done this week
- The ongoing data feed from your ERP system is now stable after a fix to how failed loads are retried.
- Customer and product records now keep a full change history in the live system.
- We found the cause of the sales records with no store attached: two older point-of-sale feeds.
- 7 of the 11 business-ready data sets passed all quality checks. The other 4 are in final review.
- We demonstrated the sales reporting to Greg on Wednesday, including the drill-down by region.

## Next week
- Finish the remaining 4 data sets. The inventory data sets need the most work.
- Set up access in Power BI so each regional manager sees only their own region's data.
- Prepare the user testing environment once Harlow IT has set up the workspace.
- Publish an updated plan with confirmed user testing dates.
- Start the operations guide and handover documents.
- Steering committee meeting, now moved to Thursday.

## Risks and blockers (with owner)
- **Net sales figures don't match Finance's month-end number (about 1.5% apart).** We think the gap comes from when returns are counted. We can't sign off the sales reporting until Harlow Finance confirms which definition is correct. Owner: to be confirmed.
- **The user testing workspace has not been set up yet.** We requested it from Harlow IT on 19 October and it is the main cause of the delay to user testing. Owner: Greg (following up with Harlow IT).
- **The inventory data sets need extra work.** This adds to the user testing delay. Owner: Elena.
- **Black Friday code freeze.** We need the exact dates so we can plan user testing and go-live around them. Owner: to be confirmed.

## Decisions needed from you
1. **Net sales definition:** Harlow Finance to confirm how returns should be counted in net sales, so the figures match the month-end number.
2. **Black Friday code freeze:** please share the exact start and end dates.
3. **Loyalty data source:** adding it is outside the agreed scope. If you'd like to go ahead, we'll raise a change request covering the effort and the impact on the timeline.

---

## Left out of the report
- Snowflake credits running high because of the data backfills (our internal cost).
- Diego possibly moving part time to Brightwell (internal staffing).
- Ticket numbers (HFD-412, 398, 431, 440) and technical terms (CDC, SCD2, RLS, dbt, gold/silver/bronze).
- Meera wanting the update before the steering committee (an internal note, used below).

## Check before sending
- **User testing date:** the notes say "prob looking at UAT 11/23". Check you're comfortable sharing 23 Nov as the likely date before the plan is finalised.
- **6 Nov data milestone:** the notes don't say whether it will slip. I marked it "At risk" without a new date. Confirm the right outlook.
- **Go-live 7 Dec:** the notes say nothing about go-live. Since user testing is slipping about two weeks and there's a code freeze, check whether "Under review" is the right message or whether you want to say more.
- **Status:** I chose Amber. Think about Red, given there's an open top-priority issue blocking sign-off and go-live is now uncertain.
- **Owners:** decide who owns the net sales issue (Harlow Finance contact or someone on our side) and who is chasing the code freeze dates.
- **Steering committee:** make sure this goes to Meera before Thursday's meeting, and check that the moved meeting is worth mentioning to the client.

This is a draft for you to review and send. I haven't sent it to anyone.