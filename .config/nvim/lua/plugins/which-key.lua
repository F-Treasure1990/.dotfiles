return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		local wk = require("which-key")
		wk.setup({
			win = {
				border = "none", -- shadow / single / double / none
			},
			presets = {
				operators = false,
				motions = false,
				nav = false,
				z = false,
				g = false,
			},
		})

		wk.add({
			{ "<leader>b", desc = "Buffers" },
			{ "<leader>c", desc = "Code" },
			{ "<leader>f", desc = "Files" },
			{ "<leader>h", desc = "Harpoon" },
			{ "<leader>l", desc = "Lsp" },
			{ "<leader>o", desc = "Obsidian" },
			{ "<leader>q", desc = "Quickfix" },
			{ "<leader>r", desc = "Refactor" },
			{ "<leader>s", desc = "Spell" },
			{ "<leader>t", desc = "Todos" },
			{ "<leader>v", desc = "Vim" },
			{ "<leader>w", desc = "Workspace" },
			{ "<leader>y", desc = "Yank Regs" },
		})
	end,
}
