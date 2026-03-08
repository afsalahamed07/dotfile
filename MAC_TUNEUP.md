# Mac Tune-Up Kit

This repo now includes a practical set of scripts and config upgrades for workflow, speed, and reliability.

## What changed

- AeroSpace launches your core apps on login and adds quick-launch binds.
- tmux gets faster interactions, pane navigation with Alt+h/j/k/l, and auto-restore via continuum.
- New scripts automate macOS defaults, performance audits, bootstrap installs, backups, and config checks.

## Keybinds added

### AeroSpace

- `Alt+Enter` -> new Ghostty window
- `Alt+b` -> new Brave Browser window
- `Alt+s` -> new Slack window
- `Alt+m` -> new Music window

### tmux

- `Alt+h/j/k/l` -> move between panes
- `prefix + |` -> split pane horizontally
- `prefix + -` -> split pane vertically
- `prefix + r` -> reload tmux config

## Scripts

- `./scripts/check-configs.sh` validates core configs and basic startup.
- `./scripts/macos-defaults.sh` applies sensible Finder/Dock/input defaults.
- `./scripts/perf-audit.sh` captures quick system and shell performance signals.
- `./scripts/bootstrap.sh` installs core tools/apps on a fresh Mac.
- `./scripts/backup-dotfiles.sh` archives key configs to `~/.config-backups`.

## Recommended order

1. `./scripts/backup-dotfiles.sh`
2. `./scripts/check-configs.sh`
3. `./scripts/macos-defaults.sh`
4. `./scripts/perf-audit.sh`

Then restart tmux (`tmux kill-server`) and reload AeroSpace config.
