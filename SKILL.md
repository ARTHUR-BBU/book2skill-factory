---
name: book2skill-factory
description: Convert methodology books into Claude Code plugin packages that comply with official marketplace specifications. Use when: (1) turning business/methodology books into official plugin packages, (2) creating marketplace.json-compliant plugins with .claude-plugin directory structure, (3) generating plugins that deploy to ~/.claude/plugins/marketplaces/local-marketplace/, (4) building complete skill systems from books with references, templates, and deployment scripts. Outputs include: .claude-plugin/marketplace.json (plugin registration), skills/ directory with individual SKILL.md files, references/, assets/templates/, and deploy/ scripts. Ideal for entrepreneurship, product, strategy, management, sales, negotiation books. Proven success: Blue Ocean Strategy → official plugin package with marketplace.json, 6 tools, 46,000 words. See references/success-stories/blue-ocean-strategy.md for complete case study.
---

# Book2Skill Factory

**Transform methodology books into actionable Claude Code plugin packages.**

---

## 🎯 Core Principle

**One book = One plugin package with multiple skills.**

Don't create book summaries. Create **executable skill systems** that users can deploy to their local Claude Code and use immediately.

---

## ⚡ Quick Start (3-minute version)

### What This Does

1. **Input:** A methodology book (PDF/EPUB/Markdown/Readable link)
2. **Process:** Extract frameworks → Create skills → Write references → Package
3. **Output:** A deployable plugin package (4-12 skills, 40K-80K words)
4. **Deployment:** Copy to `~/.claude/skills/` or `~/.claude/plugins/`

**Time investment:** 5-8 hours for complete package
**Proven result:** Blue Ocean Strategy → 6 skills, 46,000 words, tested successfully

---

## 📖 When to Use

Use this skill when the user wants to:

- "Convert this book into Claude skills"
- "Make this framework usable in Claude Code"
- "Package this methodology as a plugin"
- "Turn these book concepts into executable tools"

**Best-fit books:** Entrepreneurship, product, strategy, management, sales, negotiation
**Avoid:** Novels, pure philosophy, narrative nonfiction

---

## 🛠️ 8-Step Workflow

### Step 1: Fit Assessment (5 min)

**Ask:**
- What are the key frameworks/tools in the book?
- What problems does each solve?
- Who is the target user?

**Output:**
```
Fit Level: High / Medium / Low
Recommended Skills: [4-12 skills]
Core Frameworks: [list 3-7 frameworks]
```

**Example:** Blue Ocean Strategy → High fit, 6 skills (ERRC, six paths, etc.)

**See:** `references/book-fit-assessment.md` for detailed criteria

---

### Step 2: Extract Task Units (30 min)

**For each framework/tool, define:**

1. **Task Name** (kebab-case): `eliminate-reduce-raise-create`
2. **Problem Solved:** What problem does it solve?
3. **Trigger When:** Specific user scenarios
4. **Input:** What user provides
5. **Output:** What skill produces
6. **Workflow:** Step-by-step process
7. **Constraints:** What NOT to do

**Output format:** See `references/task-unit-template.md`

---

### Step 3: Design Package Structure (5 min)

**IMPORTANT: Use official Claude Code plugin format**

**Official plugin structure:**
```
[book-name]-pro/
├── .claude-plugin/
│   └── marketplace.json              # REQUIRED - Plugin registration
├── plugins/                           # Plugin container (CRITICAL)
│   └── [book-name]-pro/               # Plugin directory (same name as parent)
│       ├── skills/                    # Individual skills (4-12)
│       │   ├── [tool-1]/
│       │   │   └── SKILL.md
│       │   ├── [tool-2]/
│       │   │   └── SKILL.md
│       │   └── ...
│       ├── references/                # Deep methodology (5K-8K each)
│       │   ├── [tool-1].md
│       │   ├── [tool-2].md
│       │   └── ...
│       └── assets/templates/          # Worksheets (optional)
│           └── ...
├── README.md
└── deploy/                            # Deployment scripts
    ├── install-official.sh
    ├── install-official.bat
    └── README.md
```

