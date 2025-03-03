return {
  'akinsho/bufferline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  keys = {
    -- pick a buffer to view from the buffer list
    --{ "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Buffer Pick" },
    { '<Tab>', '<cmd>BufferLinePick<CR>', desc = 'Buffer Pick' },
    -- pick a buffer to closes from the buffer list
    { '<leader>bp', '<cmd>BufferLinePickClose<CR>', desc = 'Buffer Pick Close' },
    { '<leader>bh', '<cmd>BufferLineCloseLeft<CR>', desc = 'Buffer Close Left' },
    { '<leader>bl', '<cmd>BufferLineCloseRight<CR>', desc = 'Buffer Close Right' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', desc = 'Buffer Close Others' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Buffer Prev' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Buffer Next' },
    { '<leader>fp', '<cmd>:bdelete<cr>', desc = 'Buffer Delete' },
  },
  opts = {
    options = {
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 18,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          text_align = 'center', --[[| "center" | "right",]]
        },
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
      show_buffer_icons = true, --| false, -- disable filetype icons for buffers
      show_buffer_close_icons = true, --| false,
      show_close_icon = true, --| false,
      show_tab_indicators = true, --| false,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = 'thin', --| "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false, --| true,
      always_show_bufferline = true, --| false,
      diagnostics = false,
      --- count is an integer representing total count of errors
      --- level is a string "error" | "warning"
      --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
      --- this should return a string
      --- Don't get too fancy as this function will be executed a lot
      groups = {
        options = {
          toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
        },
        items = {
          {
            name = 'Tests', -- Mandatory
            highlight = { underline = true, sp = 'blue' }, -- Optional
            priority = 2, -- determines where it will appear relative to other groups (Optional)
            icon = '', -- Optional
            matcher = function(buf) -- Mandatory
              return buf.name:match('%_test') or buf.name:match('%_spec')
            end,
          },
          {
            name = 'Docs',
            highlight = { undercurl = true, sp = 'green' },
            auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
            matcher = function(buf)
              return buf.name:match('%.md') or buf.name:match('%.txt')
            end,
            separator = { -- Optional
              -- style = require('bufferline.groups').separator.tab
            },
          },
        },
      },
    },
  },
}
