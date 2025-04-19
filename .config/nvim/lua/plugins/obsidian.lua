return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      { name = 'dev_vault', path = '~/.config/dev_vault' },
    },
    completion = {
      blink = true,
      min_chars = 2,
    },
    disable_frontmatter = false,
    preferred_link_style = 'markdown',
    note_frontmatter_func = function(note)
      local out = { --[[ aliases = note.aliases, ]]
        title = '',
        description = '',
        tags = note.tags,
      }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
    templates = {
      subdir = '.templates',
      date_format = '%Y-%m-%d-%a',
    },
    mappings = {
      -- toggle check-boxes
      ['<leader>oc'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true, desc = 'Toggle checkbox' },
      },
    },
  },
  keys = {
    { '<leader>o', '<cmd>ObsidianOpen<cr>', desc = 'Open Obsidian' },
  },
  config = function(_, opts)
    require('obsidian').setup(opts)
  end,
}
