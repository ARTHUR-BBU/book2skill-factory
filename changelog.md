# Changelog

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
