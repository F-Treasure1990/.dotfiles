local opt = vim.opt
local _g = vim.opt_global

-- ────────────────────────────────────────────
-- ▶ LEADER KEY CONFIGURATION
-- ────────────────────────────────────────────
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = '\\'

-- ────────────────────────────────────────────
-- ▶ GENERAL SETTINGS
-- ────────────────────────────────────────────
vim.g.editorconfig = true
vim.g.markdown_recommended_style = 0
vim.g.have_nerd_fonts = true

-- ────────────────────────────────────────────
-- ▶ CLIPBOARD & COMPLETION
-- ────────────────────────────────────────────
opt.clipboard = 'unnamedplus' -- Sync Neovim with system clipboard
opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Better completion experience
opt.confirm = true -- Prompt to save on modified buffer close

-- ────────────────────────────────────────────
-- ▶ CURSORLINE & VISUAL TWEAKS
-- ────────────────────────────────────────────
opt.cursorline = true

-- ────────────────────────────────────────────
-- ▶ INDENTATION & TABS
-- ────────────────────────────────────────────
opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 2 -- Indent by 2 spaces
opt.tabstop = 4 -- Number of spaces tabs count for
opt.softtabstop = 4 -- Spaces per Tab in insert mode
opt.smarttab = true -- Smart handling of tab
opt.smartindent = true -- Auto smart indenting
opt.autoindent = true -- Copy indent from current line

-- ────────────────────────────────────────────
-- ▶ UI: FILLCHARS & EOB
-- ────────────────────────────────────────────
opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ', -- Empty line filler
}

-- ────────────────────────────────────────────
-- ▶ SEARCH, COMMAND, & GREP
-- ────────────────────────────────────────────
opt.inccommand = 'split'
opt.grepprg = 'rg --vimgrep'
opt.conceallevel = 1

-- ────────────────────────────────────────────
-- ▶ LINE NUMBERS & TIMING
-- ────────────────────────────────────────────
opt.number = true -- Show absolute line number
opt.relativenumber = true -- Relative line numbers for easier movement
opt.numberwidth = 2 -- Width of the number column
opt.updatetime = 250 -- Time before writing to swap
opt.timeoutlen = 300 -- Time to wait for mapped sequence

-- ────────────────────────────────────────────
-- ▶ APPEARANCE & COLORS
-- ────────────────────────────────────────────
opt.termguicolors = true -- Enable 24-bit RGB color in terminal
opt.cmdheight = 1 -- Command-line height
opt.signcolumn = 'yes:1' -- Always show signcolumn
opt.scrolloff = 10 -- Minimum lines to keep above and below cursor
opt.sidescrolloff = 10 -- Same for horizontal scrolling
opt.hlsearch = true -- Highlight search results
opt.ignorecase = true -- Ignore case in search...
opt.smartcase = true -- ...unless there's a capital letter
opt.incsearch = true -- Show search matches as you type

-- ────────────────────────────────────────────
-- ▶ GENERAL BEHAVIOR
-- ────────────────────────────────────────────
opt.mouse = 'a' -- Enable mouse support
opt.background = 'dark' -- Preferred background for colorschemes
opt.hidden = true -- Allow background buffers
opt.wrap = false -- Don't wrap long lines
opt.linebreak = true -- Break lines at word boundaries
opt.wrapmargin = 8 -- Wrap margin width
opt.showbreak = '↪ ' -- Symbol at wrapped line start

-- ────────────────────────────────────────────
-- ▶ POPUP MENU & SCROLL
-- ────────────────────────────────────────────
opt.pumheight = 8 -- Maximum number of items in popup menu
opt.pumblend = 0 -- No transparency
opt.smoothscroll = true

-- ────────────────────────────────────────────
-- ▶ SPLITS & WINDOWS
-- ────────────────────────────────────────────
opt.splitbelow = true -- Horizontal splits open below
opt.splitright = true -- Vertical splits open to the right
opt.splitkeep = 'screen' -- Keep view when splitting

-- ────────────────────────────────────────────
-- ▶ STATUS LINE & UI FLAGS
-- ────────────────────────────────────────────
opt.laststatus = 3 -- Global statusline
opt.showmode = false -- Don't show mode (handled by statusline plugin)
opt.shortmess = { l = true, F = true, I = true, W = true } -- Shorten messages

-- ────────────────────────────────────────────
-- ▶ UNDO, BACKUPS & FILE HANDLING
-- ────────────────────────────────────────────
opt.undofile = true -- Persistent undo
opt.undolevels = 10000 -- Large undo history
opt.writebackup = false -- Don't write backup file before overwriting

-- ────────────────────────────────────────────
-- ▶ VIRTUAL EDIT & BACKSPACE
-- ────────────────────────────────────────────
opt.virtualedit = 'block' -- Allow block cursor to move beyond EOL in visual block mode
opt.backspace = { 'indent', 'eol', 'start' } -- Make backspace behave intuitively

-- ────────────────────────────────────────────
-- ▶ WHITESPACE & LISTCHARS
-- ────────────────────────────────────────────
vim.opt.list = true -- Display invisible characters like tabs and trailing spaces
vim.opt.listchars = {
  tab = '  ', -- Tab character
  trail = '·', -- Trailing spaces
  nbsp = '␣', -- Non-breaking space
}
opt.listchars.eol = '↴' -- Uncomment to show end-of-line characters (optional)