**KEY REQUIREMENTS:**
- ✅ `.claude-plugin/marketplace.json` - **MUST HAVE** (plugin registration)
- ✅ `plugins/[plugin-name]/skills/` directory structure
- ✅ marketplace.json source paths: `"./plugins/[plugin-name]/skills/[skill-name]"`
- ✅ Each skill has its own `SKILL.md` with YAML frontmatter
- ✅ Deployment scripts for `~/.claude/plugins/marketplaces/local-marketplace/`

**⚠️ CRITICAL PATH FIX (v2.1):**
The `source` paths in marketplace.json must include the full path from marketplace.json:
```json
"source": "./plugins/[plugin-name]/skills/[skill-name]"
```
NOT just `"source": "./skills/[skill-name]"` (this causes "Plugin directory not found" errors)

**Reference:**
- Official docs: https://code.claude.com/docs/en/plugin-marketplaces
- Example: https://github.com/anthropics/claude-plugins-official
- Local spec: `F:\Temp\book2skill-factory-official-spec.md`

---

### Step 4: Generate Skills (60-120 min)

**For each task unit, create a skill:**

**YAML frontmatter (CRITICAL):**
```yaml
---
name: [skill-name]
description: [What it does]. Use when: (1) [trigger 1], (2) [trigger 2], (3) [trigger 3].
---
```

**Skill body (<2,000 words):**
```markdown
# [Skill Name]

[One-sentence summary]

## Quick Start
[3-5 step workflow]

## When to Use This Skill
[Specific trigger scenarios]

## Step-by-Step Workflow
[Detailed steps]

## Common Mistakes
❌ [Mistake 1]
❌ [Mistake 2]

## Real-World Example
[Concrete case study]

## See Also
- references/[detailed-guide].md
```

**Quality checks:**
- [ ] Description has 3+ trigger scenarios
- [ ] Solves ONE clear problem
- [ ] Independently callable
- [ ] Has real examples

---

### Step 5: Write References (180-300 min total)

**Each reference file (5,000-8,000 words):**

1. **Complete Methodology** (theory)
2. **Step-by-Step Guide** (instructions)
3. **Guided Questions** (what to ask)
4. **Real-World Examples** (2-3 case studies)
5. **Common Pitfalls** (what goes wrong)
6. **Advanced Tips** (for experienced users)

**Structure:**
```markdown
# [Tool Name] - Complete Guide

## Overview
[What this tool is and why it matters]

## Core Framework
[Detailed explanation]

## Step-by-Step Implementation
### Step 1: [Name]
**What to do:** [instructions]
**Guided questions:**
- [Question 1?]
**Example:** [concrete example]
[... all steps ...]

## Case Studies
### Case 1: [Name]
[Background → Challenge → Application → Results]

## Common Pitfalls
❌ **Pitfall 1:** [desc]
   ✅ **Solution:** [how to avoid]

## Advanced Usage
[Tips for pros]

## Template
[Worksheet]
```

---

### Step 6: Create Templates (30-60 min)

**For tools benefiting from structured worksheets:**

```markdown
# [Tool Name] Template

## Instructions
[How to fill this out]

## Worksheet
[Ready-to-use table/form]

## Example
[Filled-out example]
```

**Quality check:**
- [ ] Can user copy and start filling immediately?
- [ ] Clear instructions?
- [ ] Example included?

---

### Step 6.5: Create marketplace.json (15 min)

**CRITICAL: This is the most important file for official plugin format.**

**Create `.claude-plugin/marketplace.json`:**

