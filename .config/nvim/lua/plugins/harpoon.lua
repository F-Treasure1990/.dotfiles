return {
	{
		"ThePrimeagen/harpoon",
		lazy = true,
		keys = {
			{ "<leader>ho", '<Cmd>:lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = "Harpoon" },
			{ "<leader>hh", '<Cmd>:lua require("harpoon.ui").nav_file(1)<CR>', desc = "Harpoon File 1" },
			{ "<leader>hj", '<Cmd>:lua require("harpoon.ui").nav_file(2)<CR>', desc = "Harpoon File 2" },
			{ "<leader>hk", '<Cmd>:lua require("harpoon.ui").nav_file(3)<CR>', desc = "Harpoon File 3" },
			{ "<leader>hl", '<Cmd>:lua require("harpoon.ui").nav_file(4)<CR>', desc = "Harpoon File 4" },
			{ "<leader>hn", '<Cmd>:lua require("harpoon.ui").nav_next()<CR>', desc = "Harpoon Next File " },
			{ "<leader>hp", '<Cmd>:lua require("harpoon.ui").nav_prev()<CR>', desc = "Harpoon Prev File " },

			{ "<leader>ha", '<Cmd>:lua require("harpoon.mark").add_file()<CR>', desc = "Harpoon Add File" },
		},
	},
}
