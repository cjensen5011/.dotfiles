return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- nav
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end)

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end)

      -- actions
      map("n", "<leader>hs", gs.stage_hunk, { desc = "stage hunk" })
      map("n", "<leader>hr", gs.reset_hunk, { desc = "reset hunk" })
      map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v")} end)
      map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v")} end)
      map("n", "<leader>hS", gs.stage_buffer, { desc = "stage buffer" })
      map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
      map("n", "<leader>hR", gs.reset_buffer, { desc = "reset buffer" })
      map("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
      map("n", "<leader>hb", function() gs.blame_line { full=true } end)
      map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "toggle line blame" })
      map("n", "<leader>hd", gs.diffthis, { desc = "diff this" })
      map("n", "<leader>hD", function() gs.diffthis("~") end)
      map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle deleted" })

      -- text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "no idea but something about selecting hunks" })
    end
  }
}
