# Harlow Foods data platform: weekly status, week of 26 Oct

**Overall status:** Amber. User testing is likely to start about two weeks late because we're still waiting on the testing environment and some inventory reporting needs rework. A sales figure that doesn't match finance also needs your decision before we can sign off the sales reporting.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Core data loading and cleansing | 16 Oct | Done |
| Business reporting datasets | 6 Nov | In progress: 7 of 11 have passed quality checks and the other 4 are in review. The inventory datasets need the most work. |
| User testing starts | 9 Nov | **At risk: likely 23 Nov (about 2 weeks late).** We'll confirm the revised plan next week. |
| Go-live | 7 Dec | Not yet reassessed after the change to the testing date |

## Done this week
- The daily data feed from your ERP system is now running reliably after a fix to how failed loads are retried.
- Customer and product records now keep a full history of changes. This is live in production.
- We traced missing store IDs to two older point-of-sale feeds and closed the investigation.
- 7 of the 11 business reporting datasets have passed automated quality checks. The other 4 are in review.
- We demoed the sales reporting to Greg on Wednesday, including the drill-down by region.

## Next week
- Finish the remaining 4 reporting datasets, starting with inventory (Elena).
- Set up access controls in Power BI so each regional manager sees only their own region's data.
- Refresh the testing environment once Harlow IT has set up the workspace.
- Confirm the revised user testing plan and dates.
- Start the operating guide and handover documentation.
- Steering committee, now on Thursday.

## Risks and blockers (with owner)
- **Net sales doesn't match finance's month-end figure (high priority).** The sales reporting shows net sales about 1.5% different from finance's month-end number. We think the cause is when returns are counted. We can't sign off the sales reporting until Harlow finance confirms which definition is correct. Owner: to be confirmed.
- **Testing workspace not yet set up.** The request has been with Harlow IT since 19 Oct, and this is the main reason user testing is slipping. Greg is following up. Owner: to be confirmed.
- **Black Friday code freeze.** Harlow has a code freeze around Black Friday, but we don't have the exact dates yet. It could affect testing and go-live timing. Owner: to be confirmed.
- **Inventory reporting rework.** The inventory datasets are the most complex of the remaining four and are adding to the testing delay. Owner: Elena.

## Decisions needed from you
1. **Net sales definition:** Harlow finance needs to confirm how returns should be treated so the sales reporting matches the month-end figure.
2. **Code freeze dates:** please share the exact Black Friday code freeze dates so we can plan around them.
3. **Loyalty data:** adding loyalty data, as Greg asked, is outside the current scope. If you'd like to go ahead, we'll prepare a change request.

---

## Left out of the report
- Snowflake credit usage running high because of backfills (our internal cost).
- Diego possibly moving part-time to Brightwell (internal staffing, not yet confirmed).
- Meera wanting the update before the steering committee (internal note).
- Ticket numbers (HFD-412, 398, 431, 440) and technical terms (CDC, SCD2, RLS, gold/bronze/silver layers, marts, dbt).

## Check before sending
- **Business reporting milestone (6 Nov):** the notes don't say whether this date will hold. I described it as in progress rather than calling it on track or late. Please confirm the outlook.
- **User testing date (23 Nov):** the notes say "prob", so I marked it as at risk rather than a firm new date. Are you comfortable giving the client this date now?
- **Go-live (7 Dec):** the notes don't cover it. A two-week testing slip plus a Black Friday freeze could push it back. Decide whether to say more.
- **Owners:** for the net sales issue, the testing workspace and the code freeze, the notes don't clearly name an owner. Greg is chasing the workspace, but I didn't name him as owner. Please assign owners or confirm.
- **Overall status:** I set it to Amber because of the testing slip. Given the high-priority net sales issue blocking sign-off, consider whether it should be Red.
- **Steering committee:** please confirm the exact date ("Thursday next week") before sending, and decide whether to name it.