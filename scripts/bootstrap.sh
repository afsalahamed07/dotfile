#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Install it first: https://brew.sh"
  exit 1
fi

echo "Installing core CLI tools..."
brew install git neovim tmux yazi btop fzf ripgrep fd stow || true

echo "Installing UI apps..."
brew install --cask ghostty raycast font-maple-mono-nf || true

echo "Ensuring TPM is installed..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

echo "Bootstrap finished."
echo "Next: run ~/.config/scripts/check-configs.sh"
