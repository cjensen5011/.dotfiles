return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "fredrikaverpil/neotest-golang",
    "leoluz/nvim-dap-go",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-golang")({
          dap = { justMyCode = false },
        }),
      },
    })

    vim.keymap.set("n", "<leader>nr", function()
      require("neotest").run.run({
        suite = false,
        testify = true,
      })
    end, { desc = "Neotest: run nearest" })

    vim.keymap.set("n", "<leader>nv", function()
      require("neotest").summary.toggle()
    end, { desc = "Neotest: toggle summary" })

    vim.keymap.set("n", "<leader>ns", function()
      require("neotest").run.run({
        suite = true,
        testify = true,
      })
    end, { desc = "Neotest: run suite" })

    vim.keymap.set("n", "<leader>nd", function()
      require("neotest").run.run({
        suite = false,
        testify = true,
        strategy = "dap",
      })
    end, { desc = "Neotest: debug nearest" })

    vim.keymap.set("n", "<leader>no", function()
      require("neotest").output.open()
    end, { desc = "Neotest: open output" })

    vim.keymap.set("n", "<leader>na", function()
      require("neotest").run.run(vim.fn.getcwd())
    end, { desc = "Neotest: run all in cwd" })
  end,
}
