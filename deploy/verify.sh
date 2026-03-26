#!/bin/bash
################################################################################
# Book2Skill Factory - Verification Script
################################################################################
# This script verifies that a plugin package is correctly installed.
#
# Usage:
#   chmod +x verify.sh
#   ./verify.sh
#
# Supported platforms: Linux, macOS
################################################################################

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

################################################################################
# Configuration
################################################################################

# Plugin name (auto-detected)
PLUGIN_NAME="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && basename "$PWD")"

# Target directory
TARGET_DIR="$HOME/.claude/skills/$PLUGIN_NAME"

################################################################################
# Functions
################################################################################

print_header() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

################################################################################
# Verification
################################################################################

print_header "Book2Skill Factory - Installation Verification"

echo -e "${BLUE}Plugin:${NC}     $PLUGIN_NAME"
echo -e "${BLUE}Location:${NC}   $TARGET_DIR"
echo ""

# Check if target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    print_error "Plugin not installed"
    print_info "Target directory not found: $TARGET_DIR"
    print_info "Please run install.sh first"
    exit 1
fi

print_success "Installation directory exists"

# Check for skills
SKILL_COUNT=$(find "$TARGET_DIR" -maxdepth 2 -name "SKILL.md" -o -name "skill.md" 2>/dev/null | wc -l)

if [ "$SKILL_COUNT" -eq 0 ]; then
    print_warning "No skills found (expected at least one)"
else
    print_success "Found $SKILL_COUNT skill file(s)"

    echo ""
    echo -e "${BLUE}Installed Skills:${NC}"
    find "$TARGET_DIR" -maxdepth 2 -name "SKILL.md" -o -name "skill.md" 2>/dev/null | while read -r skill; do
        REL_PATH="${skill#$TARGET_DIR/}"
        SKILL_NAME=$(basename "$(dirname "$skill")")
        if [ "$SKILL_NAME" = "." ]; then
            SKILL_NAME="[main]"
        fi
        echo -e "  ${GREEN}✓${NC} $SKILL_NAME ($REL_PATH)"
    done
fi

# Check for references
if [ -d "$TARGET_DIR/references" ]; then
    REF_COUNT=$(find "$TARGET_DIR/references" -name "*.md" 2>/dev/null | wc -l)
    print_success "Found $REF_COUNT reference file(s)"
else
    print_warning "No references directory found"
fi

# Check for assets
if [ -d "$TARGET_DIR/assets" ]; then
    print_success "Assets directory exists"
fi

# Check for templates
if [ -d "$TARGET_DIR/templates" ]; then
    print_success "Templates directory exists"
fi

# Check for README
if [ -f "$TARGET_DIR/README.md" ]; then
    print_success "README.md exists"
fi

################################################################################
# YAML Validation
################################################################################

echo ""
echo -e "${BLUE}Validating YAML frontmatter...${NC}"

YAML_ERRORS=0

find "$TARGET_DIR" -name "SKILL.md" -o -name "skill.md" 2>/dev/null | while read -r skill_file; do
    # Check if file has valid YAML frontmatter
    if grep -q "^---$" "$skill_file"; then
        # Extract frontmatter (between first two --- lines)
        FRONTMATTER=$(sed -n '/^---$/,/^---$/{ /}/p; /^---$/q; }' "$skill_file")

        # Check for invalid fields
        if echo "$FRONTMATTER" | grep -E "^(version|author|user-invocable|last_updated|status):" > /dev/null; then
            print_warning "Invalid fields in $(basename "$skill_file")"
            print_info "Only 'name' and 'description' fields are allowed"
            YAML_ERRORS=1
        else
            print_success "$(basename "$skill_file") - Valid YAML"
        fi
    else
        print_warning "$(basename "$skill_file") - No YAML frontmatter found"
    fi
done

if [ $YAML_ERRORS -eq 0 ]; then
    print_success "All YAML frontmatter is valid"
fi

################################################################################
# Structure Check
################################################################################

echo ""
echo -e "${BLUE}Checking directory structure...${NC}"

# Check for common issues
ISSUES=0

# Issue 1: Nested skills directory
if [ -d "$TARGET_DIR/skills/skills" ]; then
    print_error "Found nested skills/ directory"
    print_info "This should not happen"
    ISSUES=1
fi

# Issue 2: Empty directories
if [ -d "$TARGET_DIR/skills" ] && [ -z "$(ls -A "$TARGET_DIR/skills" 2>/dev/null)" ]; then
    print_warning "Empty skills/ directory"
    ISSUES=1
fi

if [ $ISSUES -eq 0 ]; then
    print_success "Directory structure is correct"
fi

################################################################################
# Summary
################################################################################

echo ""
print_header "Verification Summary"

if [ -d "$TARGET_DIR" ] && [ "$SKILL_COUNT" -gt 0 ]; then
    echo -e "${GREEN}Status:${NC}        Installation verified ✅"
    echo -e "${GREEN}Plugin:${NC}        $PLUGIN_NAME"
    echo -e "${GREEN}Location:${NC}      $TARGET_DIR"
    echo -e "${GREEN}Skills:${NC}        $SKILL_COUNT"
    echo ""
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}Next Steps:${NC}"
    echo ""
    echo -e "  1. ${GREEN}Restart Claude Code${NC}"
    echo ""
    echo -e "  2. ${GREEN}Test a skill:${NC}"
    echo -e "     Try: \"Use [skill-name] to [problem]\""
    echo ""
    echo -e "  3. ${GREEN}If skills don't load:${NC}"
    echo -e "     - Check Claude Code settings"
    echo -e "     - Verify ~/.claude/skills/ path"
    echo -e "     - Check for YAML errors in skill files"
    echo ""
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    exit 0
else
    echo -e "${RED}Status:${NC}        Installation failed ❌"
    echo ""
    echo -e "${RED}Issues found:${NC}"
    [ ! -d "$TARGET_DIR" ] && echo "  - Target directory missing"
    [ "$SKILL_COUNT" -eq 0 ] && echo "  - No skill files found"
    echo ""
    echo -e "${YELLOW}Troubleshooting:${NC}"
    echo ""
    echo -e "  1. ${YELLOW}Re-run install:${NC}"
    echo -e "     ${GREEN}cd $(dirname "$0") && ./install.sh${NC}"
    echo ""
    echo -e "  2. ${YELLOW}Check permissions:${NC}"
    echo -e "     ${GREEN}chmod +x install.sh${NC}"
    echo ""
    echo -e "  3. ${YELLOW}View installation logs:${NC}"
    echo -e "     ${GREEN}cat install.log${NC} (if available)"
    echo ""
    exit 1
fi
