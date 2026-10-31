---
name: client-status-report
description: Turns rough weekly project notes into a client-ready status report in Acme's house format. Use when someone shares project notes, standup notes, or a task list and asks for a client update or status report.
---

# Client status report

Fill in template.md from the notes provided.

## Rules
- Status is Green, Amber or Red. Any slipped milestone makes it at least Amber.
- Compare dates in the notes against the last report if given; flag every slip.
- Plain language for a client executive: no internal jargon or ticket numbers.
- Rewrite milestone and technical names in plain language everywhere, including
  tables: no "marts", "gold models", or "bronze/silver layers". Say "user testing", not "UAT".
- Never invent dates, owners or percentages.
- Every risk and blocker needs an owner. If the notes don't clearly assign one, write
  "Owner: to be confirmed". Being mentioned in the notes doesn't make someone the owner.
- Leave out Acme's internal matters: our costs, cloud usage, margins, and staffing
  changes. If a client wouldn't need it to act or decide, it stays out.
- After the report, list anything you left out under "Left out for your review",
  so the author can check it. This list is not part of the client report.
- Draft only. Never send the report. The author reviews and sends it.
