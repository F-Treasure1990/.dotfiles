return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
			disable = function(_, buf)
				local max_filesize = 100 * 1024 -- 100kb
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		ensure_installed = {
			"astro",
			"html",
			"bash",
			"css",
			"lua",
			"json",
			"dockerfile",
			"javascript",
			"typescript",
			"markdown",
			"markdown_inline",
			"gitignore",
			"jsdoc",
			"tsx",
			"vim",
			"vimdoc",
		},
		indent = { enable = true, disable = { "ruby" } },
		autopairs = { enable = true },
	},
	config = function(_, opts)
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)

		-- There are additional nvim-treesitter modules that you can use to interact
		-- with nvim-treesitter. You should go explore a few and see what interests you:
		--
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	end,
}
