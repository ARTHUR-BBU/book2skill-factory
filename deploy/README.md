# Book2Skill Factory - Deployment Scripts

Quick-deploy scripts for Claude Code **official plugin packages** with marketplace.json support.

---

## 🚀 Quick Start

### Choose Your Deployment Method

**Option 1: Official Marketplace (Recommended for single plugin)**
- Single shared marketplace for all plugins
- Use when you want a centralized plugin management
- Scripts: `install-official.sh` / `install-official.bat`

**Option 2: Independent Marketplace (Recommended for multiple plugins)**
- Each plugin gets its own marketplace
- Use when deploying multiple book plugins to avoid conflicts
- Scripts: `install-independent.sh` / `install-independent.bat`

---

## 📋 Deployment Methods Comparison

| Feature | Official Marketplace | Independent Marketplace |
|---------|-------------------|----------------------|
| **Target Directory** | `~/.claude/plugins/marketplaces/local-marketplace/` | `~/.claude/plugins/marketplaces/{PLUGIN_NAME}-marketplace/` |
| **marketplace.json** | Shared (can be overwritten) | Independent (no conflicts) |
| **Multiple Plugins** | ⚠️ Requires careful merging | ✅ Fully isolated |
| **Best For** | Single plugin or carefully managed multiple plugins | Deploying multiple book plugins |
| **Complexity** | Simpler | Slightly more complex |

---

## 🔧 Usage

### Linux / macOS

**Official Marketplace:**
```bash
cd deploy
chmod +x install-official.sh
./install-official.sh
```

**Independent Marketplace:**
```bash
cd deploy
chmod +x install-independent.sh
./install-independent.sh
```

### Windows

**Official Marketplace:**
```batch
cd deploy
install-official.bat
```

**Independent Marketplace:**
```batch
cd deploy
install-independent.bat
```

---

## 📁 Directory Structure

### Official Marketplace Structure

```
~/.claude/plugins/marketplaces/local-marketplace/
├── .claude-plugin/
│   └── marketplace.json               # Shared configuration (REQUIRED)
└── plugins/
    ├── blue-ocean-strategy-pro/
    │   ├── skills/
    │   ├── references/
    │   └── assets/
    └── lean-startup-pro/
        ├── skills/
        ├── references/
        └── assets/
```

### Independent Marketplace Structure

```
~/.claude/plugins/marketplaces/
├── blue-ocean-strategy-pro-marketplace/
│   ├── .claude-plugin/
│   │   └── marketplace.json          # Isolated configuration (REQUIRED)
│   └── plugins/
│       └── blue-ocean-strategy-pro/
│           ├── skills/
│           ├── references/
│           └── assets/
└── lean-startup-pro-marketplace/
    ├── .claude-plugin/
    │   └── marketplace.json          # Isolated configuration (REQUIRED)
    └── plugins/
        └── lean-startup-pro/
            ├── skills/
            ├── references/
            └── assets/
```

---

## 🎯 What These Scripts Do

### install-official.sh / install-official.bat

- Checks for `.claude-plugin/marketplace.json`
- Creates `~/.claude/plugins/marketplaces/local-marketplace/`
- Copies marketplace.json to root
- Copies all skills, references, assets, templates
- Validates the installation
- Shows friendly progress messages

**Time:** <10 seconds
**Error rate:** Near zero (automated checks)

### install-independent.sh / install-independent.bat

- Checks for `.claude-plugin/marketplace.json`
- Creates `~/.claude/plugins/marketplaces/{PLUGIN_NAME}-marketplace/`
- Copies marketplace.json to isolated marketplace
- Copies all skills, references, assets, templates
- Validates the installation
- Shows friendly progress messages

**Time:** <10 seconds
**Error rate:** Near zero (automated checks)
**Conflicts:** None (fully isolated)

---

## ⚠️ Conflict Warning

### When to Use Independent Marketplace

**Use Independent Marketplace when:**
- ✅ Deploying multiple book plugins
- ✅ Want complete isolation between plugins
- ✅ Don't want to manage marketplace.json manually

**Use Official Marketplace when:**
- ✅ Deploying a single plugin
- ✅ Want centralized plugin management
- ✅ Comfortable merging marketplace.json manually

### The Problem with Official Marketplace

When you deploy multiple plugins using `install-official.sh`:
1. First plugin: Copies marketplace.json to local-marketplace/
2. Second plugin: Overwrites marketplace.json → First plugin registration lost!
3. Solution: Use `install-independent.sh` or manually merge marketplace.json

---

## 🎯 Post-Installation

### 1. Restart Claude Code

The new marketplace will be automatically discovered and loaded.

### 2. Verify Installation

