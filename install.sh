#!/usr/bin/env bash
#
# Quick installer for dotfiles
#
# Usage:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/downzer0/dotfiles/main/install.sh)"
#

set -e

# Color codes
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/downzer0/dotfiles.git"

echo ""
echo "============================================================"
echo -e "${BLUE}🚀 Dotfiles Installer${NC}"
echo "============================================================"
echo ""

# Check if dotfiles already exist
if [ -d "$DOTFILES_DIR" ]; then
	echo -e "${YELLOW}⚠️  Dotfiles directory already exists at $DOTFILES_DIR${NC}"
	echo ""
	read -p "Do you want to update the existing installation? (y/n) " -n 1 -r
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		echo ""
		echo "📥 Updating existing dotfiles..."
		cd "$DOTFILES_DIR"
		git pull origin main
		echo -e "  ${GREEN}✓ Dotfiles updated${NC}"
		echo ""
		echo "🔄 Running dot update..."
		"$DOTFILES_DIR/bin/dot" update
		exit 0
	else
		echo ""
		echo "Installation cancelled."
		exit 0
	fi
fi

# Check for git
echo "🔍 Checking for Git..."
if ! command -v git &> /dev/null; then
	echo -e "  ${RED}✗ Git is not installed${NC}"
	echo ""
	echo "Git is required to clone the dotfiles repository."
	echo ""
	echo "On macOS, you can install Git by:"
	echo "  1. Running 'xcode-select --install' to install Command Line Tools"
	echo "  2. Or installing Homebrew first: https://brew.sh"
	echo ""
	exit 1
fi

# Get current Git version
CURRENT_GIT_VERSION=$(git --version | awk '{print $3}')
echo -e "  ${GREEN}✓ Git found${NC} (version $CURRENT_GIT_VERSION)"

# Check for Homebrew (needed to update Git)
if command -v brew &> /dev/null; then
	echo ""
	echo "🔄 Checking for Git updates..."

	# Update Homebrew first to get latest package info
	brew update &> /dev/null || true

	# Check if git is installed via Homebrew and if there's an update
	if brew list git &> /dev/null; then
		OUTDATED_GIT=$(brew outdated git)
		if [ -n "$OUTDATED_GIT" ]; then
			echo "  Updating Git via Homebrew..."
			brew upgrade git
			NEW_GIT_VERSION=$(git --version | awk '{print $3}')
			echo -e "  ${GREEN}✓ Git updated${NC} ($CURRENT_GIT_VERSION → $NEW_GIT_VERSION)"
		else
			echo -e "  ${GREEN}✓ Git is already up to date${NC}"
		fi
	else
		echo "  Git not installed via Homebrew, skipping update"
		echo "  (Using system Git from Xcode Command Line Tools)"
	fi
fi

# Clone the repository
echo ""
echo "📥 Cloning dotfiles repository..."
git clone "$REPO_URL" "$DOTFILES_DIR"
echo -e "  ${GREEN}✓ Repository cloned to $DOTFILES_DIR${NC}"

# Run bootstrap
echo ""
echo "🎯 Starting bootstrap process..."
echo ""
cd "$DOTFILES_DIR"
"$DOTFILES_DIR/bin/dot" bootstrap

echo ""
echo -e "${GREEN}✨ Installation complete!${NC}"
echo ""
echo "Your dotfiles have been installed. Restart your terminal or run:"
echo "  source ~/.zshrc"
echo ""
