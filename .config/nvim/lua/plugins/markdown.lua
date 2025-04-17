return {
  {
    {
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'markdown', 'norg', 'rmd', 'org', 'codecompanion' },
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {
        completions = {
          blink = { enabled = true },
        },
        code = {
          left_pad = 1,
          right_pad = 1,
          sign = false,
          style = 'block',
          position = 'right',
        },
        heading = {
          sign = false,
          width = 'block',
          left_pad = 2,
          right_pad = 4,
        },
      },
    },
  },
}
