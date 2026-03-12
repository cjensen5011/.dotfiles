# .dotfiles Context Summary

This file provides a concise, high-signal overview of the repository so an AI assistant (or a human) can quickly gain working context without re-reading the entire tree. Update it whenever you add major tools, workflows, or conventions.

## Purpose
Personal development environment configuration for macOS: shell (zsh + oh-my-zsh), terminal emulators (Alacritty, Ghostty, WezTerm), tmux workflows, Neovim (custom minimal lazy.nvim-based), prompt (Starship), and assorted helper scripts to rapidly spin up project/session contexts.

## High-Level Stack
- OS Target: macOS
- Shell: zsh (oh-my-zsh, plugins: git + external: autosuggestions, syntax-highlighting, fzf, thefuck, zoxide)
- Prompt: starship (Catppuccin Mocha theme, powerline style separators)
- Terminal Emulators: Alacritty, Ghostty, WezTerm (all themed Catppuccin, JetBrainsMono Nerd Font)
- Multiplexer: tmux (Catppuccin theme + TPM plugins)
- Editor: Neovim (custom minimal config using lazy.nvim only; previously LazyVim)
- Fonts: JetBrainsMono Nerd Font (Mono variants); Nerd symbols leveraged by starship and lualine
- Primary Theme: Catppuccin Mocha across tools (visual consistency)

## Directory Map
```
/README.md              Minimal placeholder
/CONTEXT.md             (This file)
/alacritty/.config/alacritty/  Alacritty base + Catppuccin palette
/ghostty/.config/ghostty/      Ghostty config (font, theme, padding)
/nvim/.config/nvim/            Neovim config (murdr namespace; Primeagen-inspired)
  init.lua                     Entry point → require('murdr')
  lazy-lock.json               Pinned plugin commit hashes
  stylua.toml                  Lua formatting rules
  lua/murdr/                   Namespace root (init.lua, set.lua, remap.lua, lazy_init.lua)
  lua/murdr/lazy/              Atomic plugin specs (colors, conform, copilot, dap, fugitive, gitsigns, golf, harpoon, init, lsp, lualine, neotest, peek, snippets, telescope, treesitter, trouble, undotree, which-key)
/scripts/                      Helper and workflow scripts (tmux automation)
/starship/.config/starship/    Starship prompt config (symlinked to ~/.config/starship.toml)
/tmux/.tmux.conf               Core tmux config + plugin list + key bindings
/tmux/.tmux-cht-*              Lists used by cht.sh helper script
/tmux/plugins/tpm/             Placeholder for TPM (populated after plugin install)
/wezterm/.wezterm.lua          WezTerm Lua config (mirrors theme + sizing)
/zsh/.zshrc                    Shell config, env vars, aliases, tool bootstrap
```

## Neovim (murdr Namespace, Primeagen-Inspired)
Architecture:
  Entry `init.lua` → `require('murdr')` which loads `set`, `remap`, `lazy_init`.
  Plugin system: lazy.nvim with granular spec files under `lua/murdr/lazy/`:
    - colors.lua        (theme: Catppuccin Mocha, transparent background)
    - conform.lua       (formatting orchestration, on-save fallback to LSP)
    - copilot.lua       (Copilot + copilot-cmp + CopilotChat with claude-3.7-sonnet)
    - dap.lua           (nvim-dap + dap-ui + mason-nvim-dap setup & keymaps)
    - fugitive.lua      (git: vim-fugitive)
    - gitsigns.lua      (git: gitsigns.nvim with hunk nav, staging, blame)
    - golf.lua          (practice / editing drills)
    - harpoon.lua       (file mark/jump, harpoon2 branch)
    - init.lua          (empty aggregator; lazy.nvim auto-imports siblings)
    - lsp.lua           (mason, mason-lspconfig, lspconfig, nvim-cmp, copilot-cmp, fidget)
    - lualine.lua       (statusline with custom Catppuccin bubbles theme)
    - neotest.lua       (test runner with neotest-golang adapter)
    - peek.lua          (markdown preview via Deno)
    - snippets.lua      (LuaSnip + friendly-snippets)
    - telescope.lua     (fuzzy finding, pinned to 0.1.5)
    - treesitter.lua    (parsers, highlighting, context module)
    - trouble.lua       (diagnostic/location list UI, Trouble v3)
    - undotree.lua      (persistent undo tree toggler)
    - which-key.lua     (keybinding discovery popup, modern preset, mini.icons)

Key intentional deviations vs the upstream inspiration:
  1. Custom Catppuccin + bubble lualine theme retained.
  2. Tab width standardized at 2.
  3. Copilot + copilot-cmp + CopilotChat (claude-3.7-sonnet) kept.
  4. Which-key added (modern preset, mini.icons).
  5. Gitsigns added for hunk navigation, staging, and blame.

