return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = {
    {
      'echasnovski/mini.icons',
      opts = {
        file = {
          ['.go-version'] = { glyph = '', hl = 'MiniIconsBlue' },
        },
        filetype = {
          gotmpl = { glyph = '󰟓', hl = 'MiniIconsGrey' },
        },
      },
    },
  },
  config = function()
    require('oil').setup({
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
        ['<A-h>'] = 'actions.toggle_hidden',
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
    })

    local set = vim.keymap.set
    set('n', '_', function()
      return require('oil').open(vim.fn.getcwd())
    end, { desc = 'Open Oil Root' })

    set('n', '-', '<Cmd>Oil<CR>', { desc = 'Open Oil' })
  end,
}
