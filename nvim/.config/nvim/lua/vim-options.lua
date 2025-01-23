-- leader
vim.g.mapleader = " "

vim.opt.guicursor = ""

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- lines
vim.opt.nu = true
vim. opt.relativenumber = true
vim.opt.number = true

-- undo stuff
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- folds
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- move blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move highlighted block up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move highlighted block down" })

-- navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "nav up" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "nav down" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "nav left" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "nav right" })

-- search
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "remove search highlight" })

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "decrement number" })

-- keep cursor centered when jumping
vim.keymap.set("n", "J", "mxJ`z", { desc = "keep cursor center while jumping" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "keep cursor center while jumping" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "keep cursor center while jumping" })
vim.keymap.set("n", "n", "nzzzv", { desc = "keep cursor center while jumping" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "keep cursor center while jumping" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "no idea what this does" })

-- next greatest rempas ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "clipboard shit" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "no idea" })

-- dumb
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "smoothest way to exit insert" })

-- no Q
vim.keymap.set("n", "Q", "<nop>", { desc = "no QQ" })

-- tmux sessionizer (pretty sure this doesnt work
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "open tmux sessionizer" })

-- not sure
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "does something" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "does something" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "does something" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "does something" })

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertical" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontal" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "make split equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split" })

-- some search and replace guru shit
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "find and replace" })


