vim.g.mapleader = " " -- leader key
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "toggle netrw" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move line up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "join line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "keep cursor center while jumping" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "keep cursor center while jumping" })

vim.keymap.set("n", "n", "nzzzv", { desc = "center line after search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "center line after search" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "paste without yanking" })

-- next greates remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "copy to system clipboard" })

vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", { desc = "delete without yanking" })

-- big dumb
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "hit 2 keys instead of one, my guy" })

vim.keymap.set("n", "Q", "<nop>", { desc = "disable ex mode" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "format code" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "quick fix list" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "quick fix list" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "location list" })

vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "decrement number" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "search and replace" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "make file executable", silent = true })

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "shout out source" })
