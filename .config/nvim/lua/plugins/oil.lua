return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  lazy = false,
  keys = {
    { '-', '<Cmd>Oil<CR>', desc = 'Open Oil' },
    {
      '_',
      function()
        return require('oil').open(vim.fn.getcwd())
      end,
      desc = 'Open Oil',
    },
  },
  opts = {
    columns = {
      'icon',
      'size',
      -- "permissions",
      -- "mtime",
    },
    detection_methods = { 'lsp', 'pattern' },
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ['<Esc>'] = 'actions.close',
      ['<C-h>'] = 'actions.toggle_hidden',
      ['q'] = 'actions.close',
    },
    view_options = {
      show_hidden = true,
    },
    -- use_default_keymaps = false,
    float = {
      relative = 'editor',
      border = 'rounded',
      padding = 2,
      max_width = 70,
      max_height = 20,
      win_options = {
        winblend = 8,
      },
    },
  },
  dependencies = {
    'echasnovski/mini.icons',
  },
}
