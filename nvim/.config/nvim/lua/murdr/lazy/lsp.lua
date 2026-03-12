return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        -- Diagnostic signs (Neovim 0.10+ style: configure via vim.diagnostic.config)
                local diagnostic_signs = {
                    Error = '',
                    Warn  = '',
                    Hint  = '',
                    Info  = '',
                }
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "tailwindcss",
                "ts_ls",           -- TypeScript/JavaScript
                "eslint",          -- JavaScript/TypeScript linting
                "omnisharp",       -- C#/.NET
                "html",            -- HTML
                "cssls",           -- CSS
                "jsonls",          -- JSON
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                zls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0

                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                format = {
                                    enable = true,
                                    -- Put format options here
                                    -- NOTE: the value should be STRING!!
                                    defaultConfig = {
                                        indent_style = "space",
                                        indent_size = "2",
                                    }
                                },
                            }
                        }
                    }
                end,
                ["tailwindcss"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.tailwindcss.setup({
                        capabilities = capabilities,
                        filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "heex" },
                    })
                end,
                ["omnisharp"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.omnisharp.setup({
                        capabilities = capabilities,
                        cmd = { "omnisharp" },
                        enable_roslyn_analyzers = true,
                        organize_imports_on_format = true,
                        enable_import_completion = true,
                    })
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "copilot", group_index = 2 },
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

                vim.diagnostic.config({
                    -- update_in_insert = true,
                    underline = true,
                    severity_sort = true,
                    virtual_text = false, -- disabled by default now
                    signs = {
                        text = {
                            [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
                            [vim.diagnostic.severity.WARN]  = diagnostic_signs.Warn,
                            [vim.diagnostic.severity.HINT]  = diagnostic_signs.Hint,
                            [vim.diagnostic.severity.INFO]  = diagnostic_signs.Info,
                        },
                    },
                    float = {
                        focusable = false,
                        style = 'minimal',
                        border = 'rounded',
                        source = 'always',
                        header = '',
                        prefix = '',
                    },
                })

                -- Toggle command for virtual text
                local vt_enabled = false
                vim.api.nvim_create_user_command('DiagVirtualTextToggle', function()
                    vt_enabled = not vt_enabled
                    vim.diagnostic.config({ virtual_text = vt_enabled and { prefix = '●', spacing = 2, source = 'if_many' } or false })
                    vim.notify('Virtual text: '..(vt_enabled and 'ON' or 'OFF'))
                end, { desc = 'Toggle diagnostic virtual text' })
    end
}
