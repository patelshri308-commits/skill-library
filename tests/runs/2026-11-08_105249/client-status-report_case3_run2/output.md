I've drafted the report below from Aisha's notes, using the house template. I haven't sent it to anyone. Two notes for the author come after it.

---

# Harlow Foods Data Platform: weekly status, week of 26 October

**Overall status:** Amber. The start of user testing is likely to move from 9 November to 23 November. The two causes are a delay in getting the testing environment set up and extra work on the inventory reporting. A sales-figure question also needs your finance team's input.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Source data loaded and cleaned | 16 Oct | ✅ Complete (16 Oct) |
| Reporting data models complete | 6 Nov | ⚠️ At risk: 7 of 11 complete and tested; inventory models need extra work |
| User testing starts | 9 Nov | 🔶 **Slipped:** likely 23 Nov; revised plan to follow next week |
| Go-live | 7 Dec | ⚠️ Under review: depends on the revised testing plan and your Black Friday code freeze dates |

## Done this week
- Changes from your ERP system now sync automatically and reliably.
- Customer and product history tracking is live, so reports can show how customer and product details have changed over time.
- We traced missing store IDs in the sales data to two older point-of-sale feeds.
- 7 of the 11 reporting data models have passed quality testing. The other 4 are in final review or in progress.
- We demonstrated the sales reporting to Greg on Wednesday. He gave positive feedback on the drill-down by region.

## Next week
- Finish the remaining 4 reporting data models, starting with inventory (Elena).
- Set up region-level access in Power BI, so each regional manager sees only their own region's data.
- Prepare the user testing environment once Harlow IT has provided the workspace.
- Confirm the revised user testing plan and dates.
- Start the operations guide and handover documentation.

## Risks and blockers (with owner)
- **Net sales doesn't match finance's month-end figure (blocker).** The net sales figure in the new reporting is about 1.5% off finance's month-end number. The most likely cause is a difference in when returns are counted. We can't sign off the sales reporting until Harlow finance confirms which definition is correct. *Owner: to be confirmed*
- **User testing workspace not yet set up (blocker).** The request has been with Harlow IT since 19 October, and Greg is following up. This is one of the two main causes of the user testing delay. *Owner: Harlow IT*
- **Inventory reporting needs extra work.** The remaining inventory models are taking longer than planned, which adds to the user testing delay. *Owner: Elena*
- **Black Friday code freeze.** We need the exact freeze dates to plan user testing and go-live around them. *Owner: to be confirmed*

## Decisions needed from you
1. **Net sales definition:** Harlow finance to confirm which definition of net sales is correct, in particular how returns should be timed.
2. **Code freeze dates:** please confirm the exact dates of the Black Friday code freeze.
3. **Loyalty data:** adding a loyalty data source is outside the agreed scope. If you'd like to go ahead, we'll raise a change request covering effort and impact on the timeline.

---

## Left out of the report
- Snowflake costs running high because of the data backfills. This is an internal cost matter.
- Diego possibly moving part-time to Brightwell. This is an internal staffing matter and hasn't been confirmed.
- All ticket numbers (HFD-412, 398, 431, 440).
- The steering committee moving to Thursday next week. The notes don't give a date, and the client already knows about the move.

## Check before sending
- **23 November for user testing:** the notes say "prob", and the plan is only being sorted next week. Confirm we're comfortable giving the client this date, or say "revised date to follow" instead.
- **Reporting data models (6 Nov) and go-live (7 Dec):** the notes don't give a new outlook for either. I've marked them "at risk" and "under review" without giving dates. Check that's right.
- **Amber or Red:** with a blocker on sales sign-off and user testing slipping, decide whether Red fits better.
- **Owners still to be confirmed:** the net sales question (probably someone in Harlow finance) and the code freeze dates (Greg mentioned them, but that doesn't make him the owner).
- **Harlow IT as owner of the workspace issue:** the request is sitting with them, but check whether the client would rather see Greg named.
- **Timing:** Meera wants this before the steering committee on Thursday.