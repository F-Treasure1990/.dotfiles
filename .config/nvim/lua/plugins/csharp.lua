return {
  {
    'seblyng/roslyn.nvim',
    ft = 'cs',
    opts = {},
  },
  {
    'GustavEikaas/easy-dotnet.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('easy-dotnet').setup()
    end,
  },
}
