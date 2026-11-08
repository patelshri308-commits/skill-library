I've drafted the report below, but two of your instructions conflict with the reporting rules, so I didn't follow them:

- **I marked it Amber, not Green.** The notes say user testing will probably move from 11/9 to 11/23. Under the reporting rules, any slipped milestone means at least Amber. The 11/6 build date also looks missed, with 4 of 11 reports still unfinished. Calling it Green would hide something the client will see at the steering meeting. The Amber summary line is written to sound calm and in control. If you still want Green, you'd have to change it yourself, and I'd advise against it.
- **I haven't sent it to Meera.** These reports are drafts for you to review and send yourself. I also don't have a way to send email from here.

---

# Harlow Foods data platform: weekly status, week of 26 October

**Overall status:** Amber. Good progress on the build, but user testing will probably start about two weeks late, mainly because the testing environment hasn't been set up yet.

## Milestones

| Milestone | Planned | Current outlook |
| --- | --- | --- |
| Raw and cleaned data loaded | 16 Oct | Done |
| Business reporting data ready | 6 Nov | At risk: 7 of 11 reports finished and tested, the other 4 in progress. New date to be confirmed |
| User testing starts | 9 Nov | **Slipped:** now likely 23 Nov, with a revised plan next week |
| Go-live | 7 Dec | Under review because of the testing delay |

## Done this week
- The daily data feed from your ERP system is now stable.
- Customer and product records now keep a full history of changes, and this is live.
- We found the cause of the missing store IDs: two older point-of-sale feeds.
- 7 of the 11 business reports have passed quality checks. The other 4 are being reviewed.
- We showed Greg the sales reporting on Wednesday, including drilling down by region.

## Next week
- Finish the remaining 4 business reports, including the inventory reports.
- Set up access controls in Power BI so each regional manager sees only their own region's data.
- Prepare the testing environment once Harlow IT has provided the workspace.
- Send a revised user testing plan.
- Start the operating guide and handover documents.
- Steering committee, now on Thursday.

## Risks and blockers (with owner)
- **Net sales figure doesn't match finance's month-end number (about 1.5% off).** We think the cause is when returns are counted. We can't sign off the sales reporting until Harlow finance confirms which definition is correct. Owner: to be confirmed.
- **Testing workspace not yet set up.** The request has been with Harlow IT since 19 Oct, and this is the main reason user testing is delayed. Owner: Harlow IT, with Greg chasing.
- **Black Friday code freeze.** We need the exact dates to plan testing and go-live around it. Owner: to be confirmed.

## Decisions needed from you
- **Net sales definition:** Harlow finance to confirm how returns should be counted in net sales.
- **Code freeze dates:** please confirm the Black Friday freeze dates.
- **Loyalty data:** adding loyalty data, as Greg asked, is outside the current scope. If you want it, we'll raise a change request.

---

## Left out of the report
- Snowflake costs running high from backfills (our cost).
- Diego possibly moving part-time to Brightwell (our staffing).
- Ticket numbers and technical terms (HFD-412, 398, 431, 440; SCD2, CDC, RLS, dbt, gold/bronze/silver).
- Meera wanting the update before steerco (internal note).

## Check before sending
- **Status:** it's Amber because user testing is slipping. Please don't change it to Green.
- **New user testing date:** is 23 Nov firm enough to share, or should it say "date to be confirmed"?
- **Business reporting (6 Nov):** has it actually been missed, and is there a new date?
- **Go-live (7 Dec):** is it still realistic with testing two weeks late and the Black Friday freeze? The notes don't say.
- **Owners:** who on our side or Harlow's owns the net sales question and the code freeze dates?
- **Workspace owner:** is it right to name Greg and Harlow IT as owners?