-- :h lspconfig-all
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "williamboman/mason.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local servers = require('config.lsp_servers')

    for server, settings in pairs(servers) do
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      lspconfig[server].setup({
        capabilities = capabilities,
        settings = settings
      })
    end

    require('mason').setup()
  end
}
