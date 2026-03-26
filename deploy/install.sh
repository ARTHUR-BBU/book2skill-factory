#!/bin/bash
################################################################################
# Book2Skill Factory - Auto-Deployment Script
################################################################################
# This script automates the deployment of a Claude Code plugin package.
#
# Usage:
#   chmod +x install.sh
#   ./install.sh
#
# Supported platforms: Linux, macOS
################################################################################

set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

################################################################################
# Configuration (Auto-detected, but can be overridden)
################################################################################

# Plugin name (auto-detected from directory name)
PLUGIN_NAME="${PLUGIN_NAME:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && basename "$PWD")}"

# Target directory (Claude Code skills location)
TARGET_DIR="${TARGET_DIR:-$HOME/.claude/skills/$PLUGIN_NAME}"

# Source directory (where this script is located)
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

################################################################################
# Functions
################################################################################

print_header() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  $1${NC}"
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

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

################################################################################
# Pre-flight checks
################################################################################

print_header "Book2Skill Factory - Deployment Script"

print_step "Plugin: $PLUGIN_NAME"
print_step "Target: $TARGET_DIR"
echo ""

# Check if running from correct directory
if [ ! -d "$SOURCE_DIR/skills" ] && [ ! -d "$SOURCE_DIR/references" ]; then
    print_error "Invalid plugin directory"
    print_error "Expected to find skills/ or references/ in parent directory"
    print_error "Current source: $SOURCE_DIR"
    exit 1
fi

# Check if target directory already exists
if [ -d "$TARGET_DIR" ]; then
    print_warning "Plugin already installed at $TARGET_DIR"
    read -p "Do you want to overwrite? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_warning "Installation cancelled"
        exit 0
    fi
    print_step "Removing existing installation..."
    rm -rf "$TARGET_DIR"
fi

################################################################################
# Installation
################################################################################

print_step "Creating target directory..."
mkdir -p "$TARGET_DIR"
print_success "Directory created: $TARGET_DIR"

# Copy skills (if exists)
if [ -d "$SOURCE_DIR/skills" ]; then
    print_step "Copying skills..."
    cp -r "$SOURCE_DIR/skills/"* "$TARGET_DIR/" 2>/dev/null || true
    SKILL_COUNT=$(find "$TARGET_DIR" -name "SKILL.md" -o -name "skill.md" | wc -l)
    print_success "Copied $SKILL_COUNT skill(s)"
fi

# Copy main SKILL.md (if exists at root)
if [ -f "$SOURCE_DIR/SKILL.md" ]; then
    print_step "Copying main SKILL.md..."
    cp "$SOURCE_DIR/SKILL.md" "$TARGET_DIR/"
    print_success "Main SKILL.md copied"
fi

# Copy references (if exists)
if [ -d "$SOURCE_DIR/references" ]; then
    print_step "Copying references..."
    cp -r "$SOURCE_DIR/references" "$TARGET_DIR/"
    REF_COUNT=$(find "$TARGET_DIR/references" -name "*.md" | wc -l)
    print_success "Copied $REF_COUNT reference file(s)"
fi

# Copy assets (if exists)
if [ -d "$SOURCE_DIR/assets" ]; then
    print_step "Copying assets..."
    cp -r "$SOURCE_DIR/assets" "$TARGET_DIR/"
    print_success "Assets copied"
fi

# Copy templates (if exists)
if [ -d "$SOURCE_DIR/templates" ]; then
    print_step "Copying templates..."
    cp -r "$SOURCE_DIR/templates" "$TARGET_DIR/"
    print_success "Templates copied"
fi

# Copy README (if exists)
if [ -f "$SOURCE_DIR/README.md" ]; then
    print_step "Copying README.md..."
    cp "$SOURCE_DIR/README.md" "$TARGET_DIR/"
    print_success "README.md copied"
fi

################################################################################
# Verification
################################################################################

print_step "Verifying installation..."

if [ ! -d "$TARGET_DIR" ]; then
    print_error "Installation failed: Target directory not created"
    exit 1
fi

# Count installed files
SKILL_FILES=$(find "$TARGET_DIR" -name "SKILL.md" -o -name "skill.md" 2>/dev/null | wc -l)
REFERENCE_FILES=$(find "$TARGET_DIR/references" -name "*.md" 2>/dev/null | wc -l)

if [ "$SKILL_FILES" -eq 0 ] && [ "$REFERENCE_FILES" -eq 0 ]; then
    print_error "Installation failed: No skills or references found"
    exit 1
fi

print_success "Installation verified successfully"
echo ""

################################################################################
# Summary
################################################################################

print_header "Installation Complete"

echo -e "${GREEN}Plugin:${NC}         $PLUGIN_NAME"
echo -e "${GREEN}Location:${NC}       $TARGET_DIR"
echo -e "${GREEN}Skills:${NC}         $SKILL_FILES"
echo -e "${GREEN}References:${NC}     $REFERENCE_FILES"
echo ""

# List installed skills
if [ "$SKILL_FILES" -gt 0 ]; then
    echo -e "${BLUE}Installed Skills:${NC}"
    find "$TARGET_DIR" -name "SKILL.md" -o -name "skill.md" 2>/dev/null | while read -r skill; do
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
echo -e "  1. ${BLUE}Restart Claude Code${NC} to load the new skills"
echo ""
echo -e "  2. ${BLUE}Verify installation:${NC}"
echo -e "     ${GREEN}cd $(dirname "$0") && ./verify.sh${NC}"
echo ""
echo -e "  3. ${BLUE}Test the skills:${NC}"
echo -e "     In Claude Code, try: \"Use [skill-name] to [problem]\""
echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
