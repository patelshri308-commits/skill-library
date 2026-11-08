# Harlow Foods data platform: weekly status, week of 10/26

**Overall status:** Amber. User testing is likely to start two weeks late, and the sales figures need a decision from Harlow Finance before we can sign them off.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data loaded | 10/16 | Done 10/16 |
| Business reporting datasets complete | 11/6 | At risk: 7 of 11 complete. The other 4 are in progress, and the inventory datasets need rework |
| User testing starts | 11/9 | **Slipping:** likely 11/23. We'll confirm the revised plan next week |
| Go-live | 12/7 | Under review as part of next week's revised plan |

## Done this week
- The daily data feed from your ERP system is now stable after a fix to how failed loads retry.
- Customer and product records now keep a full history of changes. This is live in production.
- We found the cause of the missing store IDs: two older point-of-sale feeds.
- 7 of the 11 business reporting datasets have passed quality checks. The other 4 are in review.
- We demoed the sales report to Greg on Wednesday, including the drill-down by region.

## Next week
- Finish the remaining 4 reporting datasets, starting with inventory.
- Set up access controls in Power BI so regional managers see only their own region's data.
- Refresh the environments once the user testing workspace is ready.
- Share a revised plan for user testing and go-live.
- Start the operating guide and handover documents.

## Risks and blockers (with owner)
- **Net sales doesn't match Finance's month-end figure (blocker).** It's about 1.5% off, which we think comes from when returns are counted. We can't sign off the sales report until Harlow Finance confirms which definition is correct. Owner: to be confirmed
- **User testing workspace not yet set up.** The request has been with Harlow IT since 10/19, and Greg is following up. This delay is a main reason user testing is moving. Owner: Harlow IT
- **Inventory datasets need rework.** This adds to the risk of user testing moving. Owner: Elena
- **Black Friday code freeze.** We need the exact dates so we can plan user testing and go-live around them. Owner: to be confirmed

## Decisions needed from you
1. **Net sales definition:** Harlow Finance to confirm how returns should be counted, so the sales figures can be signed off.
2. **Code freeze dates:** please confirm the start and end dates of the Black Friday freeze.
3. **Loyalty data:** adding a loyalty data source is outside the current scope. Would you like us to prepare a change request?

Steering committee note: the meeting has moved to Thursday of next week.

---

## Left out of the report
- Higher than expected cloud usage from backfills: this is an internal cost.
- Diego possibly moving part-time to Brightwell: this is an internal staffing matter.
- Meera wanting the update before steerco: this is an internal note.
- Ticket numbers (HFD-412, 398, 431, 440).

## Check before sending
- **Status level:** I chose Amber. You could argue for Red, because user testing is slipping and an unresolved top-priority issue is blocking sign-off. Confirm which you want.
- **User testing date:** your notes say "prob 11/23". Confirm you're happy to tell the client that date now rather than wait for next week's plan.
- **Reporting datasets milestone (11/6):** your notes don't say whether this date will slip. I've marked it "at risk". Add a revised date if you have one.
- **Go-live (12/7):** your notes don't say whether it's affected. I've marked it "under review". Confirm that's how you want to put it.
- **Risk owners:** check that Harlow IT should own the workspace risk (Greg is chasing it but isn't named as owner). The net sales and code freeze risks need owners named.
- **Steerco:** confirm the actual date. The report only says "Thursday of next week".
- **Due date:** Meera wants the update before steerco, so send it before that Thursday.

This is a draft only and hasn't been sent.