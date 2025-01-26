return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
				cmd = { "/home/typecraft/.asdf/shims/ruby-lsp" },
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.svelte.setup({
				capabilities = capabilities,
			})
			lspconfig.astro.setup({
				capabilities = capabilities,
			})
			lspconfig.omnisharp.setup({
				capabilities = capabilities,
			})
			lspconfig.bicep.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "show definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "show references" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code actions" })
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "format" })
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "rename" })
		end,
	},
}
