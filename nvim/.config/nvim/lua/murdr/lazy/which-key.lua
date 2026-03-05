return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
      preset = "modern",
      delay = 500, -- delay before showing the popup (ms)
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      win = {
        border = "rounded",
        position = "bottom",
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
      -- Don't show which-key for these triggers automatically
      triggers = {
        { "<leader>", mode = { "n", "v" } },
      },
    })

    -- Document key mappings
    wk.add({
      -- Leader key groups
      { "<leader>p", group = "Project/Files" },
      { "<leader>pf", desc = "Find files" },
      { "<leader>ps", desc = "Project search (grep)" },
      { "<leader>pws", desc = "Search word under cursor" },
      { "<leader>pWs", desc = "Search WORD under cursor" },
      { "<leader>pv", desc = "Project view (netrw)" },

      { "<leader>v", group = "LSP/Diagnostics" },
      { "<leader>vws", desc = "Workspace symbols" },
      { "<leader>vd", desc = "View diagnostics (float)" },
      { "<leader>vca", desc = "Code actions" },
      { "<leader>vrr", desc = "References" },
      { "<leader>vrn", desc = "Rename" },
      { "<leader>vh", desc = "Help tags" },

      { "<leader>c", group = "Copilot Chat" },
      { "<leader>cc", desc = "Toggle Copilot Chat" },
      { "<leader>cq", desc = "Close Copilot Chat" },
      { "<leader>ce", desc = "Explain code", mode = { "n", "v" } },
      { "<leader>ct", desc = "Generate tests", mode = { "n", "v" } },
      { "<leader>cf", desc = "Fix code", mode = { "n", "v" } },
      { "<leader>cr", desc = "Review code", mode = { "n", "v" } },
      { "<leader>co", desc = "Optimize code", mode = { "n", "v" } },
      { "<leader>cd", desc = "Generate docs", mode = { "n", "v" } },
      { "<leader>ca", desc = "Ask Copilot (custom)", mode = { "n", "v" } },
      { "<leader>cm", desc = "Generate commit message" },
      { "<leader>cs", desc = "Commit message (staged)" },
      { "<leader>cp", desc = "Copilot prompt actions" },
      { "<leader>cx", desc = "Copilot diagnostic help" },
      { "<leader>ci", desc = "Inline quick chat", mode = { "n", "v" } },

      { "<leader>e", group = "Error snippets (Go)" },
      { "<leader>ee", desc = "Return error" },
      { "<leader>ea", desc = "Assert no error" },
      { "<leader>ef", desc = "Fatal error log" },
      { "<leader>el", desc = "Logger error" },

      { "<leader>D", group = "Debug UI" },
      { "<leader>Dr", desc = "Toggle REPL UI" },
      { "<leader>Ds", desc = "Toggle stacks UI" },
      { "<leader>Dw", desc = "Toggle watches UI" },
      { "<leader>Db", desc = "Toggle breakpoints UI" },
      { "<leader>DS", desc = "Toggle scopes UI" },
      { "<leader>Dc", desc = "Toggle console UI" },

      -- Other leader commands
      { "<leader>f", desc = "Format buffer" },
      { "<leader>s", desc = "Substitute word" },
      { "<leader>y", desc = "Yank to system clipboard", mode = { "n", "v" } },
      { "<leader>Y", desc = "Yank line to system clipboard" },
      { "<leader>d", desc = "Delete to void register", mode = { "n", "v" } },
      { "<leader>tf", desc = "Run Plenary test file" },
      { "<leader>zig", desc = "Restart LSP" },
      { "<leader><leader>", desc = "Source current file" },

      -- Non-leader mappings
      { "gd", desc = "Go to definition" },
      { "K", desc = "Hover documentation" },
      { "[d", desc = "Next diagnostic" },
      { "]d", desc = "Previous diagnostic" },
      { "<C-p>", desc = "Find git files" },
      { "<C-f>", desc = "Tmux sessionizer" },
    })
  end,
}
