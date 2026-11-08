# Harlow Foods Data Platform: weekly status, week of 26 October

**Overall status:** Amber. User testing is likely to start about two weeks late, and the sales figures can't be signed off until Harlow Finance confirms how net sales should be calculated.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Core data ingestion and cleansing complete | 16 Oct | Done 16 Oct |
| Business-ready reporting data complete | 6 Nov | **At risk.** 7 of 11 datasets complete. The remaining 4 are in progress and the inventory datasets need extra work. Revised date to be confirmed. |
| User testing starts | 9 Nov | **Slipping.** Likely 23 Nov. We will confirm the revised plan next week. |
| Go-live | 7 Dec | Under review. We will assess the effect of the testing delay next week. |

## Done this week
- Daily data feeds from the ERP system are now running reliably after a fix to how failed loads are retried.
- Customer and product history tracking is live in production. Reports can now show how customer and product details change over time.
- We traced missing store information to two older point-of-sale feeds.
- 7 of the 11 business-ready reporting datasets have passed quality checks. The rest are in final review.
- We demonstrated the sales reporting to Greg on Wednesday, including the drill-down by region.

## Next week
- Finish the remaining 4 reporting datasets, starting with inventory.
- Set up Power BI security so regional managers see only their own region's data.
- Prepare the user testing environment once Harlow IT has provided the workspace.
- Confirm the revised plan for user testing and go-live.
- Start the operating guide and handover documents.

## Risks and blockers (with owner)
- **Net sales figure doesn't match Finance's month-end number (blocker).** Our net sales figure differs from Finance's month-end figure by about 1.5%. We think this comes from when returns are counted. We can't sign off the sales reporting until Harlow Finance confirms which definition is correct. Owner: to be confirmed (decision needed from Harlow Finance).
- **User testing workspace not yet provided (blocker).** The request has been with Harlow IT since 19 Oct, which is delaying the start of user testing. Owner: Greg (chasing with Harlow IT).
- **Black Friday code freeze.** Harlow has a code freeze around Black Friday, but we don't know the exact dates yet. It could affect the testing and go-live plan. Owner: to be confirmed.

## Decisions needed from you
1. **Net sales definition:** Harlow Finance to confirm how returns should be treated in net sales so we can match their month-end figure.
2. **Code freeze dates:** please confirm the exact Black Friday code freeze dates so we can plan around them.
3. **Loyalty data:** adding the loyalty data source is outside the current scope. If you want to go ahead, we'll prepare a change request covering effort and timeline.

Note: the steering committee meeting has moved to Thursday next week.

---

## Left out of the report
- Snowflake credits running high from the backfills, since that's our cost and cloud usage.
- Diego possibly moving part-time to Brightwell, since that's an internal staffing change.
- Ticket numbers (HFD-412, 398, 431, 440) and technical terms (CDC, SCD2, DAG, dbt, gold/bronze/silver, marts, RLS).
- Elena's name on the remaining datasets and the history tracking work. These are delivery tasks, not risks, so no owner was needed.

## Check before sending
- **Overall status:** I set it to Amber. With a 2-week slip to user testing, a sign-off blocker and go-live still uncertain, you could argue for Red.
- **User testing date:** your notes say "prob" 23 Nov, so I wrote "likely." Confirm you're comfortable sharing that date before the plan is sorted.
- **Go-live:** your notes don't say whether 7 Dec still holds. I wrote "under review."
- **Reporting data milestone (6 Nov):** your notes don't give a revised date. I wrote "at risk" with the date to be confirmed.
- **Workspace owner:** I named Greg because your notes say he's chasing it. Confirm he's happy to be listed as owner.
- **Net sales owner:** is there a named person in Harlow Finance who should own it?
- **Project name:** I expanded "DP" to "Data Platform." Check that's right.
- **Steering committee date:** Thursday next week works out to 5 Nov. I left the date out, so add it if you want.
- **Timing:** Meera wants the update before the steering committee, so it needs to go out before Thursday.

This is a draft and hasn't been sent anywhere.