return {
  {
    'folke/snacks.nvim',
    opts = {
      lazygit = {},
      bigfile = {},
      --    notifier = {},
      --scroll = {},
      picker = {
        exclude = { 'node_modules', '.git' },
        sources = {
          files = {
            hidden = true,
          },
        },
        layout = {
          -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"*
          -- override picker layout in keymaps function as a param below
          preset = 'telescope', -- defaults to this layout unless overidden
          cycle = true,
        },
        win = {
          input = {
            keys = {
              ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
              ['<Down>'] = { 'select_and_next', mode = { 'i', 'n' } },
              ['<Up>'] = { 'select_and_prev', mode = { 'i', 'n' } },
              ['<S-Tab>'] = { 'list_up', mode = { 'i', 'n' } },
              ['<Tab>'] = { 'list_down', mode = { 'i', 'n' } },
              ['<c-k>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
              ['<c-j>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
            },
          },
        },
        layouts = {
          select = {
            preview = false,
            focus = 'input',
            layout = {
              width = 0.6,
              min_width = 80,
              height = 0.4,
              min_height = 10,
              box = 'vertical',
              border = 'rounded',
              title = '{title}',
              title_pos = 'center',
              { win = 'input', height = 1, border = 'bottom', mode = 'n' },
              { win = 'list', border = 'none' },
              {
                win = 'preview',
                title = '{preview}',
                width = 0.6,
                height = 0.4,
                border = 'top',
              },
            },
          },
          telescope = {
            reverse = false, -- set to false for search bar to be on top
            layout = {
              box = 'horizontal',
              width = 0.9,
              height = 0.5,
              border = 'none',
              {
                box = 'vertical',
                {
                  win = 'list',
                  title = ' Results ',
                  title_pos = 'center',
                  border = 'rounded',
                },
                {
                  win = 'input',
                  height = 1,
                  border = 'rounded',
                  title = '{title} {live} {flags}',
                  title_pos = 'center',
                },
              },
              {
                win = 'preview',
                title = '{preview:Preview}',
                width = 0.50,
                border = 'rounded',
                title_pos = 'center',
              },
            },
          },
          ivy = {
            layout = {
              box = 'vertical',
              backdrop = false,
              width = 0,
              height = 0.4,
              position = 'bottom',
              border = 'top',
              title = ' {title} {live} {flags}',
              title_pos = 'left',
              { win = 'input', height = 1, border = 'bottom' },
              {
                box = 'horizontal',
                { win = 'list', border = 'none' },
                {
                  win = 'preview',
                  title = '{preview}',
                  width = 0.5,
                  border = 'left',
                },
              },
            },
          },
        },
      },
    },
    keys = {
      --- GIT ---
      {
        '<leader>gl',
        function()
          require('snacks').lazygit()
        end,
        desc = 'Lazygit',
      },

      --- Picker ---
      {
        '<leader><leader>',
        function()
          require('snacks').picker.files()
        end,
        desc = 'Files',
      },
      {
        '<leader>,',
        function()
          require('snacks').picker.buffers({ layout = 'select' })
        end,
        desc = 'Buffers',
      },
      {
        '<leader>:',
        function()
          require('snacks').picker.command_history()
        end,
        desc = 'Cmd History',
      },

      {
        '<leader>/',
        function()
          require('snacks').picker.grep({ layout = 'left' })
        end,
        desc = 'Grep',
      },
      {
        '<leader>pw',
        function()
          require('snacks').picker.grep_word({ layout = 'ivy' })
        end,
        desc = 'Grep Word',
      },
      {
        '<leader>nk',
        function()
          require('snacks').picker.keymaps({ layout = 'ivy' })
        end,
        desc = 'Keymaps',
      },
      {
        '<leader>pr',
        function()
          require('snacks').picker.recent({ layout = 'left' })
        end,
        desc = 'Recent',
      },
      {
        '<leader>u',
        function()
          require('snacks').picker.undo()
        end,
        desc = 'Undo History',
      },
      {
        '<leader>es',
        function()
          require('snacks').picker.spelling({ layout = 'select' })
        end,
        desc = 'Spelling Suggest',
      },
      {
        '<leader>dg',
        function()
          require('snacks').picker.diagnostics()
        end,
        desc = 'Global',
      },
      {
        '<leader>db',
        function()
          require('snacks').picker.diagnostics_buffer()
        end,
        desc = 'Buffer',
      },
    },
  },
}
