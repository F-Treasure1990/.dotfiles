return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "frappe", -- latte, frappe, macchiato, mocha
			color_overrides = {
				all = {
					base = "#18181b",
					mantle = "#27272a",
					crust = "#18181b",
					text = "#e4e4e7",
				},
			},
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			integrations = {
				cmp = true,
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				gitsigns = true,
				mini = true,
				harpoon = true,
				lsp_trouble = true,
			},
			custom_highlights = function(colors)
				return {
					CmpBorder = { fg = colors.surface2 },
					Pmenu = { bg = colors.none },
					FloatBorder = { fg = "#27272a", bg = "#27272a" },
					String = { fg = "#87af87" },
				}
			end,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
