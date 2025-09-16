return {
  -- Core GitHub Copilot client (lua implementation)
  {
    'zbirenbaum/copilot.lua',
    cmd = { 'Copilot' },
    event = 'InsertEnter',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false }, -- using cmp for completion surface
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = false,
      },
    },
    config = function(_, opts)
      require('copilot').setup(opts)
    end,
  },

  -- nvim-cmp integration source for Copilot
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'zbirenbaum/copilot.lua' },
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require('copilot_cmp')
      copilot_cmp.setup(opts)
      -- ensure source is in cmp (it already appears in your lsp.lua config sources)
    end,
  },

  -- Copilot Chat (newer community maintained fork / plugin)
  {
    'CopilotC-Nvim/CopilotChat.nvim', -- using default main branch (canary deprecated)
    dependencies = {
      'zbirenbaum/copilot.lua',
      'nvim-lua/plenary.nvim',
    },
    opts = {
      -- Minimal setup; rely on defaults. Add window layout tweaks later if wanted.
      -- You can pin a commit for reproducibility by adding:
      -- version = "<commit-sha>" in this spec table (lazy.nvim supports it)
    },
    config = function(_, opts)
      local chat = require('CopilotChat')
      chat.setup(opts)

      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = desc })
      end

      map('n', '<leader>cc', chat.toggle, 'Copilot Chat: Toggle')
      map({ 'n', 'v' }, '<leader>ce', '<cmd>CopilotChatExplain<cr>', 'Copilot Chat: Explain')
      map({ 'n', 'v' }, '<leader>cf', '<cmd>CopilotChatFix<cr>', 'Copilot Chat: Fix')
      map({ 'n', 'v' }, '<leader>cr', '<cmd>CopilotChatReview<cr>', 'Copilot Chat: Review')
      map('n', '<leader>cs', '<cmd>CopilotChatSearch<cr>', 'Copilot Chat: Search history')
      map('n', '<leader>cp', '<cmd>CopilotChatPromptActions<cr>', 'Copilot Chat: Prompt actions')
      map('n', '<leader>co', '<cmd>Copilot panel<cr>', 'Copilot: Panel (core)')
    end,
  },
}