```json
{
  "$schema": "https://anthropic.com/claude-code/marketplace.schema.json",
  "name": "[plugin-name]-pro",
  "description": "[Complete description based on book]",
  "owner": {
    "name": "[Your Name]",
    "email": "[your.email@example.com]"
  },
  "plugins": [
    {
      "name": "[skill-1-name]",
      "description": "[One-line description]",
      "version": "1.0.0",
      "author": {
        "name": "[Your Name]"
      },
      "source": "./plugins/[plugin-name]/skills/[skill-1-name]",
      "category": "productivity",
      "homepage": "https://github.com/[username]/[repo]"
    },
    {
      "name": "[skill-2-name]",
      "description": "[One-line description]",
      "version": "1.0.0",
      "author": {
        "name": "[Your Name]"
      },
      "source": "./plugins/[plugin-name]/skills/[skill-2-name]",
      "category": "productivity"
    }
  ]
}
```

**Template location:** `deploy/marketplace.json.template`

**Common categories:**
- `productivity` - Tools for getting things done
- `development` - Coding and development tools
- `learning` - Educational and learning tools
- `business` - Business and strategy tools

---

### Step 7: Create Deployment Artifacts (15 min)

**CRITICAL: Make deployment easy and error-free.**

**Create `deploy/install.sh`:**
```bash
#!/bin/bash
# Auto-deployment script for [book-name]-pro

PLUGIN_DIR="$HOME/.claude/skills/[book-name]-pro"
mkdir -p "$PLUGIN_DIR"

# Copy files
cp -r skills/* "$PLUGIN_DIR/"
cp -r references "$PLUGIN_DIR/"
cp -r assets "$PLUGIN_DIR/"

echo "✅ Installed to $PLUGIN_DIR"
echo "🔄 Restart Claude Code to load skills"
```

**Create `deploy/verify.sh`:**
```bash
#!/bin/bash
# Verify deployment

SKILL_DIR="$HOME/.claude/skills/[book-name]-pro"

if [ -d "$SKILL_DIR" ]; then
    echo "✅ Plugin installed at $SKILL_DIR"
    echo "📋 Skills found:"
    ls "$SKILL_DIR" | grep "SKILL.md"
else
    echo "❌ Plugin not found. Run install.sh first."
fi
```

**Create `README.md` with deployment section:**
```markdown
## Deployment

### Option 1: Automated (Recommended)
```bash
cd deploy
chmod +x install.sh
./install.sh
```

### Option 2: Manual
```bash
cp -r [book-name]-pro ~/.claude/skills/
```

### Verify Installation
```bash
./deploy/verify.sh
```

### Common Issues

**Issue:** Skills not loading
- **Fix:** Restart Claude Code
- **Check:** `~/.claude/skills/[book-name]-pro/` exists?

**Issue:** YAML errors
- **Fix:** Ensure only `name` and `description` in frontmatter
- **Validate:** Use YAML validator

See `references/deployment-guide.md` for troubleshooting
```

---

### Step 8: Quality Check (30 min)

**Checklist:**

**Content Quality:**
- [ ] All skills have clear descriptions (3+ triggers)
- [ ] Each skill solves ONE problem
- [ ] Skills are independently callable
- [ ] References are 5,000+ words each
- [ ] Templates are ready-to-use

**Deployment Quality:**
- [ ] install.sh runs without errors
- [ ] verify.sh confirms installation
- [ ] README has clear deployment instructions
- [ ] Common errors documented

**Test:**
```bash
# Run verification
./deploy/verify.sh

# Test skill trigger
# In Claude Code: "Use [skill-name] to [problem]"
```

---

## 📦 Output: What User Gets

### Deliverables

1. **Skills Package** (complete directory structure)
2. **4-12 Skills** (each 1,000-2,000 words)
3. **References** (36,000-60,000 words total)
4. **Templates** (2-5 ready-to-use worksheets)
5. **Deployment Scripts** (one-command install)
6. **README** (overview + deployment guide)

### Deployment Location (Simple Approach - Recommended)

**Target directory:** `~/.claude/skills/[plugin-name]/`

**Why this location:**
- ✅ Claude Code automatically loads skills from here
- ✅ No marketplace.json needed
- ✅ No complex plugin structure
- ✅ Easy to verify and debug

**Structure options:**

