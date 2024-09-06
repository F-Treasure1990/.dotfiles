local _ = vim.opt
local _g = vim.opt_global

-- ==========================================================================
-- Global
-- ==========================================================================
vim.g.editorconfig = false
vim.g.mapleader = [[ ]]

-- ==========================================================================
-- UI
-- ==========================================================================
_.number = true -- enable line numbers
_.relativenumber = true -- relative line numbers
_.termguicolors = true -- true colour support
_.showmode = false -- show vim mode
_.showcmd = false
_.cmdheight = 1 -- cmdline height
_.pumheight = 8 -- maximum number of entries in popup menus
_.pumblend = 0 -- transparency of popupmenu
_.showtabline = 2 -- show tabline at top _.cursorline = true     -- Enable highlighting of the current line
_.signcolumn = "yes:1" -- number of spaces in sign column
_.scrolloff = 8 -- number of lines to how beyond highlighted
_.sidescrolloff = 8 -- number of words beyond screen length
_.laststatus = 2 -- display setting of statusbar bottom
_.statusline = "  %f %m"
_.breakindent = true -- enable break indent
_.inccommand = "split" -- live editor below for word changes etc.
_.hlsearch = true

-- ==========================================================================
-- Indents, spaces, tabulation
-- ==========================================================================
_.expandtab = true -- tab spaces
_.shiftwidth = 2 -- << | >> = 4 spaces
_.tabstop = 2 -- tab= 4 spaces
_.textwidth = 120 -- maximum width (number of cols) of text that is being inserted

-- ==========================================================================
-- Markdown
-- ========================================================================== vim.g.markdown_recommended_style = 0
vim.g.vim_markdown_frontmatter = 1

-- ==========================================================================
-- Folds
-- ==========================================================================
_.foldmethod = "manual"
_.foldexpr = "v:lua.vim.treesitter.foldexpr()"
_.foldcolumn = "0"
_.foldlevel = 99
_.foldlevelstart = 99
-- ==========================================================================
-- Text
-- ==========================================================================
_.wrap = true -- line wrapping
_.wrapmargin = 8 -- margin at end of line before wraps

-- ==========================================================================
-- Search
-- ==========================================================================
_.ignorecase = true -- ignore case
_.smartcase = true -- all searches are insensitive
_.smartindent = true -- smart indent
_.grepprg = "rg --vimgrep"

-- ==========================================================================
-- Other
-- ==========================================================================
_.hidden = true -- allows to switch to multiple buffers without saving
_.clipboard = "unnamedplus" -- sync with system clipboard
_.syntax = "on" -- enable extra highlighting
_.mouse = "a" -- enable mouse in all modes
_.mousemoveevent = false
_.incsearch = true -- highlight as you search
_.fileencoding = "utf-8" -- encoding set to utf-8
_.tabline = " %f %m %= %{&filetype} %2p%% %3l:%-2c" -- title of the file tabs
-- _.tabline = '%y %t %m' -- title of the file tabs
--_.statusline = [[%mode %F %y]] -- statusline
_.splitbelow = true -- Put new windows below current
_.splitright = true -- Put new windows right of current
_.swapfile = false
_.shortmess = { l = true, F = true, I = true, W = true } -- certain display texts around editor
--_.shell = '/bin/bash -i'                                 -- aids with tmux nav speed but not on linux!
_.spell = true -- enable spellcheck
_.undofile = true -- enables undo-persistence
_.undolevels = 10000
_.splitkeep = "cursor" -- scroll behaviour when opening, closing splits
_.conceallevel = 1 -- hides certain concealable text e.g. markdown
-- _.concealcursor = "nc" --Sets the modes in which text il the cursor line can also be concealed.
_.confirm = true -- ask about unsaved/read-only files
_.writebackup = false -- make backup of file before overwriting a file
_.updatetime = 100
_.timeoutlen = 250
_.timeout = true
_.lazyredraw = false
_.listchars = { tab = [[→→]], trail = "•", extends = "»", precedes = "«", nbsp = "␣" }
_.fillchars = { eob = " ", stl = " ", stlnc = " ", diff = "╱", fold = " " }

_g.completeopt = { "menu", "menuone", "noselect" } -- dont let autocomplete affect typing habits
_g.spellsuggest = { "best", "9" }
