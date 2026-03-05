return {
    {
        "folke/trouble.nvim",
        config = function()
                        local trouble = require("trouble")
                        trouble.setup({
                                -- The new Trouble (v3) expects structured icon tables, not a boolean.
                                -- To effectively "disable" decorative icons, supply minimalist strings.
                                icons = {
                                    indent = { middle = '│', last = '└', top = '│', ws = '  ' },
                                    folder_closed = '+',
                                    folder_open = '-',
                                    kinds = {}, -- let LSP kind text show without glyphs
                                },
                                -- You can also remove the whole icons table for defaults.
                            })

            local map = function(lhs, mode, desc)
                vim.keymap.set('n', lhs, function() trouble.toggle(mode) end, { desc = desc })
            end

            -- Core diagnostics views
            map('<leader>tt', 'diagnostics', 'Trouble: workspace diagnostics')
            map('<leader>td', 'diagnostics_document', 'Trouble: document diagnostics')
            map('<leader>tr', 'lsp_references', 'Trouble: LSP references')
            map('<leader>ts', 'symbols', 'Trouble: document symbols')
            map('<leader>tS', 'symbols_definitions', 'Trouble: symbol definitions')
            map('<leader>tq', 'quickfix', 'Trouble: quickfix list')
            map('<leader>tl', 'loclist', 'Trouble: location list')

            -- Navigation within Trouble list
            vim.keymap.set('n', '[t', function() trouble.next({ skip_groups = true, jump = true }) end, { desc = 'Trouble: next item' })
            vim.keymap.set('n', ']t', function() trouble.previous({ skip_groups = true, jump = true }) end, { desc = 'Trouble: previous item' })

        end
    },
}
