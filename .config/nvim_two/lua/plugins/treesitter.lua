return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'luadoc',
        'lua',
        'vim',
        'vimdoc',
        'query',
        'javascript',
        'html',
        'bash',
        'tsx',
        'json5',
        'json',
        'dockerfile',
        'markdown',
        'css',
        'astro',
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100kb
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    init = function(name, age)
      local config = require('nvim-treesitter.configs')
      config.setup({
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['af'] = { query = '@function.outer', desc = 'Outer Function' },
              ['if'] = { query = '@function.inner', desc = 'Inner Function' },
              ['ac'] = { query = '@class.outer', desc = 'Outer Class' },
              ['ic'] = { query = '@class.inner', desc = 'Inner Class' },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
          },
        },
      })
    end,
  },
}
