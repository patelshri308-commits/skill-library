# Harlow Foods data platform: weekly status, week of Oct 26

**Overall status:** Amber. User testing will probably start about two weeks late because the test workspace hasn't been set up yet and the inventory reporting work is taking longer than planned. We also need Harlow Finance to confirm how net sales should be calculated.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Source data loaded and cleaned | Oct 16 | Done Oct 16 |
| Business reporting datasets complete | Nov 6 | At risk: 7 of 11 complete, inventory datasets still in progress |
| User testing starts | Nov 9 | **Slipping:** probably Nov 23, revised plan to be confirmed next week |
| Go-live | Dec 7 | Not yet re-planned. At risk from the testing delay and the holiday code freeze |

## Done this week
- The daily data feed from your ERP system is now running reliably.
- Customer and product records now keep a full history of changes. This is live.
- We traced the missing store IDs to two older point-of-sale feeds and closed the issue.
- 7 of the 11 business reporting datasets have passed quality checks.
- We demoed the sales reporting to Greg on Wednesday. The regional drill-down went down well.

## Next week
- Finish the remaining four reporting datasets. The inventory datasets are the most complex (Elena).
- Set up region-level access in Power BI so each regional manager sees only their own region's data.
- Prepare the test environment once Harlow IT has set up the workspace.
- Confirm the revised user testing plan.
- Start the operating runbook and handover documentation.
- Steering committee, now moved to Thursday.

## Risks and blockers (with owner)
- **Net sales doesn't match Finance's month-end figure (about 1.5% off).** The likely cause is when returns are counted. We can't sign off the sales reporting until Harlow Finance confirms which definition is correct. Owner: to be confirmed (needs a decision from Harlow Finance).
- **The test workspace hasn't been set up.** The request has been with Harlow IT since Oct 19, and this is the main reason user testing is slipping. Owner: Greg (chasing Harlow IT).
- **Inventory datasets need extra work.** This adds to the testing delay. Owner: Elena.
- **Black Friday code freeze dates are unknown.** The freeze could affect user testing and go-live. Owner: to be confirmed.

## Decisions needed from you
1. **Net sales definition:** Harlow Finance needs to confirm how returns should be treated so the sales figures match month-end reporting.
2. **Code freeze dates:** please confirm the exact dates of the Black Friday code freeze so we can plan around them.
3. **Loyalty data:** adding a loyalty data source isn't in the current scope. If you'd like it, we'll raise a change request covering effort and timeline.

---

## Left out of the report
- Snowflake costs running high because of data reloads (internal cost).
- Diego possibly moving part-time to Brightwell (internal staffing).
- Ticket numbers (HFD-412, 398, 431, 440) and technical terms (CDC, SCD2, gold/bronze/silver layers, marts, dbt).
- "Meera wants the update before steerco." That's an internal instruction, not report content.

## Check before sending
- **Nov 23 testing date:** the notes say "prob" and that the plan gets sorted next week. Are you OK sharing it as a likely date?
- **Business reporting datasets (Nov 6):** I marked these "at risk" rather than slipped, because the notes don't give a new date. Confirm whether Nov 6 still holds.
- **Go-live:** the notes don't say anything about Dec 7. The "at risk" wording is my inference from the testing slip and the freeze. Check that you're comfortable saying this to the client.
- **Owners:** I listed Greg as owner of the workspace issue because he's chasing it. Confirm that, and name a Harlow Finance contact for the net sales decision if you can.
- **Missing store IDs:** the issue is "closed", but the notes only say it was traced. Confirm whether the two point-of-sale feeds were actually fixed.
- **Project name:** I read "DP" as "data platform". Use the official project name if it's different.
- **Timing:** Meera wants this before the steering committee on Thursday.

This is a draft only. Nothing has been sent.