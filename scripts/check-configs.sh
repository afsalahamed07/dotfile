#!/usr/bin/env bash
set -euo pipefail

ok() {
  printf "[ok] %s\n" "$1"
}

warn() {
  printf "[warn] %s\n" "$1"
}

test -f "$HOME/.config/aerospace/aerospace.toml" && ok "AeroSpace config found" || warn "Missing AeroSpace config"
test -f "$HOME/.config/ghostty/config" && ok "Ghostty config found" || warn "Missing Ghostty config"
test -f "$HOME/.config/tmux/tmux.conf" && ok "tmux config found" || warn "Missing tmux config"
test -f "$HOME/.config/nvim/init.lua" && ok "Neovim config found" || warn "Missing Neovim config"
test -f "$HOME/.config/yazi/yazi.toml" && ok "Yazi config found" || warn "Missing Yazi config"

if command -v tmux >/dev/null 2>&1; then
  tmux -f "$HOME/.config/tmux/tmux.conf" start-server >/dev/null 2>&1 && ok "tmux config parses"
else
  warn "tmux not installed"
fi

if command -v nvim >/dev/null 2>&1; then
  nvim --headless "+qa" >/dev/null 2>&1 && ok "nvim starts headless"
else
  warn "nvim not installed"
fi

echo "Validation complete."
