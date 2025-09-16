return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        }
      })

      local list = function()
        return harpoon:list()
      end

      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = desc })
      end

      -- Core actions
      map('n', '<leader>a', function() list():add() end, 'Harpoon: add file')
      map('n', '<leader>hm', function() harpoon.ui:toggle_quick_menu(list()) end, 'Harpoon: menu')

      -- Direct slot jumps
      map('n', '<leader>1', function() list():select(1) end, 'Harpoon: file 1')
      map('n', '<leader>2', function() list():select(2) end, 'Harpoon: file 2')
      map('n', '<leader>3', function() list():select(3) end, 'Harpoon: file 3')
      map('n', '<leader>4', function() list():select(4) end, 'Harpoon: file 4')

      -- Cycle
      map('n', '<leader>hp', function() list():prev() end, 'Harpoon: prev')
      map('n', '<leader>hn', function() list():next() end, 'Harpoon: next')

      -- Telescope integration (if telescope loaded)
      local ok_telescope, telescope = pcall(require, 'telescope')
      if ok_telescope then
        local function telescope_harpoon()
          local harpoon_files = list():display()
          local pickers = require('telescope.pickers')
          local finders = require('telescope.finders')
          local conf = require('telescope.config').values
          pickers.new({}, {
            prompt_title = 'Harpoon',
            finder = finders.new_table(harpoon_files),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(_, mapbuf)
              local actions = require('telescope.actions')
              local action_state = require('telescope.actions.state')
              mapbuf('i', '<CR>', function()
                local selection = action_state.get_selected_entry()
                actions.close(_)
                if selection and selection[1] then
                  vim.cmd('edit ' .. selection[1])
                end
              end)
              mapbuf('n', '<CR>', function()
                local selection = action_state.get_selected_entry()
                actions.close(_)
                if selection and selection[1] then
                  vim.cmd('edit ' .. selection[1])
                end
              end)
              return true
            end,
          }):find()
        end
        map('n', '<leader>ht', telescope_harpoon, 'Harpoon: Telescope menu')
      end
    end,
  }
}
