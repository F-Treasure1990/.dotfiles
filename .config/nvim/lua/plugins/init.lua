return {
	{
		"christoomey/vim-tmux-navigator",
		lazy = true,
		event = function()
			if vim.fn.exists("$TMUX") == 1 then
				return "VeryLazy"
			end
		end,
	},
	{
		"Exafunction/codeium.vim",
		event = { "BufReadPre", "BufNewFile" },
		commit = "289eb724e5d6fab2263e94a1ad6e54afebefafb2",
		config = function()
			vim.g.codeium_disable_bindings = 1 -- disable original keybindings
			vim.g.codeium_idle_delay = 250
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-l>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true, desc = " Codeium Accept Selection" })
			vim.keymap.set("i", "<C-k>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true, desc = " Codeium Cycle Completions" })
			vim.keymap.set("i", "<C-j>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true, silent = true, desc = "Codeium Cycle Completions " })
			vim.keymap.set("i", "<C-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true, silent = true, desc = " Codeium Accept Selection" })
		end,
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "undotree" },
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("colorizer").setup({
				filetypes = {
					"css",
					"scss",
					"sass",
					"lua",
					"javascript",
					"typescript",
					"typescriptreact",
					"javascriptreact",
					"html",
				},
				user_default_options = {
					css = true,
					names = true,
					mode = "virtualtext",
					tailwind = true,
					virtualtext = "■", -- 
					always_update = true,
					hsl_fn = true,
					rgb_fn = true,
					css_fn = true,
					AARRGGBB = true,
				},
			})
		end,
	},
}
