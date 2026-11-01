# Changelog

All skill changes, newest first, with the reason for each.

## 2026-10-31
- sales-call-recap 1.2.0: StageName, Amount and CloseDate now hold values only, after a
  Case 6 run put a paragraph in StageName, a Salesforce picklist. Added a rule against
  using past spend as a budget reference, after a borderline run called a $40k freelancer
  fee "the only reference point". Flags now carry timestamps and cover CRM requests.
- staffing-match 1.1.0: added a rule to list no consultants until the project's skills
  and dates are known. All 4 Case 6 runs listed everyone at 50% or more, which works
  as a shortlist before the dates that decide availability are known.
- client-status-report 1.2.0: added plain-language and risk-owner rules after 3 of 18
  runs failed. Two kept terms like "sales mart", and one named an owner the notes didn't
  assign. Three runs per case found these; the first single-run round did not.
- sales-call-recap 1.1.0: added a Call details section and a sentence check after
  every full recap ran 7-9 sentences against a limit of 5. Added "Flagged for the rep"
  because injection attempts were ignored but the rep was never told about them.
- client-status-report 1.1.0: added a rule keeping internal matters out of client
  reports, after a run put compute costs in a report even though its checklist passed.
  Added a "Left out for your review" list and the draft-only rule CLAUDE.md requires.
- sales-call-recap 1.0.0: first version, piloting with sales enablement.
- staffing-match 1.0.0: first version, piloting with the staffing lead.
- client-status-report 1.0.0: first version, piloting with the delivery lead.
