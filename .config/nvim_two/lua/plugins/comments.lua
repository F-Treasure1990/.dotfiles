return {
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  -- TODO:
  ---WARNING:
  -- FIX:
  -- NOTE:
  -- PERF:
  -- HACK:
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    keys = {
      { '<leader>dt', '<cmd>TodoQuickFix<cr>', desc = 'Todo' },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true },
  },
}
