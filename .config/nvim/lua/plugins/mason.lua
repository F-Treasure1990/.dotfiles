return {
  'williamboman/mason.nvim',
  lazy = false,
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    --'neovim/nvim-lspconfig',
    -- "saghen/blink.cmp",
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local mason_tool_installer = require('mason-tool-installer')

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })
    -- Installs LSP Servers
    mason_lspconfig.setup({
      automatic_enable = false,
      ensure_installed = require('core.utils').lsp_servers(),
    })
    -- Installs CLI Tools (formatters, linters, etc)
    mason_tool_installer.setup {
      ensure_installed = {
        'prettierd',
        'stylua', -- Used to format Lua code
        'hadolint', -- docker
        'markdownlint-cli2',
        'markdown-toc',
      },
    }
  end,
}
