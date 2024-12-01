return {
	"stevearc/oil.nvim",
	lazy = true,
	keys = {
		-- { "<leader>e", '<Cmd>:lua require("oil").toggle_float()<CR>', desc = "Open Oil" }
		{ "-", "<Cmd>Oil<CR>", desc = "Open Oil" },
		{
			"_",
			function()
				return require("oil").open(vim.fn.getcwd())
			end,
			desc = "Open Oil",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			patterns = {
				".git",
				"package.json",
				"tsconfig.json",
				"tsconfig.tsconfig.json",
			},
			detection_methods = { "lsp", "pattern" },
			default_file_explorer = true,
			columns = {
				"size",
				"icon",
				-- "permissions",
				-- "mtime",
			},
			lsp_rename_autossave = true,
			constrain_cursor = "name",
			skip_confirm_for_simple_edits = true,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-b>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-r>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["<Esc>"] = "actions.close",
				["q"] = "actions.close",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["<A-h>"] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
			view_options = {
				show_hidden = true,
			},
			-- use_default_keymaps = false,
			float = {
				relative = "editor",
				border = "rounded",
				padding = 2,
				max_width = 70,
				max_height = 20,
				win_options = {
					winblend = 8,
				},
			},
		})
	end,
}
