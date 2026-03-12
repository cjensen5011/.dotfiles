return {
  {
    "folke/trouble.nvim",
    config = function()
      local trouble = require("trouble")
      trouble.setup({
        icons = {
          indent = { middle = "│", last = "└", top = "│", ws = "  " },
          folder_closed = "+",
          folder_open = "-",
          kinds = {},
        },
      })

      local map = function(lhs, mode, desc)
        vim.keymap.set("n", lhs, function()
          trouble.toggle(mode)
        end, { desc = desc })
      end

      -- Core diagnostics views (Trouble v3 mode names)
      map("<leader>tt", "diagnostics", "Trouble: workspace diagnostics")
      vim.keymap.set("n", "<leader>td", function()
        trouble.toggle({ mode = "diagnostics", filter = { buf = 0 } })
      end, { desc = "Trouble: document diagnostics" })
      map("<leader>tr", "lsp_references", "Trouble: LSP references")
      map("<leader>ts", "lsp_document_symbols", "Trouble: document symbols")
      map("<leader>tS", "lsp_definitions", "Trouble: LSP definitions")
      map("<leader>tq", "qflist", "Trouble: quickfix list")
      map("<leader>tl", "loclist", "Trouble: location list")

      -- Navigation within Trouble list
      vim.keymap.set("n", "[t", function()
        if trouble.is_open() then
          trouble.prev({ skip_groups = true, jump = true })
        end
      end, { desc = "Trouble: prev item" })

      vim.keymap.set("n", "]t", function()
        if trouble.is_open() then
          trouble.next({ skip_groups = true, jump = true })
        end
      end, { desc = "Trouble: next item" })
    end,
  },
}
