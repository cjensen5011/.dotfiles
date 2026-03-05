return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "ruby",
          "html",
          "css",
          "scss",
          "javascript",
          "typescript",
          "json",
          "lua",
          "svelte",
          "astro"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
