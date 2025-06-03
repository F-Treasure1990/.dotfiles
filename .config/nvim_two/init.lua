require('core.options')
require('core.keymaps')
require('core.autocmds')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = {
    colorscheme = { "kanagawa" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  ui = {
    border = "rounded",
    title = " Lazy Plugin Manager ",
    pills = true,
  },
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath("cache") .. "/lazy/cache",
      disable_events = { "UIEnter", "BufReadPre" },
    },
    reset_packpath = true,
  },
  rtp = {
    disabled_plugins = {
      "gzip",
      "tarPlugin",
      "tohtml",
      "zipPlugin",
      "netrwPlugin",
      "rplugin",
      "tutor",
      "matchit",
      "matchparen",
      "man",
    },
  },
})
