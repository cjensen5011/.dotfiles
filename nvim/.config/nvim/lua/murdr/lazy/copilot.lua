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
        yaml = true,
        json = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        ["*"] = true, -- enable for all other filetypes
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
    end,
  },

  -- Enhanced Copilot Chat
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = {
      'zbirenbaum/copilot.lua',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- for better action picker
    },
    cmd = {
      'CopilotChat',
      'CopilotChatOpen',
      'CopilotChatToggle',
      'CopilotChatExplain',
      'CopilotChatReview',
      'CopilotChatFix',
      'CopilotChatOptimize',
      'CopilotChatDocs',
      'CopilotChatTests',
      'CopilotChatCommit',
    },
    config = function()
      local chat = require('CopilotChat')
      local select = require('CopilotChat.select')

      chat.setup({
        -- Model to use; run :CopilotChatModels to see all available on your account
        model = 'claude-3.7-sonnet',
        
        -- Chat window configuration
        window = {
          layout = 'vertical', -- 'vertical', 'horizontal', 'float'
          width = 0.4, -- 40% of screen width
          height = 0.6,
          border = 'rounded',
          title = ' Copilot Chat ',
        },

        -- Question header configuration
        question_header = '## User ',
        answer_header = '## Copilot ',
        error_header = '## Error ',

        -- Show help actions in telescope picker
        show_help = true,
        show_folds = true,

        -- Auto-follow cursor in chat window
        auto_follow_cursor = true,

        -- Context for better responses
        context = 'buffers', -- 'buffers', 'buffer', or nil

        -- Prompts for quick actions
        prompts = {
          Explain = {
            prompt = '/COPILOT_EXPLAIN Write a detailed explanation of the selected code. Include:\n- What the code does\n- How it works\n- Any important patterns or techniques used',
            selection = select.visual,
          },
          Review = {
            prompt = '/COPILOT_REVIEW Review this code for:\n- Potential bugs\n- Performance issues\n- Security concerns\n- Code style and best practices\n- Suggest improvements',
            selection = select.visual,
          },
          Fix = {
            prompt = '/COPILOT_FIX There is a problem in this code. Rewrite the code to fix the issue and explain what was wrong.',
            selection = select.visual,
          },
          Optimize = {
            prompt = '/COPILOT_REFACTOR Optimize this code for better performance and readability. Explain the improvements.',
            selection = select.visual,
          },
          Docs = {
            prompt = '/COPILOT_GENERATE Add comprehensive documentation comments to this code following best practices for the language.',
            selection = select.visual,
          },
          Tests = {
            prompt = '/COPILOT_GENERATE Generate comprehensive unit tests for this code. Include edge cases and error handling.',
            selection = select.visual,
          },
          Commit = {
            prompt = 'Write a commit message for the changes following conventional commits format. Be specific and clear.',
            selection = select.gitdiff,
          },
          Debug = {
            prompt = 'Help me debug this code. Identify potential issues and suggest debugging strategies.',
            selection = select.visual,
          },
          BetterNaming = {
            prompt = 'Suggest better names for variables and functions in this code. Explain why each name is better.',
            selection = select.visual,
          },
        },

        -- Mappings within chat window
        mappings = {
          complete = {
            insert = '<Tab>',
          },
          close = {
            normal = 'q',
            insert = '<C-c>',
          },
          reset = {
            normal = '<C-r>',
            insert = '<C-r>',
          },
          submit_prompt = {
            normal = '<CR>',
            insert = '<C-s>',
          },
          accept_diff = {
            normal = '<C-y>',
            insert = '<C-y>',
          },
          yank_diff = {
            normal = 'gy',
          },
          show_diff = {
            normal = 'gd',
          },
          show_system_prompt = {
            normal = 'gp',
          },
          show_user_selection = {
            normal = 'gs',
          },
        },
      })

      -- Helper function for visual selection prompts
      local function ask_with_selection()
        local input = vim.fn.input('Ask Copilot: ')
        if input ~= '' then
          vim.cmd('CopilotChat ' .. input)
        end
      end

      -- Keymaps
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
      end

      -- Quick toggles
      map('n', '<leader>cc', '<cmd>CopilotChatToggle<cr>', 'Toggle Copilot Chat')
      map('n', '<leader>cq', '<cmd>CopilotChatClose<cr>', 'Close Copilot Chat')
      
      -- Quick actions with visual selection
      map({ 'n', 'v' }, '<leader>ce', '<cmd>CopilotChatExplain<cr>', 'Explain code')
      map({ 'n', 'v' }, '<leader>ct', '<cmd>CopilotChatTests<cr>', 'Generate tests')
      map({ 'n', 'v' }, '<leader>cf', '<cmd>CopilotChatFix<cr>', 'Fix code')
      map({ 'n', 'v' }, '<leader>cr', '<cmd>CopilotChatReview<cr>', 'Review code')
      map({ 'n', 'v' }, '<leader>co', '<cmd>CopilotChatOptimize<cr>', 'Optimize code')
      map({ 'n', 'v' }, '<leader>cd', '<cmd>CopilotChatDocs<cr>', 'Generate docs')
      
      -- Custom prompt with selection
      map({ 'n', 'v' }, '<leader>ca', ask_with_selection, 'Ask Copilot (custom)')
      
      -- Quick actions without selection
      map('n', '<leader>cm', '<cmd>CopilotChatCommit<cr>', 'Generate commit message')
      
      -- Use telescope for prompt actions (better UI)
      map('n', '<leader>cp', function()
        local actions = require('CopilotChat.actions')
        require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
      end, 'Copilot prompt actions')
      
      -- Diagnostics integration
      map('n', '<leader>cx', function()
        local actions = require('CopilotChat.actions')
        require('CopilotChat.integrations.telescope').pick(actions.help_actions())
      end, 'Copilot diagnostic help')

      -- Inline chat (like VSCode quick chat)
      map({ 'n', 'v' }, '<leader>ci', function()
        local input = vim.fn.input('Quick Chat: ')
        if input ~= '' then
          require('CopilotChat').ask(input, { selection = require('CopilotChat.select').visual })
        end
      end, 'Inline quick chat')
    end,
  },
}
