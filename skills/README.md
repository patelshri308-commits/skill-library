# How to write a skill

Every skill is a folder with a `SKILL.md` inside it. The folder name is
function-task, lowercase with hyphens, and matches the `name` in the frontmatter.

## Work in this order

1. **Description.** Say what the skill does and when to use it, in the words
   people actually type. Claude reads only the name and description when
   deciding whether to load a skill.
2. **Output format.** Decide what a good result looks like before anything else.
3. **Rules.** List what must never happen. Each rule should stop a specific
   mistake, so if you can't name the mistake, cut the rule.
4. **Steps.** Write only the steps needed to produce that output.
5. **Example (optional).** One short example if the format is easy to misread.

## File skeleton

```markdown
---
name: function-task
description: What it does. Use when someone asks for X or shares Y.
---

# Skill title

## Inputs
## Steps
## Output format
## Rules
## Example
```

## Check before you call it done

- Does it do one job? If it needs "and also," it's two skills.
- Does it draft or recommend only? Skills never send, update or delete.
- Does every rule have a sample-data trap or test that proves it works?
- Could it invent something? Say what to write instead when information is missing.

## Every new skill also needs

- A row in `REGISTRY.md`
- `tests/<skill>.md`
- `guides/<skill>.md`
- An entry in `CHANGELOG.md`
