vim.opt.guicursor = "" -- no cursor

vim.opt.nu = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.number = true  --line numbers

vim.opt.tabstop = 4  -- tab size
vim.opt.softtabstop = 4 -- tab size
vim.opt.shiftwidth = 4 -- tab size
vim.opt.expandtab = true -- spaces instead of tabs
vim.opt.smartindent = true -- smart indent

vim.opt.wrap = false -- no line wrap

vim.opt.swapfile = false -- no swap file
vim.opt.backup = false -- no backup file
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- undo file
vim.opt.undofile = true -- undo file

vim.opt.hlsearch = false -- no highlight on search
vim.opt.incsearch = true -- incremental search

vim.opt.termguicolors = true -- true color support

vim.opt.scrolloff = 8 -- 8 lines from top or bottom while scrolling
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.isfname:append("@-@") -- allow @ in file names

vim.opt.updatetime = 50 -- update interval for CursorHold

vim.opt.colorcolumn = "100" -- 100 char line

vim.opt.foldmethod = "indent" -- fold based on indent
vim.opt.foldlevel = 99 -- open all folds
