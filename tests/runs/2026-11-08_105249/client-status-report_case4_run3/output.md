# Harlow Foods data platform: weekly status, week of 10/26

**Overall status:** Amber. User testing will probably start about two weeks late, and finance needs to decide how net sales should be calculated before we can sign off the sales reporting.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Core data loading and cleansing | 10/16 | Complete |
| Business reporting data models | 11/6 | At risk: 7 of 11 complete and tested; the other 4 are in progress, and the inventory models need more work |
| User testing starts | 11/9 | **Slipping:** probably 11/23 (to be confirmed in next week's revised plan) |
| Go-live | 12/7 | Under review: we'll confirm it in next week's revised plan, after the user testing slip |

## Done this week
- The daily data feed from the ERP system is now running reliably.
- Customer and product records now keep a full history of changes, so reports can show how things looked at any point in time. This is live.
- We found the cause of the missing store references in sales data: two older point-of-sale feeds.
- 7 of the 11 business reporting models have passed quality checks. The other 4 are in review.
- We demoed the sales reporting to Greg on Wednesday, including the drill-down by region.

## Next week
- Finish the last 4 reporting models, including the inventory models.
- Set up access in Power BI so each regional manager sees only their own region's data.
- Prepare the user testing environment once Harlow IT has provided the workspace.
- Share a revised plan with updated dates for user testing and go-live.
- Start the operating guide and handover documents.

## Risks and blockers (with owner)
- **Net sales doesn't match finance's month-end figure (high priority).** Net sales in the new reporting is about 1.5% off finance's month-end number. We think this is down to when returns are counted. We can't sign off the sales reporting until Harlow finance confirms which definition is correct. *Owner: to be confirmed*
- **User testing workspace not yet provided.** Harlow IT has had the request since 10/19. This delay is one of the reasons user testing is moving. *Owner: Greg (following up with Harlow IT)*
- **Inventory models need more work.** This is the other reason user testing is moving. *Owner: Elena*
- **Black Friday code freeze.** We need the exact freeze dates so the testing and go-live plan can work around them. *Owner: to be confirmed*

## Decisions needed from you
1. **Net sales definition:** Harlow finance to confirm which definition is correct, in particular how returns should be timed.
2. **Code freeze dates:** please confirm the exact dates of the Black Friday code freeze.
3. **Loyalty data:** adding a loyalty data source isn't in the current scope. If you'd like it, we'll raise a change request covering effort and impact on the timeline.

Also: the steering committee meeting has moved to Thursday next week.

---

## Left out of the report
- Snowflake credits running high because of backfills (our cloud cost).
- Diego possibly moving to Brightwell part-time (our staffing).
- Ticket numbers (HFD-412, 398, 431, 440) and technical terms (CDC, SCD2, RLS, gold/silver/bronze, marts).
- Meera wanting the update before the steering committee (internal note).

## Check before sending
- **Status level:** I chose Amber. You might want Red, given the high-priority finance mismatch and the likely knock-on effect on go-live.
- **Date for reporting models:** the notes are from the week of 10/26 and don't give a new date for the 11/6 milestone. Confirm whether it's still achievable before you call it "at risk" or "slipped".
- **User testing on 11/23:** the notes say "prob", so I marked it provisional. Confirm you're happy sharing that date before the revised plan is ready.
- **Go-live:** the notes don't say whether 12/7 still holds. Confirm the wording.
- **Owners:** I assumed Greg owns following up with Harlow IT, since he's "chasing". Assign owners for the net sales and code freeze items if you can, perhaps a named contact in Harlow finance.
- **Steering committee:** consider giving the actual date instead of "Thursday next week". Meera wants this before that meeting, so send it in time.
- **Naming Elena and Greg:** check you're comfortable naming them in a client-facing document.