#!/usr/bin/env bash
set -euo pipefail

NODE_VERSION="20"

echo "=== Bootstrapping local Volta + Node.js + VSCE ==="

# Local Volta
if [ ! -d "$PWD/.volta" ]; then
  echo "Installing Volta..."
  mkdir -p "$PWD/.volta"
  curl -sSf https://get.volta.sh | VOLTA_HOME="$PWD/.volta" bash -s -- --skip-setup
fi
export VOLTA_HOME="$PWD/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Local Node
echo "Installing Node.js via Volta..."
volta install node@$NODE_VERSION

# Local prefix for npm
export npm_config_prefix="$PWD/.local"
mkdir -p "$npm_config_prefix/lib" "$npm_config_prefix/bin"
export PATH="$npm_config_prefix/bin:$PATH"

# Install vsce locally
echo "Installing local vsce..."
npm install @vscode/vsce@latest

# Package extension
echo "Packaging VS Code extension..."
npx @vscode/vsce package \
    --out dist/ \
    --allow-missing-repository \
    --skip-license

echo "✅ Done! VSIX files:"
ls -1 dist/*.vsix 2>/dev/null || echo "No .vsix produced."
