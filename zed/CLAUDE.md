# Zed config — conventions

This repo holds my personal [Zed](https://zed.dev) configuration (`settings.json`,
`keymap.json`, etc.).

## How config is organized

Zed has **no include/import mechanism** — all user settings live in a single
`settings.json` and all keybindings in a single `keymap.json`. The only real "splitting"
options are layered config (global `~/.config/zed/settings.json` vs. per-project
`<project>/.zed/settings.json`, project wins) and per-language settings under the
`languages` key. There's no way to split a global file into multiple topical files.

Since topical files aren't possible, both files are organized **by topic using banner
comment headers**:

```jsonc
// ============================================================
//  SECTION NAME
// ============================================================
```

When adding a new setting or binding, place it under the matching section rather than
appending to the end. Create a new banner section if none fits.

### `settings.json` sections
`APPEARANCE` · `FONTS` · `EDITOR BEHAVIOR` · `PANELS / DOCKS` · `LANGUAGES` · `REMOTE / SSH`

### `keymap.json`
Keep each context block as a **separate object** in the top-level array — Zed requires
this; bindings can't be merged across contexts. One banner header per context object.
Current context blocks: Normal+Visual, Normal-only, Visual-only, Project panel,
Insert, Completion menu, Edit prediction, Global menus, Editor context menu.
Within the large Normal+Visual block, bindings are sub-grouped with inline comments
(`// LSP / code actions`, `// diagnostics`, `// navigation / pickers`, `// motions`,
`// window / panes / terminal`, `// comments`, `// git`).

## Keybindings — ported from Neovim (LazyVim)

The bindings mirror my Neovim/LazyVim setup (`~/.config/nvim`). Key facts when porting:

- **Most LazyVim defaults are already Zed vim defaults — don't re-add them.** Already
  built in: `g d`/`g D`/`g r`/`g i`/`g y`, `] d`/`[ d` (diagnostics), `shift-k`/`g h`
  (hover), `g c` (comments), the whole `ctrl-w` split/nav family, `space /` (project
  grep), `space f` (file finder). Verify against Zed's bundled `vim.json` /
  `default-macos.json` before adding anything.
- **Genuinely-missing LazyVim bindings I added** (leader = `space`): `space e` focus file
  tree (`project_panel::ToggleFocus`), `space E` toggle left dock, `space f f`/`f r`/`f n`
  finder/recent/new-file, `space -`/`space |` split down/right, `space b d` close buffer,
  `space g g` git panel, `space x x` diagnostics, `space c a` code action.
- **No Zed equivalent (left in nvim only):** harpoon (`<leader>a`, `<leader>1-8`, `<C-e>`)
  and `:source` line/file (`<C-x>`, `<space>x`).
- **`space …` leader bindings only fire in the focused context.** They're scoped to
  `Editor`, so they're dead inside panels. The `ProjectPanel` block re-adds a few
  (`space e`, `space space`) so you can escape the tree.

## Keymap precedence gotcha (important)

When two bindings match the same key, Zed picks the **most specific context**; ties at the
same level are broken by **file order — later wins**. A binding with **no `context`**
matches everywhere and, if placed later in the file, will **silently shadow** earlier
context-scoped bindings. This bit the `ctrl-y` accept binding: a global
`ctrl-y → editor::SelectLine` was overriding it. Fixes applied:
- Removed the competing global `ctrl-y`.
- `ctrl-y` accepts completions via two **mutually-exclusive** context blocks:
  `Editor && showing_completions` → `editor::ConfirmCompletion`, and
  `Editor && edit_prediction && !showing_completions` → `editor::AcceptEditPrediction`
  (the `!showing_completions` guard stops the AI-ghost-text binding from stealing the key
  while the LSP menu is open).

When adding bindings, prefer scoping to a context and watch for un-scoped globals defined
later in the file.

## Notes
- Vim mode is on; leader key is `space`.
- Verify Zed action/context names against the bundled default keymaps (Zed repo
  `assets/keymaps/vim.json` and `default-macos.json`) — invalid names fail silently.
- Reload keymap with `cmd-k cmd-r`; theme/transparency changes need a full `⌘Q` restart.
- Zed itself sometimes writes settings into `settings.json` (e.g. panel `dock` values) —
  fold any such additions into the appropriate banner section rather than leaving them loose.
