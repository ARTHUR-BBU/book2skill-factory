---
name: book2skill-factory
description: Transform any book into an executable Claude Code skill or plugin package. Use when: (1) converting a book into a skill that an agent can use to help users, (2) turning a book's frameworks, workflows, or style into deployable Claude Code skills, (3) packaging book-derived skills as a plugin for easy installation and sharing. Adapts output to book type — methodology books become workflow-driven strategy tools, writing craft books become style emulation engines, business biographies become decision-making frameworks. See references/fit-assessment.md for book suitability criteria and references/success-stories/blue-ocean-strategy.md for a complete case study.
---

# Book2Skill Factory

**Transform any book into an agent-readable, agent-usable skill system.**

The goal is not a book summary. The goal is to create a skill (or skill collection) that lets an agent **understand the book's core value, apply its methods, and help users solve real problems using the book's wisdom** — without the user ever needing to read the book.

---

## 🎯 Core Principle

**Every book has extractable value.** The skill of this skill is figuring out WHAT kind of value, and packaging it into the right skill format.

| Book Type | What to Extract | Skill Format |
|-----------|----------------|--------------|
| Methodology / Framework books (e.g., *Blue Ocean Strategy*) | Workflows, frameworks, decision tools | Multi-skill package with references |
| Writing / Style books (e.g., *On Writing*, *Storyworthy*) | Voice, structure, rhetorical patterns | Style emulation skill with examples |
| Business Biography (e.g., *Shoe Dog*, *The Everything Store*) | Decision patterns, leadership principles | Decision framework skill with case studies |
| Personal Productivity (e.g., *Atomic Habits*, *Deep Work*) | Systems, habits, daily practices | Action-oriented skill with checklists |
| Sales / Negotiation (e.g., *Never Split the Difference*, *SPIN Selling*) | Tactical scripts, situational frameworks | Scenario-driven skill with playbooks |
| Academic / Research (e.g., *Thinking Fast and Slow*) | Mental models, cognitive tools | Analytical skill with thinking prompts |
| Fiction (e.g., *1984*, *The Great Gatsby*) | Narrative techniques, voice, worldbuilding | Creative writing emulation skill |

**Key insight:** A novel probably shouldn't become a "strategy analysis tool" — but it can become a "write in the style of this author" skill. The assessment step determines the right approach.

---

## ⚡ Quick Start

1. **Input:** A book (PDF/EPUB/Markdown/Readable link/text)
2. **Process:** Assess → Determine skill type → Extract → Generate → Package
3. **Output:** A deployable skill or plugin package
4. **Deployment:** Copy to `~/.claude/skills/` or install as plugin

**Proven result:** Blue Ocean Strategy → multi-skill plugin package with 6 workflow-driven skills

---

## 📖 When to Use

Use this skill when the user wants to:

- "Convert this book into a skill"
- "Make this book's method usable by an agent"
- "Turn this book into something Claude can use to help me"
- "I want an agent that understands this book"

**See:** `references/fit-assessment.md` for detailed criteria on what types of value different books yield

---

## 🛠️ Workflow

### Step 1: Book Assessment & Strategy Decision

**This is the most important step.** It determines everything that follows.

**Analyze the book across 3 dimensions:**

1. **Content type** — Is it frameworks? Stories? Techniques? Research? Style?
2. **Extractable value** — What can an agent DO with this knowledge? Help users make decisions? Write in a certain style? Avoid mistakes? Execute a process?
3. **Structure** — How many distinct, independent tools/methods/patterns does it contain?

**Decision matrix:**

```
IF the book has 3+ distinct frameworks with clear inputs/outputs:
  → Multi-skill package (one skill per framework)
  → Include references for progressive disclosure
  → Include templates for key frameworks

IF the book has 1-2 core methods or a unified system:
  → Single skill with multiple sections
  → References for depth, templates for practice

IF the book's value is in style/voice/technique (writing, rhetoric, storytelling):
  → Style emulation skill with pattern library
  → Include before/after examples as references

IF the book teaches through stories/cases (biography, narrative nonfiction):
  → Extract decision patterns and principles
  → Build scenario-based skill with case references

IF the book is philosophical/abstract:
  → Extract thinking prompts and mental models
  → Build analytical/reflective skill
```

**Output of Step 1:**
```
Book: [Title]
Book Type: [Methodology / Style / Biography / Productivity / etc.]
Extractable Value: [What an agent can DO with this]
Recommended Skill Strategy: [Multi-skill / Single skill / Style emulation / etc.]
Recommended Skills: [number] — [list names]
Reference Strategy: [What goes into references]
Template Strategy: [What templates to create, if any]
```

**See:** `references/fit-assessment.md` for detailed criteria

---

### Step 2: Extract Core Units

Based on the strategy from Step 1, extract the book's actionable content.

**For methodology books — extract task units:**

