return {
  -- auto-install formatters/linters
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- js/ts/html/css/etc.
        "prettierd", "prettier", "eslint_d",
        -- svelte
        "svelte-language-server", -- already for LSP, but fine
        -- lua
        "stylua",
        -- ruby
        "rubocop", "standardrb",
        -- csharp
        "csharpier", -- or "dotnet-format"
        -- shell
        "shfmt",
      },
      run_on_start = true,
    },
  },

  -- formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- load just before save
    opts = {
      formatters_by_ft = {
        javascript       = { "prettierd", "prettier", "eslint_d" },
        typescript       = { "prettierd", "prettier", "eslint_d" },
        javascriptreact  = { "prettierd", "prettier", "eslint_d" },
        typescriptreact  = { "prettierd", "prettier", "eslint_d" },
        svelte           = { "prettierd", "prettier" },
        css              = { "prettierd", "prettier" },
        html             = { "prettierd", "prettier" },
        json             = { "prettierd", "prettier" },
        yaml             = { "prettierd", "prettier" },
        lua              = { "stylua" },
        ruby             = { "standardrb", "rubocop" },
        sh               = { "shfmt" },
        zsh              = { "shfmt" },
        cs               = { "csharpier", "dotnet_format" },
        ["*"]            = {}, -- fallback: let LSP handle it
      },

      -- auto format on save
      format_on_save = {
        lsp_fallback = true,  -- use LSP if no formatter found
        timeout_ms = 500,
      },
    },
    config = function(_, opts)
      local conform = require("conform")
      conform.setup(opts)
    end,
  },
}

