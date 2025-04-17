return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
  opts = {
    delay = 250,
    icons = {
      mappings = true,
    },
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
    wk.add({
      { '<leader>s', desc = 'Surround' },
      { '<leader>b', desc = 'Buffer' },
      { '<leader>e', desc = 'Editor' },
      { '<leader>g', desc = 'Git' },
      { '<leader>f', desc = 'File' },
      { '<leader>f', desc = 'File' },
      { '<leader>gt', desc = 'Typescript' },
      { '<leader>gt', desc = 'LSP' },
    })
  end,
}
