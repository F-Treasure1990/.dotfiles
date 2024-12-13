-- ==========================================================================
-- Core Settings
-- ==========================================================================
require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- ==========================================================================
-- Lazy.nvim Config
-- ==========================================================================

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	install = {
		missing = true,
	},
	change_detection = { notify = false, enabled = true },
	checker = {
		enabled = true,
		notify = false,
	},
	ui = {
		border = "rounded",
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip", -- Vim plugin for editing compressed files.
				"tarPlugin", -- tarPlugin.vim -- a Vim plugin for browsing tarfiles
				"tohtml", -- Vim plugin for converting a syntax highlighted file to HTML.
				"zipPlugin", -- zipPlugin.vim: Handles browsing zipfiles
				"netrwPlugin", -- netrwPlugin.vim: Handles file transfer and remote directory listing across a network
				"rplugin", -- support of plugins written in other languages
				"tutor",
			},
		},
	},
})
