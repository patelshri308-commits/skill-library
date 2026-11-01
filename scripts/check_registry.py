"""Check that every skill is registered, named correctly, tested and documented."""
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parent.parent
registry = (ROOT / "REGISTRY.md").read_text()
changelog = (ROOT / "CHANGELOG.md").read_text()
registered = set(re.findall(r"^\|\s*`([a-z0-9-]+)`", registry, re.MULTILINE))

problems = []
for skill_md in sorted((ROOT / "skills").glob("*/SKILL.md")):
    folder = skill_md.parent.name
    match = re.search(r"^name:\s*(\S+)", skill_md.read_text(), re.MULTILINE)
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

print("\n".join(problems) or "All skills registered, named, tested and documented.")
sys.exit(1 if problems else 0)
