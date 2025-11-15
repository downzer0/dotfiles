#!/bin/bash

# Installation of FNM happens in BREW
# This script installs the latest LTS version of Node.js and creates symlinks
# These symlinks allow Claude MCP commands to use the Node.js version managed by FNM

echo "📦 Setting up FNM and Node.js..."

# Remove Homebrew's node if it was installed as a dependency
if brew list node &>/dev/null; then
  echo " Removing Homebrew's node (we use FNM instead)..."
  brew uninstall --ignore-dependencies node 2>/dev/null || true
fi

# Install latest LTS version of Node.js using FNM
echo "  Installing latest Node.js LTS version..."
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --shell bash)"

# Install latest LTS and set as default
fnm install --lts
fnm default lts-latest

echo " Installed Node.js $(fnm current)"

# Create or update symlinks to the default FNM Node version
echo " Creating symlinks for global Node.js access..."

# Refresh sudo credentials (should be instant if session is still valid)
sudo -v

sudo mkdir -p /usr/local/bin
sudo ln -sf "$HOME/.local/share/fnm/aliases/default/bin/node" /usr/local/bin/node
sudo ln -sf "$HOME/.local/share/fnm/aliases/default/bin/npm" /usr/local/bin/npm
sudo ln -sf "$HOME/.local/share/fnm/aliases/default/bin/npx" /usr/local/bin/npx
sudo ln -sf "$HOME/.local/share/fnm/aliases/default/bin/corepack" /usr/local/bin/corepack

echo ""
echo "✓ FNM setup complete!"
echo "  node: $(node --version)"
echo "  npm: $(npm --version)"
echo "  npx: $(npx --version)"
echo "  corepack: $(corepack --version)"