Intentionally excluded: toggleterm/lazygit, nvim-lint, external tree plugin (using netrw `<leader>pv`).

Core behaviors:
  - Formatting: conform (prettierd/prettier, stylua, isort+black, etc.) with LSP fallback.
  - LSP servers: lua_ls, rust_analyzer, tailwindcss, ts_ls, eslint, omnisharp, html, cssls, jsonls (auto-managed via mason).
  - Autocommands: yank highlight, equalize splits on resize, close helper buffers with `q`, trim trailing whitespace on save.
  - Diagnostics UI: native + Trouble.
  - Performance: unneeded default runtime plugins disabled via lazy perf settings.

Representative keymaps (leader = space):
  - Navigation & editing: visual move J/K; centered scroll `<C-d>` / `<C-u>`; preserve paste `<leader>p`; blackhole delete `<leader>d`.
  - Git (gitsigns): hunk nav `[h` / `]h`, stage `<leader>hs`, reset `<leader>hr`, stage buffer `<leader>hS`, reset buffer `<leader>hR`, preview `<leader>hp`, blame `<leader>hb`, diff `<leader>hd`.
  - Git (fugitive): `<leader>gs` status, push/pull in fugitive buffer.
  - Harpoon: `<leader>a` add, `<leader>hm` menu, `<leader>1..4` slots, `<leader>hp`/`<leader>hn` cycle, `<leader>ht` telescope.
  - Telescope: `<leader>pf` files, `<leader>ps` grep, `<leader>pws`/`<leader>pWs` word grep, `<C-p>` git files, `<leader>vh` help.
  - LSP: `gd` definition, `K` hover, `<leader>vws` workspace symbols, `<leader>vd` diagnostic float, `<leader>vca` code action, `<leader>vrr` references, `<leader>vrn` rename, `[d`/`]d` diagnostics.
  - Trouble: `<leader>tt` workspace diag, `<leader>td` document diag, `<leader>tr` references, `<leader>ts` symbols, `<leader>tS` definitions, `<leader>tq` quickfix, `<leader>tl` loclist, `[t`/`]t` nav.
  - Neotest: `<leader>nr` run nearest, `<leader>ns` suite, `<leader>nd` debug, `<leader>nv` summary, `<leader>no` output, `<leader>na` all.
  - DAP: `<F8>` continue, `<F10>` step over, `<F11>` step into, `<F12>` step out, `<leader>b` breakpoint, `<leader>B` conditional, `<leader>D*` UI panels.
  - Copilot: `<leader>cc` toggle chat, `<leader>ce` explain, `<leader>ct` tests, `<leader>cf` fix, `<leader>cr` review, `<leader>co` optimize, `<leader>cd` docs, `<leader>ca` prompt, `<leader>cm` commit msg.
  - Undo tree: `<leader>u`.
  - Format: `<leader>f`.
  - Which-key: auto-triggers on `<leader>` after 250ms delay.

Future considerations:
  - Optional file explorer (oil.nvim or minimal tree) if netrw feels limiting.
  - ESLint LSP or biome for richer JS/TS diagnostics (since nvim-lint removed).
  - Project/session enhancements (telescope-project or rooter behavior).
  - Automated health command (e.g., :MurdrHealth) to summarize environment quickly.

## tmux Highlights
- Prefix: `Ctrl-Space` (replaces default `Ctrl-b`)
- Reload config: `prefix + r`
- Navigation: hjkl pane movement
- Plugins (TPM): `tmux-plugins/tpm`, `christoomey/vim-tmux-navigator`, `tmux-plugins/tmux-sensible`, `catppuccin/tmux`
- Theme: Catppuccin window style (rounded)
- Session Utilities:
  - `f` (bound with `-r`): open `tmux-sessionizer`
  - `S`: project script `tmux-nerd.sh`
  - `K`: project script `tmux-cw2.sh`
- Terminal & Color: `default-terminal tmux-256color`, RGB override.

