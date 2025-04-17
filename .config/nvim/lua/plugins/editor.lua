return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = true,
    event = function()
      if vim.fn.exists('$TMUX') == 1 then
        return 'VeryLazy'
      end
    end,
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  -- TODO:
  ---WARNING:
  -- FIX:
  -- NOTE:
  -- PERF:
  -- HACK:
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = true } },
  {
    'ggandor/leap.nvim',
    enabled = true,
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap Forward to' },
      { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap Backward to' },
      { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from Windows' },
    },
    config = function(_, opts)
      local leap = require('leap')
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
    end,
  },
  {
    'ggandor/flit.nvim',
    enabled = true,
    keys = function()
      ---@type LazyKeysSpec[]
      local ret = {}
      for _, key in ipairs({ 'f', 'F', 't', 'T' }) do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' } }
      end
      return ret
    end,
    opts = { labeled_modes = 'nx' },
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'b0o/SchemaStore.nvim',
    lazy = true,
    version = false, -- last release is way too old
  },
}
