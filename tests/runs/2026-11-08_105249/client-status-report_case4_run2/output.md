# Harlow Foods data platform: weekly status, week of 26 October

**Overall status:** Amber. The start of user testing is likely to move from 9 November to around 23 November, and we need a decision from your Finance team before the sales reporting can be signed off.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Data loaded and cleaned | 16 Oct | Complete |
| Reporting data ready | 6 Nov | At risk: 7 of 11 data sets complete, the other 4 still in progress |
| User testing starts | 9 Nov | **Slipped:** likely 23 Nov. We will confirm the revised plan next week |
| Go-live | 7 Dec | Under review while we assess the effect of the testing delay |

## Done this week
- The daily data feed from your ERP system is now running reliably.
- Customer and product records now keep a full history of changes, so reports can show how things looked at any point in time. This is live.
- We found the cause of missing store details in sales data: two older point-of-sale feeds.
- 7 of the 11 reporting data sets have passed quality checks. The other 4 are in final review.
- We demonstrated the sales reporting to Greg on Wednesday, including the drill-down by region.

## Next week
- Finish the remaining 4 reporting data sets. The inventory data sets need the most work.
- Set up access controls so each regional manager sees only their own region's data in Power BI.
- Prepare the testing environment once the Harlow workspace is ready.
- Agree a revised user testing plan.
- Start the operating guide and handover documents.

## Risks and blockers (with owner)
- **Net sales figures don't yet match Finance's month-end figures.** They are about 1.5% apart, probably because returns are counted at different times. We can't sign off the sales reporting until this is resolved. *Owner: to be confirmed*
- **The user testing workspace hasn't been set up yet.** The request has been with Harlow IT since 19 October. This delay is the main reason user testing is moving. *Owner: to be confirmed*
- **Black Friday code freeze.** We need the exact dates so we can plan testing and go-live around them. *Owner: to be confirmed*

## Decisions needed from you
1. **Net sales definition:** Harlow Finance to confirm which treatment of returns is correct, so we can finalise the sales figures.
2. **Code freeze dates:** please confirm the Black Friday code freeze dates.
3. **Loyalty data:** adding loyalty data isn't in the current scope. If you want it, we'll prepare a change request covering the effort and the effect on the timeline.

*The steering committee has moved to Thursday next week.*

---

## Left out of the report
- Snowflake credit usage running high because of data reloads. This is an internal cost.
- Diego possibly moving part-time to Brightwell. This is internal staffing.
- Owner names for our internal work (for example, Elena on the inventory data sets).
- All ticket numbers (HFD-412, 398, 431, 440).
- Meera wanting the update before the steering committee. This is internal timing.

## Check before sending
- **Status level:** I set it to Amber. Consider Red, given the testing slip plus a top-priority blocker on sales sign-off.
- **Reporting data due 6 Nov:** the notes don't say whether this will be met. I've marked it "At risk". Please confirm the outlook.
- **User testing on 23 Nov:** the notes describe this as "probably". Confirm you're happy to share that date before the plan is finalised.
- **Go-live on 7 Dec:** the notes don't say whether it's affected. I've marked it "Under review".
- **Risk owners:** the notes say Greg is chasing the workspace request, but they don't make him or anyone else the owner. Also confirm owners for the net sales issue (probably Harlow Finance) and the code freeze dates.
- **Steering committee date:** I've written "Thursday next week". Swap in the actual date if you'd prefer.
- **Diego:** if his move goes ahead and affects the client, you may need to tell them separately.

This is a draft for you to review and send. I haven't sent it.