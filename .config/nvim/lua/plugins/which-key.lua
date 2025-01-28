return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key");

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
	end
}
