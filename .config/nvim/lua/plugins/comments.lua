return {
  {
    'numToStr/Comment.nvim',
    event = 'BufReadPost',
    opts = {},
    config = function()
      local ft = require('Comment.ft')
      require('Comment').setup()
      ft.set('jsx', { '{/* %s */}' })
      ft.set('tsx', { '{/* %s */}' })
    end,
  },
  -- TODO: hello
  -- WARN : This plugin is not maintained
  -- FIX : This plugin is not maintainej
  -- NOTE : This plugin is not maintained
  -- HACK : This plugin is not maintained
  -- TEST : This plugin is not maintained
  -- PERF : This plugin is not maintained
  {
    'folke/todo-comments.nvim',
    --event = "VimEnter",
    event = { 'BufReadPre', 'BufNewFile' },
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        '<leader>pT',
        function()
          require('snacks').picker.todo_comments()
        end,
        desc = 'Todo',
      },
      {
        '<leader>pt',
        function()
          require('snacks').picker.todo_comments({ keywords = { 'TODO', 'FIX', 'WARN', 'NOTE', 'TEST' }, layout = 'select' })
        end,
        desc = 'Todo/Fix/Fixme',
      },
    },
    -- FIX: this is a fix
    opts = {
      signs = false,
      keywords = {
        FIX = {
          icon = ' ', -- icon used for the sign, and in search results
          color = '#f87171', -- can be a hex color, or a named color (see below)
          alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = ' ', color = '#7dd3fc' },
        HACK = { icon = ' ', color = '#FF00FF' },
        WARN = { icon = ' ', color = '#fdba74', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', color = '#EE5396', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = '#34d399', alt = { 'INFO' } },
        TEST = { icon = '⏲ ', color = '#FAE3C6', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      },
      gui_style = {
        fg = 'BOLD', -- The gui style to use for the fg highlight group.
        bg = 'NONE', -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = '^.', -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = 'empty', -- "fg" or "bg" or empty
        keyword = 'fg', -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = '', -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
    },
  },
}
