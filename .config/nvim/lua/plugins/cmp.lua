return {
	"hrsh7th/nvim-cmp",
	event = { "BufReadPre", "BufNewFile" },
	--event = "InsertEnter",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
		"hrsh7th/cmp-path", -- nvim-cmp source for path
		"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words
		"hrsh7th/cmp-nvim-lua", -- nvim-cmp source for nvim lua
		--	"hrsh7th/cmp-nvim-lsp-signature-help", -- signature help
		{
			"L3MON4D3/LuaSnip",
			-- event = "VeryLazy",
			lazy = true,
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
			keys = {
				{
					"<tab>",
					'<cmd>:lua require("luasnip").jump(1)<CR>',
					mode = { "s" },
					desc = "LuaSnip Next Jump",
				},
				{
					"<s-tab>",
					'<cmd>:lua require("luasnip").jump(-1)<CR>',
					mode = { "s" },
					desc = "LuaSnip Prev Jump",
				},
			},
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load({
					paths = "~/.config/nvim/lua/snippets",
				})
				require("luasnip.loaders.from_vscode").lazy_load() -- friendly snippets loader
				require("luasnip").filetype_extend("javascript", { "jsdoc", "html" })
				require("luasnip").filetype_extend("typescript", { "tsdoc", "html" })
				require("luasnip").filetype_extend("typescriptreact", { "tsdoc" })
				--require("luasnip").filetype_extend("jsx", { "html" })
			end,
		},
	},

	config = function()
		local cmp = require("cmp")
		local utils = require("core.utils")
		local luasnip = require("luasnip")

		cmp.setup({
			formatting = {
				format = utils.cmp_formt,
				--[[ 	format = function(entry, vim_item)
					vim_item.menu = "-- " .. entry.source.name
					return vim_item
				end, ]]
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			preselect = cmp.PreselectMode.None,
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					-- border = { " ", " ", " ", " ", " ", " ", " ", " " },
					--winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenuBorder,CursorLine:CmpMenuSelect,Search:None",
				},
				completion = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					-- border = { " ", " ", " ", " ", " ", " ", " ", " " },
					--winhighlight = "Normal:CmpMenu,FloatBorder:CmpMenuBorder,CursorLine:CmpMenuSelect,Search:None",
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif utils.has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i" }),
			}),
			sources = cmp.config.sources({

				{ name = "nvim_lsp", max_item_count = 12 },
				{
					name = "luasnip",
					option = { use_show_condition = true },
					entry_filter = function()
						local context = require("cmp.config.context")
						return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
					end,
				},
				--				{ name = "luasnip" },
				{ name = "saadparwaiz1/cmp_luasnip" },
				-- { name = "nvim_lsp_signature_help", max_item_count = 5 },
				{
					{ name = "path" },
					trigger_characters = { "/", "./", "../", "~" },
				},
				{
					name = "buffer",
					max_item_count = 8,
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
			}),
		})

		cmp.setup.filetype({ "sql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})
	end,
}
