return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>Ha", function() harpoon:list():prepend() end, { desc = "harpoon: prepend" })
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "harpoon: add" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "harpoon: toggle menu" })

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "harpoon: 1" })
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "harpoon: 2" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "harpoon: 3" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "harpoon: 4" })


        vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():replace_at(1) end, { desc = "harpoon: replace 1" })
        vim.keymap.set("n", "<leader><C-j>", function() harpoon:list():replace_at(2) end, { desc = "harpoon: replace 2" })
        vim.keymap.set("n", "<leader><C-k>", function() harpoon:list():replace_at(3) end, { desc = "harpoon: replace 3" })
        vim.keymap.set("n", "<leader><C-l>", function() harpoon:list():replace_at(4) end, { desc = "harpoon: replace 4" })
    end
}
