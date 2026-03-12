-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Reclaim <C-f> for tmux-sessionizer (LazyVim/noice maps it to scroll forward)
vim.keymap.del({ "n", "i", "s" }, "<c-f>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Tmux Sessionizer" })

-- Tmux sessionizer variants
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>", { desc = "Tmux Sessionizer (vsplit)" })
vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>", { desc = "Tmux Sessionizer (new window)" })
