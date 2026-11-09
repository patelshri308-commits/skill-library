# Harlow Foods data platform: weekly status, week of 26 October

**Overall status:** Amber. User testing will probably start about two weeks late, and we need a finance decision before we can sign off the sales reporting.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data foundations | 16 Oct | Complete |
| Business-ready reporting data | 6 Nov | At risk: 7 of 11 data sets complete, the other 4 in progress |
| User testing starts | 9 Nov | **Slipping:** now likely 23 Nov. We will share a revised plan next week |
| Go-live | 7 Dec | We will confirm this in the revised plan |

## Done this week
- The daily data feed from your ERP system is now running reliably.
- Customer and product records now keep a full history of changes, and this is live in production.
- We found the cause of missing store information: two older point-of-sale feeds.
- 7 of the 11 business-ready reporting data sets have passed quality checks. The other 4 are in review.
- We showed Greg the sales reporting on Wednesday. He gave positive feedback on the drill-down by region.

## Next week
- Finish the remaining 4 reporting data sets. The inventory ones need the most rework.
- Set up access controls so regional managers see only their own region's data in Power BI.
- Prepare the user testing environment once your IT team has set up the workspace.
- Share a revised plan for user testing and the dates after it.
- Start the operating guide and handover documents.

## Risks and blockers (with owner)
- **Net sales figure doesn't match finance's month-end number (blocker).** Our net sales figure is about 1.5% off from finance's month-end number. We think the gap comes from when returns are counted. We can't sign off the sales reporting until Harlow Finance confirms which definition is correct. *Owner: to be confirmed*
- **User testing workspace not yet set up.** We asked Harlow IT for this on 19 October and it is still pending. Greg is chasing it. This delay is the main reason user testing is moving. *Owner: to be confirmed*
- **Inventory reporting rework.** The inventory data sets need more work than planned, which adds to the timeline pressure. *Owner: Elena*
- **Black Friday code freeze.** We need the exact dates of Harlow's freeze so we can plan testing and go-live around it. *Owner: to be confirmed*

## Decisions needed from you
1. **Net sales definition:** Harlow Finance to confirm which treatment of returns is correct.
2. **Code freeze dates:** please share the exact Black Friday freeze dates.
3. **Loyalty data:** adding loyalty data, as Greg asked, is outside the current scope. Let us know if you'd like us to prepare a change request.

The steering committee has moved to Thursday next week.

---

## Left out of the report
- Ticket numbers (HFD-412, 398, 431, 440).
- Snowflake credits running high because of backfills. This is our cost.
- Diego possibly moving part-time to Brightwell. This is internal staffing.
- Technical terms (CDC, SCD2, RLS, DAG retries, dbt, gold/bronze/silver), which I rewrote in plain language.
- Meera wanting the update before steerco. That's an internal instruction.

## Check before sending
- **Red or Amber?** User testing is slipping, a top-priority blocker is open and go-live hasn't been confirmed. Decide whether this should be Red.
- **Go-live date:** the notes don't say whether 7 Dec still holds. I put "we will confirm this in the revised plan". Make sure you're comfortable saying that to the client.
- **"Likely 23 Nov":** your notes call this tentative ("prob"). Decide whether to share the date now or wait for the revised plan.
- **Business-ready data milestone (6 Nov):** the notes don't give a new date. Confirm whether it will make 6 Nov.
- **Owners:** who owns the net sales decision (a named finance contact?), the workspace follow-up (Greg is chasing, but is he the owner?) and the code freeze dates.
- **Steerco date:** "Thursday next week" would be 5 Nov based on the week of 26 Oct. Confirm it and add the date if you want.
- Make sure Greg is happy to be named in the demo feedback and the loyalty data request.

This is a draft for you to review. I haven't sent it.