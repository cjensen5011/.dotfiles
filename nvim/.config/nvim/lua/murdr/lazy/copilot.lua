return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept  = "<C-l>",
          next    = "<M-]>",
          prev    = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = { ["*"] = true, markdown = true, help = true },
    },
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope.nvim", optional = true },
    },
    opts = {
      provider = "openai",         -- new style (instead of model at top level)
      openai = { model = "gpt-4o-mini" },
      window = { layout = "float", width = 0.4, height = 0.6 },
      mappings = { complete = { insert = "<C-Space>" } },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)

      local map = vim.keymap.set
      map("n", "<leader>cc", chat.toggle,                        { desc = "Copilot Chat: Toggle" })
      map("n", "<leader>cq", function() chat.ask("Explain this file") end,
        { desc = "Copilot Chat: Explain file" })
      map("v", "<leader>ce", function() chat.ask("Explain this code") end,
        { desc = "Copilot Chat: Explain selection" })
      map("v", "<leader>cf", function() chat.ask("Fix this code") end,
        { desc = "Copilot Chat: Fix selection" })
      map("n", "<leader>cs", "<cmd>CopilotChatSearch<cr>",        { desc = "Copilot Chat: Search messages" })
    end,
  },
}