For each framework/tool:
1. **Name** (kebab-case): `eliminate-reduce-raise-create`
2. **Problem Solved:** What real-world problem does it solve?
3. **Trigger When:** When should the agent invoke this?
4. **Input:** What does the user need to provide?
5. **Output:** What does the skill produce?
6. **Workflow:** Step-by-step process
7. **Constraints:** What NOT to do, common anti-patterns

**For style/craft books — extract patterns:**

1. **Pattern Name:** "The reveal technique"
2. **Pattern Description:** What this technique does
3. **Mechanics:** How it works (sentence structure, pacing, word choice)
4. **Examples:** Before/after from the book
5. **When to Use:** Situations where this pattern shines

**For biography/narrative books — extract decisions:**

1. **Decision Point:** "When to pivot vs persist"
2. **Context:** What was happening
3. **The Decision:** What the person chose
4. **Why:** Reasoning and principles
5. **Outcome:** What happened
6. **Generalizable Rule:** What can others learn

---

### Step 3: Design Package Structure

Based on the strategy from Step 1, choose the right structure.

**Option A: Official Plugin Package (for multi-skill, shareable output)**

```
[book-name]-pro/
├── .claude-plugin/
│   └── marketplace.json              # Plugin registration
├── plugins/
│   └── [book-name]-pro/
│       ├── skills/                    # Individual skills
│       │   ├── [skill-1]/
│       │   │   └── SKILL.md
│       │   └── [skill-2]/
│       │       └── SKILL.md
│       ├── references/                # Deep methodology
│       │   ├── [topic-1].md
│       │   └── [topic-2].md
│       └── assets/templates/          # Worksheets (if applicable)
├── README.md
└── deploy/
    ├── install-official.sh
    └── install-independent.sh
```

**Option B: Simple Skill (for single-skill, lightweight output)**

```
[book-name]-skill/
├── SKILL.md              # Main skill
├── references/           # Deep dives
│   ├── [topic-1].md
│   └── [topic-2].md
└── assets/templates/     # Worksheets (if applicable)
```

**Key decision factors:**
- Plugin package → when the output has 2+ skills, user wants to share, or wants the "installed plugin" experience
- Simple skill → when the output is one unified skill, quick personal use

**⚠️ CRITICAL (v2.1 path fix):**
If using plugin format, `source` paths in marketplace.json MUST be:
```json
"source": "./plugins/[plugin-name]/skills/[skill-name]"
```
NOT `"./skills/[skill-name]"` (causes "Plugin directory not found" errors)

**Reference:**
- Official docs: https://code.claude.com/docs/en/plugin-marketplaces
- Example: https://github.com/anthropics/claude-plugins-official

---

### Step 4: Generate Skills

**For each skill unit, create a SKILL.md:**

**YAML frontmatter (CRITICAL — only `name` and `description`):**
```yaml
---
name: [skill-name]
description: [What it does]. Use when: (1) [trigger 1], (2) [trigger 2], (3) [trigger 3].
---
```

**Skill body structure:**
```markdown
# [Skill Name]

[One-sentence summary]

## Quick Start
[3-5 step workflow — user should be able to start in under a minute]

## When to Use This Skill
[Specific trigger scenarios — these MUST match the description triggers]

## Step-by-Step Workflow
[Detailed steps with guided questions and examples at each step]

## Common Mistakes
❌ [Mistake 1]
   ✅ [Fix]
❌ [Mistake 2]
   ✅ [Fix]

## Real-World Example
[Concrete case study from the book or real application]

## See Also
- references/[detailed-guide].md
```

**Quality gates:**
- [ ] Description has 3+ trigger scenarios
- [ ] Solves ONE clear problem per skill
- [ ] Independently callable — agent can use it without loading other skills
- [ ] Has at least one concrete example
- [ ] Includes what NOT to do (constraints/anti-patterns)

---

### Step 5: Write References

References are what make skills powerful — they provide the deep knowledge that the agent can draw on when the SKILL.md alone isn't enough. This is progressive disclosure: SKILL.md gives the quick version, references give the full methodology.

**Each reference file should include:**

1. **Complete Methodology** — theory, why it works, relationship to other tools
2. **Step-by-Step Guide** — detailed walkthrough with guided questions at each step
3. **Real-World Examples** — 2-3 case studies (from the book + modern applications)
4. **Common Pitfalls** — what goes wrong and how to avoid it
5. **Advanced Usage** — for experienced users, edge cases

**Reference structure:**
```markdown
# [Topic] - Complete Guide

## Overview
[What this is and why it matters]

## Core Framework
[Detailed explanation of the methodology]

## Step-by-Step Implementation
### Step 1: [Name]
**What to do:** [instructions]
**Guided questions:**
- [Question 1?]
**Example:** [concrete example]

## Case Studies
### Case 1: [Name]
[Background → Challenge → Application → Results]

## Common Pitfalls
❌ **Pitfall 1:** [desc]
   ✅ **Solution:** [how to avoid]

## Advanced Usage
[Tips for pros, edge cases]
```

---

### Step 6: Create Templates (If Applicable)