## Scripts Overview (`/scripts`)
Most scripts orchestrate tmux sessions/windows for specific projects.
- `tmux-sessionizer`: FZF-select project dir from `~/dev ~/notes ~/nerd`; creates/switches tmux session.
- `tmux-windowizer`: Creates/selects window within current session; runs command in it.
- `tmux-nerd.sh`: Attaches/renames window to "notes", opens `~/nerd` in Neovim, sets up a shell window; optional git branch checkout.
- `tmux-cw2.sh`: Similar pattern targeting `~/dev/cw/chill-warrior` (monorepo root) with code + shell windows and branch switching.
- `tmux-cw.sh` / `tmux-wtrtrk.sh`: Legacy style explicit multi-window session creation (code/run/shell) for specific repos.
- `tmux-wtrtrk.sh`: Adds an Expo React Native run window.
- `ghostty-tmux.sh`: Ensures a `ghostty` tmux session exists and attaches.
- `tmux-cht.sh`: Query cheatsheets via cht.sh for languages/commands listed in `.tmux-cht-*` files (typo at first char shebang `$!`).

### Script Improvement Opportunities
- Fix shebang in `tmux-cht.sh` (`#!/usr/bin/env bash`).
- Normalize session orchestration (migrate older explicit scripts to windowizer pattern for consistency).
- Add safety: `set -euo pipefail` + quoting project paths.
- Introduce a generic project template script (param: directory, optional run command).

## Shell (`zsh/.zshrc`)
- PATH: Adds scripts dir.
- Key binding: `Ctrl-f` triggers `tmux-sessionizer` directly (mirrors Neovim mapping and tmux binding — consistent muscle memory).
- History: Large persistent history (`HISTSIZE=1000`, `SAVEHIST=50000`).
- Tools loaded: fzf, autosuggestions, syntax highlighting, nvm, rbenv, thefuck, starship, zoxide.
- Aliases highlight:
  - Git: `lg` (lazygit), `gitconfig` to edit global config.
  - Tmux: session list/attach/new/kill convenience.
  - `vim` -> `nvim`; `ls` -> `eza -la --icons=always`.
  - `cd` aliased to `z` (zoxide smart jump).
- Languages: Java (Zulu 17), Android SDK, Node (nvm), Ruby (rbenv). Room to add rustup, go, python (pyenv) if needed.

## Starship Prompt
- Single canonical config at `/starship/.config/starship/starship.toml`, symlinked to `~/.config/starship.toml` via stow.
- Powerline segmented style with Catppuccin palette; modules: OS, username, directory, git, multiple language runtimes (shows only when relevant), docker, time, newline + character.
- Character symbols themed by mode (vim integration via shell vi-mode if enabled later).

## Terminal Emulators
- All enforce consistent dimensions (112x64) & JetBrainsMono Nerd Font.
- Theming unified (Catppuccin Mocha). WezTerm adds blur/opacity; Alacritty minimal; Ghostty hidden titlebar, padding.

## Consistency Conventions
- Theme: Catppuccin Mocha everywhere.
- Font: JetBrainsMono Nerd Font.
- Primary key for session/project switching: `<C-f>` / `f` / same concept across shell, tmux, Neovim.
- Project automation via small composable scripts (sessionizer + windowizer).

## Potential Missing Pieces / Assumptions
- No bootstrap/install script for new machine (consider adding `install.sh` using `stow` or `chezmoi`).
- `tpm` directory empty—plugins fetched after first tmux run via `<prefix> + I`.
- No global language version managers beyond what's in shell; may want standardization (pyenv, goenv, mise).

## Suggested Future Enhancements
1. Add `scripts/bootstrap.sh` to install Homebrew packages, fonts, clone repos, link configs.
2. Add CI lint (e.g., shellcheck scripts) and formatting (Stylua config adjustments, maybe `.editorconfig`).
3. Add Neovim plugin for session/project nav (e.g., telescope project) integrated with tmux-sessionizer.
4. Replace legacy tmux project scripts (`tmux-cw.sh`, `tmux-wtrtrk.sh`) with parametric approach.
5. Add README upgrade: Quickstart + screenshot.
6. Fix shebang in `tmux-cht.sh` and add executable bit check guidance.

## AI Usage Guidance
When asking the AI to modify environment:
Provide: target tool (e.g., tmux, zsh, Neovim), desired behavior, any language/runtime specifics.
AI should: update only relevant file(s), preserve theme & key consistency, mention if starship modules need enabling, suggest test steps.

Example Prompt:
"Add a tmux keybinding to toggle mouse mode and reflect status line indicator."

## Update Checklist
- Added/Removed Plugin? -> Update: `CONTEXT.md` (Neovim section) + ensure `lazy-lock.json` committed if intentional.
- New Script? -> Document in Scripts Overview.
- New Tool/Theme? -> Add to High-Level Stack + Consistency Conventions.
- Renamed Directory? -> Reflect in Directory Map.
- New Aliases/Env Vars? -> Summarize under Shell section.

---
Last updated: 2026-03-12 (Fixed which-key, Trouble v3 modes, keymap conflicts; added gitsigns; refreshed plugin inventory)
