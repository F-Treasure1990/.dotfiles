return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    on_highlights = function(hl, c)
      local prompt = '#2d3149'
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopePromptNormal = {
        bg = prompt,
      }
      hl.TelescopePromptBorder = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePromptTitle = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
    end,
    styles = {
      comments = { italic = true },
      floats = 'dark',
    },
  },
  config = function(_, opts)
    vim.g.tokyonight_dark_float = false
    require('tokyonight').setup(opts)
    vim.cmd('colorscheme tokyonight')

    local hl = vim.api.nvim_set_hl
    hl(0, 'FloatBorder', { bg = '#1b1d2b', fg = '#1b1d2b' })
  end,
}
