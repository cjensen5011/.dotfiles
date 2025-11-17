return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 5000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        elixir = { "mix" },
        cs = { "csharpier" },
        swift = { "swift_format" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = { "-style=file", "-fallback-style=LLVM" },
        },
      },
    })

    -- Manual format keybind
    vim.keymap.set("n", "<leader>f", function()
      require("conform").format({ bufnr = 0 })
    end, { desc = "Format buffer" })
  end,
}
