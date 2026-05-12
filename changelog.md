# Changelog

## v2.2 (2026-05-12)
- 🐛 **FIX**: Removed broken references to non-existent files in SKILL.md (7 dead links)
  - `references/detailed-workflow.md`, `task-unit-template.md`, `package-structures.md`, `deployment-guide.md`, `deployment-troubleshooting.md`, `examples/deployment-scripts/`, `examples/book-evaluations/`
  - All references now point to actual files in the repository
- 🐛 **FIX**: Removed hardcoded local Windows path (`F:\Temp\...`) from SKILL.md
- 🐛 **FIX**: Corrected marketplace.json verification path in install-official.sh and install-independent.sh
  - Was checking `$TARGET_DIR/marketplace.json`, now correctly checks `$TARGET_DIR/.claude-plugin/marketplace.json`
- 🐛 **FIX**: Added missing `print_warning()` function to install-official.sh and install-independent.sh
- 🐛 **FIX**: Corrected marketplace.json `source` path in deploy/README.md example (was `./skills/skill-name`, now `./plugins/[plugin-name]/skills/skill-name`)
- 🐛 **FIX**: Removed references to non-existent `book2skill-factory-official-spec.md` in deploy/README.md
- 📝 **IMPROVED**: Significantly expanded `references/fit-assessment.md` with detailed book suitability criteria
  - Added Quick Assessment Checklist (5-question scoring)
  - Added supported input formats (PDF, EPUB, Markdown, web links)
  - Added examples for High/Medium/Low fit categories
- 📝 Updated SKILL.md book suitability section with pointer to detailed guide

## v2.1 (2026-03-26)
- 🐛 **CRITICAL FIX**: Corrected marketplace.json path configuration
  - Changed: `"source": "./skills/xxx"` → `"source": "./plugins/[plugin-name]/skills/xxx"`
  - Fixes: Plugin directory not found errors
  - Impact: All generated plugins now deploy correctly
- ✅ Updated deployment scripts (install-official/install-independent)
- ✅ Verified with minimalist-entrepreneur-pro (7 skills, all loading successfully)
- 📝 Updated documentation with correct marketplace structure

## v2.0 (2026-03-25)
- 🎉 Added Official Marketplace Support
- 📦 New: `.claude-plugin/marketplace.json` for official plugin registration
- 🔄 New: Independent Marketplace deployment option (isolated marketplaces)
- 📚 Updated: Complete workflow for official plugin format
- ✅ Tested: Blue Ocean Strategy → official plugin package

## v1.0 (2026-03-20)
- Initial Book2Skill Factory MVP
- Default rule: plugin is the delivery unit, skills are internal units
- Added Blue Ocean Strategy as first test target
