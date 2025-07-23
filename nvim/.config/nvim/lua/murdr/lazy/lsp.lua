return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "neovim/nvim-lspconfig", lazy = false },

  {
    "qwilliamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        automatic_installation = true, -- or auto_install = true (older)
        ensure_installed = {
          "ts_ls",
          "html",
          "cssls",
          "svelte",
          "tailwindcss",
          "lua_ls",
          "csharp_ls",
          "ruby_lsp",
        },
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp")
        .default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function on_attach(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
      end

      -- per‑server tweaks
      local servers = {
        ruby_lsp = {
          cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
      }

      -- fallback opts
      local function setup(server)
        local opts = {
          capabilities = capabilities,
          on_attach = on_attach,
        }
        if servers[server] then
          opts = vim.tbl_deep_extend("force", opts, servers[server])
        end
        lspconfig[server].setup(opts)
      end

      -- If setup_handlers exists, use it; otherwise manual loop
      if type(mason_lspconfig.setup_handlers) == "function" then
        mason_lspconfig.setup_handlers({
          function(server) setup(server) end,
        })
      else
        for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
          setup(server)
        end
      end
    end,
  },
}

