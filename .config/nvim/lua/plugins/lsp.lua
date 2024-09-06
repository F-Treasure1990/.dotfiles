return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "b0o/SchemaStore.nvim", lazy = true },
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", ft = "lua", opts = {}, lazy = true },
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			local servers = require("plugins.lsp.servers")

			require("mason").setup()
			require("mason-tool-installer").setup({ ensure_installed = servers.ensure_installed })
			require("java").setup()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers.lsp_servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						if server_name == "ts_ls" then
							server_name = "ts_ls"
						end
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				yaml = { "yamlfmt", "prettierd", stop_after_first = true },
				javascript = { "prettierd" },
				typescript = { "prettierd", "eslint", stop_after_first = true },
				typescriptreact = { "prettierd", "eslint", stop_after_first = true },
				javascriptreact = { "prettierd", "eslint", stop_after_first = true },
				markdown = { "markdownlint" },
				prisma = { "prismals" },
				go = { "gofumpt", "goimports_reviser", "golines" },
			},
		},
	},
}
