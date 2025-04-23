return { -- Autocompletion
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    'folke/lazydev.nvim',
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip.loaders.from_vscode').lazy_load({ paths = { vim.fn.stdpath('config') .. '/snippets' } })
          end,
        },
      },
      opts = {},
    },
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
      -- All presets have the following mappings:
      -- <tab>/<s-tab>: move to right/left of your snippet expansion
      -- <c-space>: Open menu or open docs if already open
      -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
      -- <c-e>: Hide menu
      -- <c-k>: Toggle signature help
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      preset = 'enter',

      -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
      --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },

    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      -- documentation = { auto_show = true, auto_show_delay_ms = 200 },
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
    },
    cmdline = {
      completion = { ghost_text = { enabled = true } },
      sources = function()
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
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    snippets = { preset = 'luasnip' },

    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    --
    -- By default, we use the Lua implementation instead, but you may enable
    -- the rust implementation via `'prefer_rust_with_warning'`
    --
    -- See :h blink-cmp-config-fuzzy for more information
    fuzzy = { implementation = 'prefer_rust_with_warning' },

    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
  },
}