For frameworks that benefit from structured worksheets:

```markdown
# [Tool Name] Template

## Instructions
[How to fill this out]

## Worksheet
[Ready-to-use table/form]

## Example
[Filled-out example from the book]
```

**Quality check:**
- [ ] Can user copy and start filling immediately?
- [ ] Clear instructions included?
- [ ] Filled example included?

---

### Step 7: Create marketplace.json (Plugin Format Only)

**Only needed for Option A (plugin package).**

**Create `.claude-plugin/marketplace.json`:**

```json
{
  "$schema": "https://anthropic.com/claude-code/marketplace.schema.json",
  "name": "[plugin-name]-pro",
  "description": "[Complete description based on book]",
  "owner": {
    "name": "[Creator Name]",
    "email": "[email]"
  },
  "plugins": [
    {
      "name": "[skill-1-name]",
      "description": "[One-line description]",
      "version": "1.0.0",
      "author": { "name": "[Creator Name]" },
      "source": "./plugins/[plugin-name]/skills/[skill-1-name]",
      "category": "productivity"
    }
  ]
}
```

**Template:** `deploy/marketplace.json.template`
**Common categories:** `productivity`, `development`, `learning`, `business`

---

### Step 8: Create Deployment Artifacts (Plugin Format Only)

**For plugin packages, generate deployment scripts.** The deploy scripts from this repository can be reused — just update `PLUGIN_NAME`.

See `deploy/README.md` for complete deployment documentation.

**Quick reference:**
```bash
# Install as independent marketplace (recommended)
cd deploy && ./install-independent.sh

# Install to shared marketplace
cd deploy && ./install-official.sh

# Simple skills: just copy to ~/.claude/skills/
cp -r [skill-dir] ~/.claude/skills/
```

---

### Step 9: Quality Check

**Content Quality:**
- [ ] All skills have clear descriptions with 3+ trigger scenarios
- [ ] Each skill solves ONE clear problem
- [ ] Skills are independently callable
- [ ] References provide depth beyond the skill body
- [ ] Templates are ready-to-use (if applicable)
- [ ] The agent can use these skills to help a user WITHOUT the user having read the book

**The Ultimate Test:**
> Can the agent, using only these skills and references, help a user who has NEVER read the book apply its methods to a real problem?

If yes → success. If no → the skills need more depth.

**Deployment Quality (plugin format only):**
- [ ] marketplace.json paths are correct
- [ ] Install scripts work without errors
- [ ] README has clear deployment instructions

---

## 📦 Output Summary

### What the User Gets

| Output | When | What |
|--------|------|------|
| **Skill or skill collection** | Always | SKILL.md files with workflow, triggers, examples |
| **References** | Always | Deep methodology for progressive disclosure |
| **Templates** | When frameworks need worksheets | Ready-to-use forms |
| **Plugin package** | Multi-skill or when user wants shareability | marketplace.json + deploy scripts |

### Why Plugin Format Matters

Even for personal use, plugin format gives users:
- **One-command install** — no manual file copying
- **Clean management** — see all book-plugins in one place
- **Shareability** — send to teammates, publish to GitHub
- **Sense of accomplishment** — "I turned a book into a real plugin"

---

## 📚 References & Examples

### For Book Assessment
- `references/fit-assessment.md` - Detailed criteria for evaluating books

### For Success Stories
- `references/success-stories/blue-ocean-strategy.md` - Complete case study
  - Multi-skill plugin package (6 workflow skills)
  - Full conversion walkthrough
  - Quality metrics

### For Deployment
- `deploy/README.md` - Complete deployment manual & troubleshooting
- `deploy/marketplace.json.template` - Template for marketplace.json

### For Testing
- `tests/blue-ocean-strategy-mvp.md` - MVP test case
- `examples/usage-examples.md` - Usage examples across book types

### For Known Issues
- `fixes/v2.1-path-fix.md` - Path fix notes (v2.1)

---

## ⚠️ Common Issues

### Skills Not Loading
- Restart Claude Code after installation
- Check `~/.claude/skills/` or `~/.claude/plugins/` path is correct
- Validate YAML frontmatter — only `name` and `description` fields allowed

### marketplace.json Path Errors (v2.1 fix)
- `source` must be `./plugins/[plugin-name]/skills/[skill-name]` — NOT `./skills/[skill-name]`

See `deploy/README.md` for complete troubleshooting.

---

## 🎯 Success Metrics

A successful book2skill conversion should achieve:

✅ **Agent-readable** — The agent loads the skill and immediately understands what the book's methods are
✅ **Agent-usable** — The agent can apply the methods to help a user solve real problems
✅ **User-independent** — The user does NOT need to have read the book to benefit
✅ **Deployable** — One-command installation, works immediately
✅ **Shareable** — Packaged so others can install and use

**The final measure:** After conversion, a user should be able to say to the agent *"Use the ERRC framework to help me redesign my product"* and get professional-grade output — without ever having opened Blue Ocean Strategy.
