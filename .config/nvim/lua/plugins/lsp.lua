-- :h lspconfig-all
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    { 'b0o/SchemaStore.nvim', lazy = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    --[[ 		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		}, ]]
  },
  config = function()
    local lspconfig = require('lspconfig')
    local servers = require('config.lsp_servers')

    --[[ 	for server, settings in pairs(servers) do
			local configs = vim.tbl_deep_extend("force", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			}, settings)

			lspconfig[server].setup(configs)
		end ]]

    require('mason').setup()
    require('mason-tool-installer').setup({ ensure_installed = servers.ensure_installed })

    require('mason-lspconfig').setup({

      handlers = {
        function(server_name)
          local config = vim.tbl_deep_extend('force', {
            capabilities = require('blink.cmp').get_lsp_capabilities(),
          }, servers[server_name] or {})

          lspconfig[server_name].setup(config)
        end,
      },
    })
  end,
}
