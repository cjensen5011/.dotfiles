return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons",
  },
  opts = {
    preset = "modern",
    delay = 250,
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
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.add({
      -- Groups
      { "<leader>p", group = "Project" },
      { "<leader>v", group = "LSP" },
      { "<leader>c", group = "Copilot" },
      { "<leader>t", group = "Trouble" },
      { "<leader>n", group = "Neotest" },
      { "<leader>h", group = "Harpoon/Git" },
      { "<leader>D", group = "DAP UI" },
      { "<leader>e", group = "Error snippets" },

      -- Project / Telescope
      { "<leader>pf", desc = "Find files" },
      { "<leader>ps", desc = "Live grep" },
      { "<leader>pws", desc = "Grep word" },
      { "<leader>pWs", desc = "Grep WORD" },
      { "<leader>pv", desc = "Project view" },

      -- Harpoon
      { "<leader>a", desc = "Harpoon add file" },
      { "<leader>hm", desc = "Harpoon menu" },
      { "<leader>ht", desc = "Harpoon telescope" },

      -- LSP
      { "<leader>vca", desc = "Code actions" },
      { "<leader>vd", desc = "Diagnostics float" },
      { "<leader>vrr", desc = "References" },
      { "<leader>vws", desc = "Workspace symbols" },
      { "<leader>vrn", desc = "Rename" },

      -- Copilot
      { "<leader>cc", desc = "Toggle chat" },
      { "<leader>cq", desc = "Close chat" },
      { "<leader>ce", desc = "Explain code" },
      { "<leader>ct", desc = "Generate tests" },
      { "<leader>cf", desc = "Fix code" },
      { "<leader>cr", desc = "Review code" },
      { "<leader>co", desc = "Optimize code" },
      { "<leader>cd", desc = "Generate docs" },
      { "<leader>ca", desc = "Custom prompt" },
      { "<leader>cm", desc = "Commit message" },
      { "<leader>cp", desc = "Prompt picker" },
      { "<leader>cx", desc = "Diagnostic help" },
      { "<leader>ci", desc = "Inline chat" },

      -- Trouble
      { "<leader>tt", desc = "Workspace diagnostics" },
      { "<leader>td", desc = "Document diagnostics" },
      { "<leader>tr", desc = "LSP references" },
      { "<leader>ts", desc = "Document symbols" },
      { "<leader>tS", desc = "LSP definitions" },
      { "<leader>tq", desc = "Quickfix list" },
      { "<leader>tl", desc = "Location list" },

      -- Neotest
      { "<leader>nr", desc = "Run nearest test" },
      { "<leader>nv", desc = "Toggle summary" },
      { "<leader>ns", desc = "Run test suite" },
      { "<leader>nd", desc = "Debug nearest test" },
      { "<leader>no", desc = "Open test output" },
      { "<leader>na", desc = "Run all tests" },

      -- DAP
      { "<leader>b", desc = "Toggle breakpoint" },
      { "<leader>B", desc = "Conditional breakpoint" },
      { "<leader>Dr", desc = "DAP REPL" },
      { "<leader>Ds", desc = "DAP Scopes" },
      { "<leader>Dw", desc = "DAP Watches" },
      { "<leader>Db", desc = "DAP Breakpoints" },
      { "<leader>DS", desc = "DAP Stacks" },
      { "<leader>Dc", desc = "DAP Console" },

      -- Git (gitsigns)
      { "<leader>hs", desc = "Stage hunk" },
      { "<leader>hr", desc = "Reset hunk" },
      { "<leader>hS", desc = "Stage buffer" },
      { "<leader>hR", desc = "Reset buffer" },
      { "<leader>hp", desc = "Preview hunk" },
      { "<leader>hb", desc = "Blame line" },
      { "<leader>hd", desc = "Diff this" },

      -- Misc
      { "<leader>f", desc = "Format buffer" },
      { "<leader>s", desc = "Substitute word" },
      { "<leader>y", desc = "Yank to clipboard", mode = { "n", "v" } },
      { "<leader>Y", desc = "Yank line to clipboard" },
      { "<leader>d", desc = "Delete to void", mode = { "n", "v" } },
      { "<leader>u", desc = "Undo tree" },
      { "<leader><leader>", desc = "Source file" },
      { "<leader>gs", desc = "Git status (fugitive)" },

      -- Non-leader
      { "gd", desc = "Go to definition" },
      { "K", desc = "Hover docs" },
      { "[d", desc = "Prev diagnostic" },
      { "]d", desc = "Next diagnostic" },
      { "[t", desc = "Prev trouble item" },
      { "]t", desc = "Next trouble item" },
      { "[h", desc = "Prev git hunk" },
      { "]h", desc = "Next git hunk" },
      { "<C-p>", desc = "Git files" },
      { "<C-f>", desc = "Tmux sessionizer" },
    })
  end,
}
