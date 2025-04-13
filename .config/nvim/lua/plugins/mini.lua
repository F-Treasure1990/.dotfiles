return {
  {
    'echasnovski/mini.surround',
    keys = function(_, keys)
      local opts = require('config.utils').opts('mini.surround')
      local mappings = {
        { opts.mappings.add, desc = 'Add Surrounding', mode = { 'n', 'v' } },
        { opts.mappings.delete, desc = 'Delete Surrounding' },
        { opts.mappings.find, desc = 'Find Right Surrounding' },
        { opts.mappings.find_left, desc = 'Find Left Surrounding' },
        { opts.mappings.highlight, desc = 'Highlight Surrounding' },
        { opts.mappings.replace, desc = 'Replace Surrounding' },
        { opts.mappings.update_n_lines, desc = 'Update `MiniSurround.config.n_lines`' },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        highlight_duration = 200,
        add = '<leader>sz', -- Add surrounding in Normal and Visual modes
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sc', -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    },
  },
  { 'echasnovski/mini.cursorword', version = '*', event = 'VeryLazy', opts = {
    delay = 100,
  } },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    event = 'BufReadPre',
    opts = {

      -- symbol = "▏"┆╎,
      symbol = '▏',
      options = {
        try_as_border = true,
      },
    },
  },

  {
    'echasnovski/mini.statusline',
    version = '*',
    opts = {
      use_icons = true,
    },
  },
  {
    'echasnovski/mini.icons',
    version = '*',
    opts = {
      file = {
        ['.go-version'] = { glyph = '', hl = 'MiniIconsBlue' },
        ['go.mod'] = { glyph = '󰟓', hl = 'MiniIconsBlue' },
        ['pnpm-workspace.yaml'] = { glyph = '', hl = 'MiniIconsOrange' },
        ['pnpm-lock.yaml'] = { glyph = '', hl = 'MiniIconsOrange' },
        ['.eslintrc.js'] = { glyph = '󰱺', hl = 'MiniIconsYellow' },
        ['.node-version'] = { glyph = '', hl = 'MiniIconsGreen' },
        ['.prettierrc'] = { glyph = '', hl = 'MiniIconsPurple' },
        ['.yarnrc.yml'] = { glyph = '', hl = 'MiniIconsBlue' },
        ['eslint.config.js'] = { glyph = '󰱺', hl = 'MiniIconsYellow' },
        ['package.json'] = { glyph = '', hl = 'MiniIconsGreen' },
        ['tsconfig.json'] = { glyph = '', hl = 'MiniIconsAzure' },
        ['tsconfig.build.json'] = { glyph = '', hl = 'MiniIconsAzure' },
        ['yarn.lock'] = { glyph = '', hl = 'MiniIconsBlue' },
      },
      filetype = {
        gotmpl = { glyph = '', hl = 'MiniIconsGrey' },
        go = { glyph = '', hl = 'MiniIconsBlue' },
      },
    },
  },
}
