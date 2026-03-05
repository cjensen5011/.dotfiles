## Minimal Neovim Configuration (React Native + .NET)

This setup replaces the previous LazyVim-based config with an explicit, minimal stack focused on JavaScript/TypeScript (React Native) and C#/.NET.

### Core Goals
- Fast startup, minimal abstractions.
- Explicit plugin definitions (lazy.nvim only as a manager).
- Mason-managed LSP servers.
- Lean completion + formatting + linting: nvim-cmp + conform + eslint_d.
- Consistent Catppuccin theme + custom lualine bubble style.

### Directory Layout
```
init.lua
lua/core/
  lazy.lua        -> bootstrap lazy.nvim
  options.lua     -> editor/UI settings
  keymaps.lua     -> global mappings
  autocmds.lua    -> basic automation
  lsp.lua         -> LSP + completion setup
lua/plugins/
  init.lua        -> plugin specs (single table)
  lualine.lua     -> custom statusline
  conform.lua     -> formatting
  lint.lua        -> eslint_d integration
```

### Plugins
| Purpose | Plugin |
|---------|--------|
| Manager | folke/lazy.nvim |
| Theme | catppuccin/nvim |
| Statusline | nvim-lualine/lualine.nvim |
| File Tree | nvim-tree/nvim-tree.lua |
| Finder | nvim-telescope/telescope.nvim |
| Syntax | nvim-treesitter/nvim-treesitter |
| Harpoon | ThePrimeagen/harpoon (v2) |
| Undo | mbbill/undotree |
| Integrated terminal | akinsho/toggleterm.nvim |
| LSP core | neovim/nvim-lspconfig |
| LSP installer | williamboman/mason.nvim + mason-lspconfig.nvim |
| Completion | hrsh7th/nvim-cmp + cmp-nvim-lsp + LuaSnip + cmp_luasnip |
| Snippets | rafamadriz/friendly-snippets |
| Formatting | stevearc/conform.nvim |
| Linting | mfussenegger/nvim-lint (eslint_d) |
| Copilot | zbirenbaum/copilot.lua + copilot-cmp |
| Copilot Chat | CopilotC-Nvim/CopilotChat.nvim |

### Installed LSP Servers (Auto)
- lua_ls
- ts_ls (TypeScript / TSX)
- jsonls
- yamlls
- omnisharp

### Formatting
Handled by conform:
- JS/TS/React: prettierd
- Lua: stylua
- Markdown/JSON: prettierd
- Fallback: trim whitespace + LSP format

Run manually: `:Format` (mapped to `<leader>f`).

### Linting
`eslint_d` triggered on: write + insert leave.

### Keymaps (Highlights)
Leader: `<space>`
```
<leader>e      Toggle file tree
<leader>ff     Telescope find files
<leader>fg     Telescope live grep
<leader>fb     Telescope buffers
<leader>fh     Telescope help
<leader>ha     Harpoon add file
<leader>hh     Harpoon menu
<leader>h1..4  Harpoon nav slots
<leader>gg     Lazygit (float via toggleterm)
<leader>u      Undotree toggle
<leader>f      Format buffer
<leader>d      Diagnostics float
gd / gr / K    LSP def / refs / hover
<leader>rn     Rename symbol
<leader>ca     Code action
[d / ]d        Prev/Next diagnostic
<C-l>          Accept Copilot suggestion
```

### Adding a Plugin
1. Add a spec entry to `lua/plugins/init.lua`.
2. Use lazy's `:Lazy sync` if needed.

### Updating LSP Servers
Run `:Mason` to open UI, or rely on auto-install list in `core/lsp.lua`.

### Future Enhancements (Optional)
- Add project-specific commands (e.g. React Native packager helpers).
- Add debugging (nvim-dap + js-debug + netcoredbg).
- Add test runner integration (neotest).
- Add which-key if keymap discoverability becomes an issue.

### Troubleshooting
- Copilot Chat: ensure GitHub auth; run `:Copilot auth` if needed.
- Omnisharp performance: consider `csharp_ls` if startup feels heavy.
- Prettier not formatting: confirm `prettierd` in PATH (`npm i -g @fsouza/prettierd`).

---
Last updated: 2025-09-15