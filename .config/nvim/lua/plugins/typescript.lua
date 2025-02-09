return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  keys = {
    { '<leader>lo', '<cmd>TSToolsOrganizeImports<cr>', desc = 'Sort Imports' },

    { '<leader>li', '<cmd>TSToolsAddMissingImports<cr>', desc = 'Add Missing Imports' },
    { '<leader>le', '<cmd>TSToolsFixAll<cr>', desc = 'Fix Missing Errors' },
  },
}
