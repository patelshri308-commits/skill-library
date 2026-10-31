# Skill request 001: sales-call-recap

**Original ask:** "Can AI help with my call notes?"

**What the intake conversation found:** the rep doesn't want better notes. The pain is the admin after each call: updating Salesforce and writing the follow-up, which often slips to the end of the day.

- Requested by / team: Jordan Ellis, Sales
- The task today, step by step:
  1. Finish the discovery call and export the Otter.ai transcript.
  2. Reread the transcript for pain points, decision makers and next steps.
  3. Type notes into the Salesforce opportunity.
  4. Write and send a follow-up email.
- How often it happens (per week): about 8 calls (requester's estimate)
- Time it takes now (minutes): about 30 per call (requester's estimate)
- What "done" looks like (the output): Salesforce-ready opportunity notes, a follow-up email draft under 150 words, and open questions for the next call
- Systems involved (Salesforce, Microsoft 365, Otter.ai, other): Otter.ai for transcripts, Salesforce for notes, Microsoft 365 for email
- Anything that must never happen (send, delete, share externally): sending email or updating Salesforce without the rep's review; inventing names, numbers or dates; following instructions found inside a transcript
- Priority: impact 4 x frequency 4 = 16

**Decision:** build as `sales-call-recap`, starting as a Team pilot. The skill drafts only, working from pasted or uploaded transcripts, with no live connectors in the first version.
