-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--
-- Only overrides that differ from LazyVim defaults are listed here.

local opt = vim.opt

-- Appearance
opt.guicursor = "" -- block cursor in all modes
opt.cursorline = false -- LazyVim enables this; disable for cleaner look
opt.colorcolumn = "80" -- visual ruler at column 80

-- Scrolling
opt.scrolloff = 8 -- LazyVim uses 4; keep 8 for more context

-- Search
opt.hlsearch = false -- don't persist search highlights (LazyVim clears on <esc> but still highlights)

-- Files / backup
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- undofile is already true in LazyVim defaults