**Option A: Single Skill (Like blue-ocean-strategy-pro)**
```
~/.claude/skills/blue-ocean-strategy-pro/
├── SKILL.md              # Main skill
├── references/           # Detailed docs
└── assets/templates/     # Worksheets
```

**Option B: Multi-Skill Package**
```
~/.claude/skills/[plugin-name]/
├── SKILL.md              # Optional main skill
├── skills/               # Individual skills
│   ├── tool-1/
│   │   └── SKILL.md
│   └── tool-2/
│       └── SKILL.md
├── references/
└── assets/templates/
```

### Deployment Process

**User experience:**
```bash
# 1. Download package
git clone [repo] or unzip [package]

# 2. Run installer (one command)
cd [plugin-name]/deploy
./install.sh    # or install.bat on Windows

# 3. Restart Claude Code
# Skills are now available!
```

**Total user time:** <3 minutes
**Error rate:** Near zero (simple copy operation)

---

## ⚠️ Common Deployment Issues

### Issue 1: Skills Not Loading

**Symptoms:** Skills don't trigger in Claude Code

**Causes:**
- Claude Code not restarted
- Wrong directory (`~/.claude/skills/` vs `~/.claude/plugins/`)
- YAML syntax errors

**Solutions:**
```bash
# Check directory
ls ~/.claude/skills/[book-name]-pro/

# Validate YAML
# Use: https://www.yamllint.com/

# Restart Claude Code
# Kill and reopen app
```

### Issue 2: YAML Frontmatter Errors

**Symptoms:** Skill fails to load

**Common mistakes:**
```yaml
❌ ---
name: skill
version: v1.0        # ← Extra fields
author: someone      # ← Extra fields
---

✅ ---
name: skill
description: Correct format
---
```

**Fix:** Only `name` and `description` fields

### Issue 3: Path Issues on Windows

**Symptoms:** Script fails on Windows

**Fix:** Provide `deploy/install.bat`:
```batch
@echo off
set PLUGIN_DIR=%USERPROFILE%\.claude\skills\[book-name]-pro
mkdir "%PLUGIN_DIR%"
xcopy /E /Y skills "%PLUGIN_DIR%\skills\"
echo Installed to %PLUGIN_DIR%
```

**See:** `references/deployment-troubleshooting.md` for complete guide

---

## 📚 References & Examples

### For Detailed Workflow
- `references/detailed-workflow.md` - Complete 8-step guide with examples
- `references/task-unit-template.md` - Task unit definition template
- `references/package-structures.md` - Package structure options

### For Success Stories
- `references/success-stories/blue-ocean-strategy.md` - Complete case study
  - 8-step process walkthrough
  - Time investment breakdown
  - Quality checklist
  - Final metrics (46,000 words, 6 skills)

### For Deployment
- `references/deployment-guide.md` - Complete deployment manual
- `references/deployment-troubleshooting.md` - Common issues & solutions
- `examples/deployment-scripts/` - Ready-to-use scripts (bash, batch, python)

### For Book Assessment
- `references/book-fit-assessment.md` - Detailed fit criteria
- `examples/book-evaluations/` - 30+ book evaluations

---

## 🎯 Success Metrics

A successful conversion should achieve:

✅ **Triggerable** - Each skill activates on relevant requests
✅ **Deployable** - One-command installation, no errors
✅ **Independent** - No book reading required to use
✅ **Actionable** - Produces specific decisions/recommendations
✅ **Validated** - Tested on real use cases

**Target output:**
- 4-12 skills
- 40,000-80,000 words total
- 2-5 templates
- <5 minute deployment time

---

## 🚀 Next Steps

**For first-time users:**
1. Read `references/success-stories/blue-ocean-strategy.md` (complete example)
2. Use `references/book-fit-assessment.md` to evaluate your book
3. Follow 8-step workflow
4. Test deployment with `deploy/install.sh`

**For experienced users:**
1. Customize workflow to your needs
2. Modify templates in `references/`
3. Contribute your success stories

---

**Remember:** Focus on **executable skill systems**, not book summaries. The goal is to create tools users can deploy and use immediately. 🚀
