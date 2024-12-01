return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-tree/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({
					override = {
						ts = {
							icon = "󰛦",
							color = "#89B4FA",
							name = "TypeScript",
						},
						tsx = {
							icon = "",
							color = "#89B4FA",
							name = "TypeScript",
						},
						toml = {
							icon = "",
							name = "toml",
						},
					},
				})
			end,
		},
	},
	brance = "0.1.x",
	cmd = "Telescope",
	lazy = true,
	keys = {
		{ "<leader><leader>", "<cmd>Telescope find_files hidden=true  <cr>", desc = "File Search" },
		{ "<leader>/", "<cmd>Telescope live_grep <cr>", desc = "File Grep" },
		{ "<leader>fr", "<cmd>Telescope oldfiles <cr>", desc = "File Recents" },
		{ "<leader>ss", "<cmd>Telescope spell_suggest<cr>", desc = "Spell Suggest" },
		{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Spell Grep Global" },
		{ "<leader>vt", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
		{ "<leader>y", "<cmd>Telescope registers<cr>", desc = "Yank Registers", mode = { "n", "v" } },
		{ "<leader>t", "<cmd>TodoTelescope <cr>", desc = "Todo's" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local actions_layout = require("telescope.actions.layout")

		telescope.setup({
			defaults = {
				file_ignore_patterns = { ".git/", "node_modules/", ".DS_Store", ".obsidian/" },
				selection_caret = " ",
				prompt_prefix = " 󰀘  ",
				layout_strategy = "flex",
				previewer = {
					width = 0.8,
				},
				layout_config = {
					width = 0.8,
					height = 0.5,
				},
				winblend = 1,
				sorting_strategy = "ascending",
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim", -- add this value
				},
				path_display = function(_, path)
					local tail = require("telescope.utils").path_tail(path)
					local find_file_in_path = vim.fs.dirname(path)
					if find_file_in_path == "." then
						return string.format("%s", tail)
					end
					return string.format(" %s ..[ %s ]", tail, find_file_in_path)
				end,
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
						["<C-p>"] = actions_layout.toggle_preview,
						["<C-j>"] = function(...)
							return actions.preview_scrolling_down(...)
						end,
						["<C-k>"] = function(...)
							return actions.preview_scrolling_up(...)
						end,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						initial_mode = "normal",
						layout_config = {
							--height = 0.2,
						},
					}),
				},
			},
			pickers = {
				spell_suggest = {
					theme = "dropdown",
					layout_strategy = "center",
					initial_mode = "normal",
					previewer = false,
					prompt_prefix = " ",
					layout_config = {
						prompt_position = "top",
						height = 0.3,
						width = 0.5,
					},
				},
				grep_string = {
					theme = "ivy",
					layout_strategy = "flex",
					previewer = true,
					initial_mode = "normal",
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
}
