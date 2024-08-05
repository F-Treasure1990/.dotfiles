return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			on_highlights = function(hl, c)
				local prompt = "#2d3149"
				hl.TelescopeNormal = {
					bg = c.bg_dark,
					fg = c.fg_dark,
				}
				hl.TelescopeBorder = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopePromptNormal = {
					bg = prompt,
				}
				hl.TelescopePromptBorder = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePromptTitle = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePreviewTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopeResultsTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
			end,
			styles = {
				comments = { italic = true },
				floats = "dark",
			},
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
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
		end,
	},
}
