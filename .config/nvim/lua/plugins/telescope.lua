return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  config = function()
    local actions = require('telescope.actions')
    local actions_layout = require('telescope.actions.layout')
    local tsb = require('telescope.builtin')
    local ts = require('telescope')

    require('telescope').setup {
      pickers = {
        spell_suggest = {
          theme = 'dropdown',
          layout_strategy = 'center',
          initial_mode = 'normal',
          previewer = false,
          prompt_prefix = ' ',
          layout_config = {
            prompt_position = 'top',
            height = 0.3,
            width = 0.5,
          },
        },
        grep_string = {
          theme = 'ivy',
          layout_strategy = 'flex',
          previewer = true,
          initial_mode = 'normal',
          border = {},
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        },
      },
      defaults = {
        layout_strategy = 'flex',
        layout_config = {
          horizontal = {
            width = 0.8,
            height = 0.5,
          },
        },
        preview = {
          filesize_limit = 0.1, -- MB
        },
        file_ignore_patterns = { '.git/', 'node_modules/', '.DS_Store', '.obsidian/' },
        selection_caret = ' ',
        prompt_prefix = ' 󰀘  ',
        sorting_strategy = 'ascending', -- flex
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--trim', -- add this value
        },
        path_display = function(_, path)
          local tail = require('telescope.utils').path_tail(path)
          local find_file_in_path = vim.fs.dirname(path)
          if find_file_in_path == '.' then
            return string.format('%s', tail)
          end
          return string.format(' %s ..[ %s ]', tail, find_file_in_path)
        end,
        mappings = {
          i = {
            ['<esc>'] = require('telescope.actions').close,
            ['<C-p>'] = actions_layout.toggle_preview,
            ['<C-j>'] = function(...)
              return actions.preview_scrolling_down(...)
            end,
            ['<C-k>'] = function(...)
              return actions.preview_scrolling_up(...)
            end,
          },
        },
      },
    }

    -- Keymaps
    local set = vim.keymap.set
    set('n', '<space><space>', '<cmd>Telescope find_files hidden=true<cr>', { desc = 'Find Files' })
    set('n', '<space>fr', tsb.oldfiles, { desc = 'Recent' })
    set('n', '<space>/', require('config.utils').live_multigrep, { desc = 'Grep' })
    set('n', '<space>fh', tsb.help_tags, { desc = 'Help Tags' })
    set('n', '<space>ss', tsb.spell_suggest, { desc = 'Spell Suggest' })
    set('n', '<space>t', '<cmd>TodoTelescope <cr>', { desc = "Todo's" })

    set('n', '<space>n', function()
      local opts = require('telescope.themes').get_ivy({
        cwd = vim.fn.stdpath('config'),
      })
      require('telescope.builtin').find_files(opts)
    end, { desc = 'Find Neovim Config' })

    ts.load_extension('fzf')
  end,
}
