-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move line up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "keep cursor centered while jumping" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "keep cursor centered while jumping" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "paste without yanking" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "copy to system clipboard" })

vim.keymap.set(
  "n",
  "<C-f>",
  "<cmd>silent !tmux neww ~/.dotfiles/scripts/tmux-sessionizer<CR>",
  { desc = "open tmux sessionizer" }
)

