Here's the draft for you to review and send. I haven't sent it anywhere.

---

# Harlow Foods Data Platform: weekly status, week of 26 October

**Overall status:** Amber. The start of user testing is likely to move from 9 November to about 23 November. A difference in the sales figures also has to be resolved before the sales reporting can be signed off.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Data loading and cleansing complete | 16 Oct | Complete |
| Business reporting data sets complete | 6 Nov | In progress: 7 of 11 have passed quality checks and the other 4 are being finished |
| User testing starts | 9 Nov | **At risk: likely to move to around 23 Nov** (revised plan due next week) |
| Go-live | 7 Dec | Under review as part of next week's revised plan |

## Done this week
- The daily data feed from your ERP system is now running reliably after a fix to its automatic retry handling.
- Customer and product history tracking is now live. Reports can show how customer and product details have changed over time.
- We found the cause of the missing store information in sales data: two older point-of-sale feeds.
- 7 of the 11 business reporting data sets have passed quality checks. The remaining 4 are in review.
- We demonstrated the sales reporting to Greg on Wednesday, including the drill-down by region.

## Next week
- Finish the remaining 4 reporting data sets. The inventory data sets need the most rework (Elena).
- Set up access controls in Power BI so that each regional manager sees only their own region's data.
- Prepare the user testing environment once Harlow IT has set up the workspace.
- Share a revised plan for user testing and the later milestones.
- Start the operating guide and handover documentation.
- Note: the steering committee meeting has moved to Thursday next week.

## Risks and blockers (with owner)
- **Net sales doesn't match Finance's month-end figure (high priority).** Net sales in the new reporting is about 1.5% different from Finance's month-end number. We think the cause is when returns are counted. We can't sign off the sales reporting until Harlow Finance confirms which definition is correct. *Owner: to be confirmed*
- **User testing workspace not yet set up.** The request has been with Harlow IT since 19 October, and this is the main reason user testing may move. Greg is following it up. *Owner: Greg (following up with Harlow IT)*
- **Inventory reporting rework.** The remaining inventory data sets are the most complex and add to the risk to the user testing date. *Owner: Elena*
- **Black Friday change freeze.** Harlow has a change freeze around Black Friday, but we don't yet have the exact dates. It could affect user testing and go-live. *Owner: to be confirmed*

## Decisions needed from you
1. **Net sales definition:** Harlow Finance needs to confirm how returns should be treated in net sales so that the sales reporting can be signed off.
2. **Black Friday freeze dates:** please confirm the exact dates so we can plan user testing and go-live around them.
3. **Loyalty data:** adding loyalty data is outside the current scope. If you want to go ahead, we'll raise a change request covering cost and timing.

---

## Left out of the report
- Snowflake costs running high because of data reloads (our internal cost/cloud usage)
- Diego possibly moving part-time to another client (internal staffing, not yet confirmed)
- Ticket numbers (HFD-412, 398, 431, 440)
- "Meera wants the update before steerco" (an internal note, not client content)

## Check before sending
- **User testing date:** the notes say "prob looking at 11/23", so I wrote "likely … around 23 Nov". Confirm you're happy to give the client that date before next week's plan is done.
- **Reporting data sets milestone (6 Nov):** 4 data sets were still open and the inventory ones need rework. Should this be shown as slipped rather than in progress?
- **Go-live (7 Dec):** the notes don't say whether this moves. I marked it "under review". Confirm that's the message you want to give.
- **Status:** I chose Amber. With a high-priority blocker plus a likely two-week slip, decide whether Red fits better.
- **Owners:** I made Greg the owner of the workspace item because he's chasing it. Check that he's happy with that. The net sales and freeze-date items need named owners, possibly someone in Harlow Finance and Greg respectively.
- **Steering committee:** add the actual Thursday date. Also make sure Meera gets this before the meeting.