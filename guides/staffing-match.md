# How to use staffing-match

**When to use it:** when you need to decide who to assign to a project.

**What to paste in:** the project description with its required skills, seniority and dates, plus the consultant roster. See `sample-data/consultant-roster.csv` for the format. If the project's skills and dates are missing, the skill asks for them before suggesting anyone.

**What you get back:** a table with a recommended consultant and a backup for each role, their availability, why they were chosen, and any gaps or risks. It also tells you if the best match isn't available and what you lose without them, and lists anything you should confirm.

**How it decides:**
- No one under 50% availability is recommended.
- Only skills listed on the roster count. A consultant's current project isn't treated as a skill.
- If no one has the seniority asked for, it recommends the closest match and says so under Gaps and risks.
- If no one fits a role, it says "No one qualifies" instead of forcing a pick.

**Check before you use it:** make sure the roster is up to date and the project description is complete. Then review the gaps, the risks and anything listed under "Missing information."

**You stay in charge:** the skill only recommends. Staffing decisions belong to the staffing lead.
