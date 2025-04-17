return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    { '<leader>bl', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
    { '<leader>bh', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', desc = 'Buffer Close Others' },
    { '<leader>bp', '<cmd>:lua Snacks.bufdelete()<cr>', desc = 'Buffer Pop' },
  },
  opts = {
    options = {

      always_show_bufferline = false,
      show_buffer_icons = true, --| false, -- disable filetype icons for buffers
      show_buffer_close_icons = false,
      show_close_icon = true, --| false,
      show_tab_indicators = true, --| false,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      --separator_style = 'thin', --| "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false, --| true,
      diagnostics = false,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'center',
        },
        {
          filetype = 'snacks_layout_box',
        },
      },
    },
  },
}
