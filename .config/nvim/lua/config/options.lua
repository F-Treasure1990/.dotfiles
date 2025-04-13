local opt = vim.opt
local _g = vim.opt_global

vim.g.mapleader = [[ ]]
vim.g.maplocalleader = '\\'
vim.g.editorconfig = true

-- snacks animations
vim.g.snacks_animate = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.g.have_nerd_fonts = true -- if nerd font is installed and selected in the terminal
--opt.swapfile = false

opt.clipboard = 'unnamedplus' -- Sync with system clipboard
opt.completeopt = 'menu,menuone,noselect'
opt.confirm = true -- Confirm to save changes before exiting modified buffers
opt.cursorline = true -- Enable highlight of cursorline
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
opt.grepprg = 'rg --vimgrep'
opt.foldlevel = 99
opt.conceallevel = 2
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.termguicolors = true
opt.cmdheight = 1
opt.signcolumn = 'yes:1'
opt.scrolloff = 10
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.hidden = true
opt.inccommand = 'split'
opt.incsearch = true
opt.mouse = 'a'
opt.background = 'dark'

opt.pumheight = 10
opt.pumblend = 0
opt.shiftwidth = 2
opt.sidescrolloff = 8

opt.wrap = false
opt.linebreak = true -- Wrap lines at convenient points, dont split words
opt.wrapmargin = 8
opt.showbreak = '↪ '
opt.tabstop = 4
opt.softtabstop = 4
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true

opt.splitbelow = true
opt.splitkeep = 'screen'
opt.splitright = true
opt.shortmess = { l = true, F = true, I = true, W = true }
opt.undolevels = 10000
opt.undofile = true
opt.writebackup = false
opt.termguicolors = true
opt.laststatus = 3

opt.showmode = false

opt.smoothscroll = true
opt.foldtext = ''
opt.foldexpr = "v:lua.require'config'.utils.foldexpr()"
opt.foldmethod = 'expr'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.filetype.add({
  extension = {
    mdx = 'markdown',
  },
})
require('config.diagnostics')
