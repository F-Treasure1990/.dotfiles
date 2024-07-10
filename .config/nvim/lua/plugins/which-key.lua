return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup({
			window = {
				border = "single", -- shadow / single / double / none
			},
			presets = {
				operators = false,
				motions = false,
				nav = false,
				z = false,
				g = false,
			},
			triggers_blacklist = {
				n = { "d", "g", "v", "y" },
			},
		})

		-- Document existing key chains
		require("which-key").register({
			["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
			["<leader>r"] = { name = "[R]efactor", _ = "which_key_ignore" },
			["<leader>y"] = { name = "[Y]ank Registers", _ = "which_key_ignore" },
			["<leader>s"] = { name = "[S]pell", _ = "which_key_ignore" },
			["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			["<leader>f"] = { name = "[F]ile", _ = "which_key_ignore" },
			["<leader>v"] = { name = "[V]im", _ = "which_key_ignore" },
			["<leader>q"] = { name = "[Q]uickfix", _ = "which_key_ignore" },
			["<leader>o"] = { name = "[O]bsidian", _ = "which_key_ignore" },
			["<leader>e"] = { name = "[E]xplorer", _ = "which_key_ignore" },
			["<leader>b"] = { name = "[B]uffers", _ = "which_key_ignore" },
			["<leader>l"] = { name = "[L]sp", _ = "which_key_ignore" },
			["<leader>h"] = { name = "[H]arpoon", _ = "which_key_ignore" },
			["<leader>t"] = { name = "[T]odo's", _ = "which_key_ignore" },
		})
	end,
}
