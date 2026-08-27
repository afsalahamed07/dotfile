# macOS Workflow Config

This repository keeps a small, reproducible macOS workflow inspired by Omarchy's keyboard-first approach. AeroSpace manages windows, Ghostty is the primary terminal, Kitty is the fallback terminal, tmux provides terminal workspaces, and Starship owns the prompt.

## Global shortcuts

### AeroSpace

- `Cmd+Enter` opens Ghostty.
- `Cmd+Shift+Enter` opens Kitty.
- `Cmd+Alt+Enter` opens Ghostty and attaches to, or creates, the `Work` tmux session.
- `Alt+h/j/k/l` changes window focus.
- `Alt+Shift+h/j/k/l` moves the focused window.
- `Alt+1..0` and `Alt+a` select workspaces.
- `Alt+Shift+1..0` and `Alt+Shift+a` move the focused window to a workspace.
- `Alt+p/n` selects the previous or next workspace.
- `Alt+b` opens Firefox; `Alt+s` opens Slack.

### tmux

- `Ctrl+Space` is the tmux prefix.
- `Alt+Enter` splits vertically; `Alt+Shift+Enter` splits horizontally.
- `Alt+Escape` closes the active pane.
- `Ctrl+Alt+Arrow` changes pane focus.
- `Ctrl+Alt+Shift+Arrow` resizes the active pane.
- `Alt+1..9` selects a tmux window.
- `Alt+Left/Right` changes windows; `Alt+Up/Down` changes sessions.

## Themes

Run `./scripts/switch-theme list` to list themes and `./scripts/switch-theme <name>` to apply one. Hubbamax and Rosé Pine are the maintained themes. The switcher keeps Ghostty, Kitty, tmux, Zed, btop, OpenCode, and gitui aligned.

## Maintenance

1. Preview a selective backup with `./scripts/backup-dotfiles.sh --dry-run`.
2. Create the backup with `./scripts/backup-dotfiles.sh`.
3. Validate the managed configs with `./scripts/check-configs.sh`.
4. Apply macOS defaults only when desired with `./scripts/macos-defaults.sh`.
5. Inspect startup and system performance with `./scripts/perf-audit.sh`.

Backups are written to `~/.config-backups` with a manifest and SHA-256 checksum. Credentials, caches, logs, and unrelated application state are not included.
