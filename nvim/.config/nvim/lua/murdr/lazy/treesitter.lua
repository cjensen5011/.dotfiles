return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.config")
            local max_filesize = 100 * 1024 -- 100 KB

            local function too_big(_, bufnr)
                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
                return ok and stats and stats.size and stats.size > max_filesize
            end

            configs.setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "c_sharp",
                    "css",
                    "go",
                    "html",
                    "javascript",
                    "jsdoc",
                    "json",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "rust",
                    "templ",
                    "tsx",
                    "typescript",
                    "vimdoc",
                    "yaml",
                },
                auto_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    disable = function(lang, bufnr)
                        if lang == "html" then
                            return true
                        end
                        return too_big(lang, bufnr)
                    end,
                },
                indent = {
                    enable = true,
                    disable = { "python", "html" },
                },
            })

            local parser_config = require("nvim-treesitter.parsers")
            parser_config.templ = parser_config.templ or {}
            parser_config.templ.install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            }
            vim.treesitter.language.register("templ", "templ")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesitter-context").setup({
                enable = true,
                multiwindow = false,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = "outer",
                mode = "cursor",
                separator = nil,
                zindex = 20,
                on_attach = nil,
            })
        end,
    },
}
