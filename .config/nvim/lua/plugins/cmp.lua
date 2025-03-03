return {
  {
    'saghen/blink.cmp',
    --version = '*',
    tag = 'v0.11.0',
    opts = {
      keymap = {
        ['<C-n>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-e>'] = { 'hide' },
        ['<C-y>'] = { 'select_and_accept' },

        --['<S-Tab>'] = { 'select_prev', 'fallback' },
        --['<Tab>'] = { 'select_next', 'fallback' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },

        ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = {
          function(cmp)
            return cmp.select_next()
          end,
          'snippet_forward',
          --'accept',
          'fallback',
        },

        ['<S-Tab>'] = {
          function(cmp)
            return cmp.select_prev()
          end,
          'snippet_backward',
          'fallback',
        },

        --['<C-n>'] = { 'snippet_forward', 'fallback' },
        --['<C-p>'] = { 'snippet_backward', 'fallback' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          enabled = true,
          min_width = 16,
          max_height = 6,
          winblend = 0,
          winhighlight = 'Normal:None,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
          border = {
            { '󱐋', 'DiagnosticWarn' },
            { '─', 'CursorLineSign' },
            { '╮', 'CursorLineSign' },
            { '│', 'CursorLineSign' },
            { '╯', 'CursorLineSign' },
            { '─', 'CursorLineSign' },
            { '╰', 'CursorLineSign' },
            { '│', 'CursorLineSign' },
          },
          draw = {
            padding = 2,
            gap = 2,
            columns = {
              { 'kind_icon', 'label', gap = 2 },
              { 'kind' },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            winhighlight = 'Normal:None,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
            border = {
              { '󰙎', 'DiagnosticInfo' },
              { '─', 'CursorLineSign' },
              { '╮', 'CursorLineSign' },
              { '│', 'CursorLineSign' },
              { '╯', 'CursorLineSign' },
              { '─', 'CursorLineSign' },
              { '╰', 'CursorLineSign' },
              { '│', 'CursorLineSign' },
            },
          },
        },
        list = {
          selection = { preselect = false, auto_insert = true },
        },
        ghost_text = {
          enabled = false,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        cmdline = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == '/' or type == '?' then
            return { 'buffer' }
          end
          -- Commands
          if type == ':' then
            return { 'cmdline' }
          end
          return {}
        end, -- Disable sources for command-line mode
        providers = {
          snippets = {
            min_keyword_length = 2, -- Number of characters to trigger porvider
            score_offset = 0, -- Boost/penalize the score of the items
          },
          path = {
            min_keyword_length = 0,
          },
        },
      },
      signature = { enabled = true, window = { border = 'single' } },
      snippets = {
        preset = 'luasnip',
        expand = function(snippet)
          require('luasnip').lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction)
          require('luasnip').jump(direction)
        end,
      },
    },
    opts_extend = { 'sources.default' },
  },
}
