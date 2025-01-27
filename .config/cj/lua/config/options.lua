local set = vim.opt
local _g = vim.opt_global

vim.g.mapleader = [[ ]]
vim.g.editorconfig = true

set.cursorline = true

set.number = true
set.numberwidth = 2
set.relativenumber = true
set.termguicolors = true
set.cmdheight = 1
set.signcolumn = "yes:1"
set.scrolloff = 10
set.hlsearch = true
set.ignorecase = true
set.hidden = true
set.clipboard = "unnamedplus"
set.inccommand = "split"
set.incsearch = true
set.mouse = "a"
set.background = "dark"

set.pumheight = 8
set.pumblend = 0
set.shiftwidth = 2

set.wrap = true
set.wrapmargin = 8
set.showbreak = "↪ "
set.tabstop = 4

set.splitbelow = true
set.splitkeep = "screen"
set.splitright = true
set.shortmess = { l = true, F = true, I = true, W = true }
set.undolevels = 1000
set.undofile = true
set.confirm = true
set.writebackup = false
set.termguicolors = true
set.smarttab = true
set.laststatus = 3

set.showmode = false
set.foldmethod = "indent"
set.foldlevel = 99
vim.g.vimsyn_embed = "alpPrj"
set.listchars = {
	-- Replace tab whitespace with -->
	tab = "-->",
	-- I don't care about spaces so spaces are just plain old whitespace
	multispace = " ",
	-- nbsp=' ',
	-- If a line ends with a space, I probably do care about that, show this instead of whitespace
	trail = "",
	-- If the line goes off the screen (for some reason), show this as the last character of the line so I know the
	-- line continues to the right
	extends = "⟩",
	-- Literally the same but left
	precedes = "⟨",
}

vim.filetype.add({
	extension = {
		mdx = "markdown",
	},
})
require("config.diagnostics")
