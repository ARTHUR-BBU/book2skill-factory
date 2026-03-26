#!/bin/bash
################################################################################
# Book2Skill Factory - Plugin Deployment Script (Official Format)
################################################################################
# Deploys a Claude Code plugin package with marketplace.json structure
#
# Usage:
#   chmod +x install.sh
#   ./install.sh
################################################################################

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

################################################################################
# Configuration
################################################################################

# Plugin name (auto-detected)
PLUGIN_NAME="${PLUGIN_NAME:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && basename "$PWD")}"

# Target directory (local marketplace)
TARGET_DIR="${TARGET_DIR:-$HOME/.claude/plugins/marketplaces/local-marketplace}"

# Source directory
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

################################################################################
# Functions
################################################################################

print_header() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  Claude Code Plugin Deployment (Official Format)${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

print_step() {
    echo -e "${BLUE}▶ $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

################################################################################
# Pre-flight checks
################################################################################

print_header

print_step "Plugin: $PLUGIN_NAME"
print_step "Target: $TARGET_DIR"
echo ""

# Check if marketplace.json exists
if [ ! -f "$SOURCE_DIR/.claude-plugin/marketplace.json" ]; then
    print_error "Missing .claude-plugin/marketplace.json"
    print_error "This is required for official plugin format"
    echo ""
    print_error "Expected location: $SOURCE_DIR/.claude-plugin/marketplace.json"
    echo ""
    print_error "Please create this file first. See:"
    print_error "  https://code.claude.com/docs/en/plugin-marketplaces"
    exit 1
fi

print_success "Found .claude-plugin/marketplace.json"

################################################################################
# Create marketplace structure
################################################################################

print_step "Creating local marketplace structure..."

# Create target directory
mkdir -p "$TARGET_DIR"

# Copy marketplace.json to correct location
print_step "Copying marketplace configuration..."
mkdir -p "$TARGET_DIR/.claude-plugin"
cp "$SOURCE_DIR/.claude-plugin/marketplace.json" "$TARGET_DIR/.claude-plugin/marketplace.json"
print_success "marketplace.json installed"

# Create plugin directory
PLUGIN_DIR="$TARGET_DIR/plugins/$PLUGIN_NAME"
mkdir -p "$PLUGIN_DIR"

print_success "Plugin directory created: $PLUGIN_DIR"

################################################################################
# Copy plugin files
################################################################################

# Copy skills (if exists)
if [ -d "$SOURCE_DIR/skills" ]; then
    print_step "Copying skills..."
    cp -r "$SOURCE_DIR/skills/"* "$PLUGIN_DIR/" 2>/dev/null || true
    SKILL_COUNT=$(find "$PLUGIN_DIR" -name "SKILL.md" -o -name "skill.md" | wc -l)
    print_success "Copied $SKILL_COUNT skill(s)"
fi

# Copy references (if exists)
if [ -d "$SOURCE_DIR/references" ]; then
    print_step "Copying references..."
    cp -r "$SOURCE_DIR/references" "$PLUGIN_DIR/"
    REF_COUNT=$(find "$PLUGIN_DIR/references" -name "*.md" 2>/dev/null | wc -l)
    print_success "Copied $REF_COUNT reference file(s)"
fi

# Copy assets (if exists)
if [ -d "$SOURCE_DIR/assets" ]; then
    print_step "Copying assets..."
    cp -r "$SOURCE_DIR/assets" "$PLUGIN_DIR/"
    print_success "Assets copied"
fi

# Copy templates (if exists)
if [ -d "$SOURCE_DIR/templates" ]; then
    print_step "Copying templates..."
    cp -r "$SOURCE_DIR/templates" "$PLUGIN_DIR/"
    print_success "Templates copied"
fi

# Copy README (if exists)
if [ -f "$SOURCE_DIR/README.md" ]; then
    print_step "Copying README.md..."
    cp "$SOURCE_DIR/README.md" "$PLUGIN_DIR/"
    print_success "README.md copied"
fi

################################################################################
# Verification
################################################################################

echo ""
print_step "Verifying installation..."

# Check marketplace.json
if [ ! -f "$TARGET_DIR/marketplace.json" ]; then
    print_error "marketplace.json not found"
    exit 1
fi
print_success "marketplace.json verified"

# Check plugin directory
if [ ! -d "$PLUGIN_DIR" ]; then
    print_error "Plugin directory not created"
    exit 1
fi
print_success "Plugin directory verified"

# Count skills
SKILL_COUNT=$(find "$PLUGIN_DIR" -name "SKILL.md" -o -name "skill.md" 2>/dev/null | wc -l)
if [ "$SKILL_COUNT" -eq 0 ]; then
    print_warning "No skills found in plugin"
else
    print_success "Found $SKILL_COUNT skill(s)"
fi

################################################################################
# Summary
################################################################################

echo ""
print_header "Installation Complete"

echo -e "${GREEN}Plugin:${NC}         $PLUGIN_NAME"
echo -e "${GREEN}Marketplace:${NC}    local-marketplace"
echo -e "${GREEN}Location:${NC}       $TARGET_DIR"
echo -e "${GREEN}Skills:${NC}         $SKILL_COUNT"
echo ""

# List installed skills
if [ "$SKILL_COUNT" -gt 0 ]; then
    echo -e "${BLUE}Installed Skills:${NC}"
    find "$PLUGIN_DIR" -name "SKILL.md" -o -name "skill.md" 2>/dev/null | while read -r skill; do
        SKILL_NAME=$(basename "$(dirname "$skill")")
        if [ "$SKILL_NAME" = "." ]; then
            SKILL_NAME="(main)"
        fi
        echo -e "  ${GREEN}✓${NC} $SKILL_NAME"
    done
    echo ""
fi

################################################################################
# Next Steps
################################################################################

echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Next Steps:${NC}"
echo ""
echo -e "  1. ${BLUE}Restart Claude Code${NC} to load the new marketplace"
echo ""
echo -e "  2. ${BLUE}Verify installation:${NC}"
echo -e "     ${GREEN}ls -la $TARGET_DIR${NC}"
echo ""
echo -e "  3. ${BLUE}Test the skills:${NC}"
echo -e "     In Claude Code, try: \"Use [skill-name] to [problem]\""
echo ""
echo -e "${YELLOW}Note:${NC} Your plugin is now registered in the local marketplace."
echo -e "${YELLOW}      Claude Code will discover it automatically.${NC}"
echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