**Linux/Mac:**
```bash
ls ~/.claude/plugins/marketplaces/
```

**Windows:**
```batch
dir %USERPROFILE%\.claude\plugins\marketplaces
```

### 3. Test the Skills

In Claude Code, try:
```
"Use [skill-name] to [problem]"
```

---

## 🐛 Troubleshooting

### Issue: Skills Not Loading

**Solutions:**
1. Restart Claude Code
2. Verify marketplace.json exists
3. Check file permissions
4. Validate YAML frontmatter (only `name` and `description` fields)

### Issue: marketplace.json Conflicts

**Symptoms:**
- Second plugin overwrites first plugin's marketplace.json
- Plugin registrations disappear

**Solutions:**
1. Use `install-independent.sh` instead of `install-official.sh`
2. Or manually merge marketplace.json entries:
```json
{
  "plugins": [
    { "name": "plugin-1", ... },
    { "name": "plugin-2", ... }
  ]
}
```

### Issue: Windows Script Window Closes Immediately

**Solutions:**
1. The scripts include `pause` at the end
2. Double-click the .bat file to see output
3. Press any key to close after reading

### Issue: "Permission denied" on Linux/Mac

**Solution:**
```bash
chmod +x install-official.sh install-independent.sh
```

### Issue: Missing .claude-plugin/marketplace.json

**Error Message:**
```
[ERROR] Missing .claude-plugin/marketplace.json
```

**Solution:**
1. Create `.claude-plugin/marketplace.json` in your plugin directory
2. Use `marketplace.json.template` as a starting point
3. See `book2skill-factory-official-spec.md` for structure

---

## 🔧 Advanced Usage

### Environment Variables

**install-official.sh:**
```bash
export PLUGIN_NAME="my-custom-plugin"
export TARGET_DIR="$HOME/.claude/plugins/marketplaces/local-marketplace"
```

**install-independent.sh:**
```bash
export PLUGIN_NAME="my-custom-plugin"
export TARGET_DIR="$HOME/.claude/plugins/marketplaces/${PLUGIN_NAME}-marketplace"
```

**install-official.bat:**
```batch
set PLUGIN_NAME=my-custom-plugin
set TARGET_DIR=%USERPROFILE%\.claude\plugins\marketplaces\local-marketplace
```

**install-independent.bat:**
```batch
set PLUGIN_NAME=my-custom-plugin
set TARGET_DIR=%USERPROFILE%\.claude\plugins\marketplaces\%PLUGIN_NAME%-marketplace
```

### Silent Installation (Linux/Mac)

```bash
./install-official.sh > install.log 2>&1
```

### Verbose Installation (Linux/Mac)

```bash
bash -x install-official.sh
```

---

## 📝 Customization

### For Plugin Packages

To customize for your plugin package:

1. Copy these template scripts to your plugin's `deploy/` directory
2. Customize `PLUGIN_NAME` if needed (auto-detected by default)
3. Add any custom installation steps
4. Test the scripts before distribution
5. Update marketplace.json with your plugin details

### marketplace.json Structure

```json
{
  "$schema": "https://anthropic.com/claude-code/marketplace.schema.json",
  "name": "your-plugin-pro",
  "description": "Complete description of your plugin",
  "owner": {
    "name": "Your Name",
    "email": "your.email@example.com"
  },
  "plugins": [
    {
      "name": "skill-name",
      "description": "What this skill does",
      "version": "1.0.0",
      "author": {
        "name": "Your Name"
      },
      "source": "./skills/skill-name",
      "category": "productivity",
      "homepage": "https://github.com/yourusername/your-repo"
    }
  ]
}
```

---

## 📚 Additional Resources

- **Official Plugin Spec:** `../../book2skill-factory-official-spec.md`
- **Main Skill:** `../SKILL.md`
- **marketplace.json Template:** `marketplace.json.template`
- **Success Stories:** `../references/success-stories/`

---

## 🎊 Best Practices

1. **Test with Independent Marketplace first** - Avoids conflicts
2. **Back up existing plugins** - Before overwriting
3. **Restart Claude Code** - After each installation
4. **Verify installation** - Check directory structure
5. **Test skills** - Try trigger phrases in Claude Code
6. **Use marketplace.json.template** - Ensure correct format

---

## Support

For issues or questions:
1. Check `../../book2skill-factory-official-spec.md`
2. Review the troubleshooting section above
3. Check Claude Code documentation: https://code.claude.com/docs/en/plugin-marketplaces
4. Review the main README.md in the parent directory

---

**Created for:** Book2Skill Factory v2.1
**Last Updated:** 2026-03-26
**Status:** ✅ Official Plugin Format Compliant
