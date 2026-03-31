-- Catppuccin Mocha with transparent background
-- Keeps the previous look while relying on LazyVim defaults

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        treesitter = true,
        gitsigns = true,
        dap = true,
        cmp = true,
        native_lsp = { enabled = true },
        noice = true,
        notify = true,
        which_key = true,
        flash = true,
        indent_blankline = { enabled = true },
        mini = { enabled = true },
        snacks = true,
      },
    },
    config = function(_, opts)
      local ok = pcall(function()
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
      end)
      if ok then
        pcall(vim.api.nvim_set_hl, 0, "Normal", { bg = "none" })
        pcall(vim.api.nvim_set_hl, 0, "NormalFloat", { bg = "none" })
      end
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
