-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('config.options')
-- Setup lazy.nvim
require('lazy').setup({
  spec = {
    -- import your plugins
    { import = 'plugins' },
  },
  install = {
    missing = true,
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
  change_detection = { notify = false, enabled = true },
  ui = {
    border = 'rounded',
  },
  performance = {
    cache = {
      enabled = true,
    },
  },
  rtp = {
    -- disable some rtp plugins
    disabled_plugins = {
      'gzip', -- Vim plugin for editing compressed files.
      'tarPlugin', -- tarPlugin.vim -- a Vim plugin for browsing tarfiles
      'tohtml', -- Vim plugin for converting a syntax highlighted file to HTML.
      'zipPlugin', -- zipPlugin.vim: Handles browsing zipfiles
      'netrwPlugin', -- netrwPlugin.vim: Handles file transfer and remote directory listing across a network
      'rplugin', -- support of plugins written in other languages
      'tutor',
    },
  },
})
