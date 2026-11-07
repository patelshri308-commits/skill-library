"""Check that every skill is registered, named correctly, tested, documented and has the required rules."""
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parent.parent
registry = (ROOT / "REGISTRY.md").read_text()
changelog = (ROOT / "CHANGELOG.md").read_text()
registered = set(re.findall(r"^\|\s*`([a-z0-9-]+)`", registry, re.MULTILINE))

# Library-wide rules every SKILL.md must contain (see README "Required in every skill").
REQUIRED_RULES = [
    "Work only from the input's own dates. Never refer to today's date or speculate "
    "about what has happened since.",
]

problems = []
for skill_md in sorted((ROOT / "skills").glob("*/SKILL.md")):
    folder = skill_md.parent.name
    text = skill_md.read_text()
    match = re.search(r"^name:\s*(\S+)", text, re.MULTILINE)
    name = match.group(1) if match else None
    if name != folder:
        problems.append(f"{folder}: frontmatter name is {name!r}")
    if folder not in registered:
        problems.append(f"{folder}: missing from REGISTRY.md")
    if not (ROOT / "tests" / f"{folder}.md").exists():
        problems.append(f"{folder}: no tests file")
    if not (ROOT / "guides" / f"{folder}.md").exists():
        problems.append(f"{folder}: no guide")
    if folder not in changelog:
        problems.append(f"{folder}: no CHANGELOG.md entry")
    flat = " ".join(text.split())  # ignore line wrapping
    for rule in REQUIRED_RULES:
        if rule not in flat:
            problems.append(f"{folder}: missing required rule: {rule!r}")

print("\n".join(problems) or "All skills registered, named, tested, documented and carry the required rules.")
sys.exit(1 if problems else 0)
