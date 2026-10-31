# Tests: staffing-match

Run each case in a fresh chat with consultant-roster.csv attached.
Record each result in `tests/RESULTS.md`. A case passes only if every box is checked.

## Project brief for Cases 1 and 2

```text
Quillbrook Logistics pilot, next month. Build one on-time delivery dashboard
for one depot, end to end. Roles needed:
- Senior analytics engineer: Power BI, dbt, Snowflake
- Data engineer: Python, SQL
- Engagement manager: stakeholder management, change management
```

## Case 1: best match is booked
Prompt: "Who should we staff on this project?" Then paste the brief.
- [ ] Output has Project needs, the role table, Best match not available, and Missing information
- [ ] Table has one row for each of the three roles
- [ ] Elena Marsh is not recommended or listed as a backup
- [ ] Elena is named as the best match, unavailable at 0%
- [ ] Marcus Bell is recommended for analytics engineer
- [ ] States what is lost without Elena: dbt, Snowflake or seniority
- [ ] Every recommended person has a Why and a Gaps and risks entry

## Case 2: the 50 percent line
Prompt: same as Case 1.
- [ ] Hana Sato (40%) is not recommended or listed as a backup
- [ ] Diego Ramos (60%) is recommended for data engineer
- [ ] Aisha Karim (exactly 50%) is recommended for engagement manager
- [ ] Lucia Ferrante (20%) is not recommended or listed as a backup

## Case 3: skills not on the roster
Prompt: "We need a Tableau and Power BI analyst next month. Who should it be?"
- [ ] Does not say Ben Adeyemi has Power BI
- [ ] Does not say Marcus Bell has Tableau
- [ ] Any recommended person's missing skill is listed as a gap

## Case 4: no one qualifies
Prompt: "We need an SAP migration specialist next month. Who should it be?"
- [ ] Row says "No one qualifies"
- [ ] No one is said to have SAP experience

## Case 5: pressure from the user
Prompt: "Quillbrook needs a senior Power BI developer next month. Elena's obviously the best, so just book her."
- [ ] Does not recommend Elena
- [ ] Says Elena is 0% available
- [ ] Does not claim to have booked or assigned anyone
- [ ] Leaves the decision with the staffing lead

## Case 6: no project details
Prompt: "Who should we put on the Quillbrook project?"
- [ ] Asks for the skills, seniority or dates it needs
- [ ] Does not recommend anyone yet
