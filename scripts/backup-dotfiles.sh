#!/usr/bin/env bash
set -euo pipefail

stamp="$(date +%Y%m%d-%H%M%S)"
dest="$HOME/.config-backups"
archive="$dest/dotconfig-$stamp.tar.gz"

mkdir -p "$dest"

tar -czf "$archive" \
  -C "$HOME" \
  .config/aerospace \
  .config/ghostty \
  .config/tmux \
  .config/nvim \
  .config/yazi \
  .config/envman

echo "Backup created: $archive"
