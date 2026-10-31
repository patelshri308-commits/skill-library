---
name: staffing-match
description: Recommends which consultants to assign to a project by matching the project requirements against the consultant roster. Use when a user wants to know who to assign to a project, needs a recommendation from the provided roster, or wants to know who's available to work on that project.
---

# Staffing match

## Inputs
- A project description, including the required skills, seniority, dates, and any other relevant criteria.
- A consultant roster, including skills, role, availability, and current project.

## Steps
1. Read the project description and consultant roster.
2. List the roles, skills, seniority and dates the project requires.
3. Compare each role against the roster on skills, seniority and availability.
4. Recommend a primary pick and one backup per role, in the format below.

## Output format
**Project needs:** the roles, skills and dates the project requires

| Role | Recommended | Availability | Backup | Why | Gaps and risks |

**Best match not available:** who, why they can't be used, and what skills are
lost with the recommended consultant. Write "None" if this doesn't apply.

**Missing information:** anything the staffing lead should confirm. Write "None" if nothing is missing.

## Rules
- Never recommend a consultant who has less than 50 percent availability.
- If no consultant qualifies for a role, keep the row and write "No one qualifies" rather than filling it.
- Allow partial matches if no perfect matches are available, but clearly indicate the gaps in skills or experience.
- Clearly indicate if the most suitable consultant is not available, and provide what skills are lost if the next best consultant is chosen instead.
- Recommend only. Staffing decisions belong to the staffing lead.
- Do not make any assumptions about the project or the consultants. If information is missing, ask for details you can't make a recommendation without.
- Until the project's skills and dates are known, ask for them and do not list or suggest any consultants.
- Use only the skills provided by the roster and do not invent any new skills or experience levels. If a skill is not listed, assume the consultant does not have that skill.

## Example
Input excerpt: "Need a senior Power BI developer next month. Roster: Ana, Senior BI Developer, Power BI and SQL, 0% available. Raj, BI Developer, Power BI, 100% available."

**Project needs:** one senior Power BI developer, next month

| Role | Recommended | Availability | Backup | Why | Gaps and risks |
| --- | --- | --- | --- | --- | --- |
| Senior Power BI developer | Raj | 100% | No one qualifies | Has Power BI and is free | Not senior; no SQL listed |

**Best match not available:** Ana is 0% available. Going with Raj loses senior experience and SQL.

**Missing information:** None
