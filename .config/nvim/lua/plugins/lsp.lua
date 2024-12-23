return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "b0o/SchemaStore.nvim", lazy = true },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim",    opts = {} },
      { "folke/neodev.nvim",    ft = "lua", opts = {}, lazy = true },
    },
    config = function()
      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      local servers = require("plugins.lsp.servers")

      -- Setup Mason and related plugins
      require("mason").setup()
      require("mason-tool-installer").setup({ ensure_installed = servers.ensure_installed })

      -- Setup Mason-LSPconfig with custom handlers
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = vim.tbl_deep_extend("force", {
              capabilities = capabilities,
            }, servers.lsp_servers[server_name] or {})

            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      notify_on_error = false,
      format_on_save = false,
      --[[ function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 2000,
					lsp_fallback = true,
				}
			end,
 ]]
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        yaml = { "yamlfmt", "prettierd", stop_after_first = true },
        javascript = { "prettierd", "eslint_d" },
        typescript = { "prettierd", "eslint_d" },
        typescriptreact = { "prettierd", "eslint_d" },
        javascriptreact = { "prettierd", "eslint_d" },
        markdown = { "markdownlint" },
        prisma = { "prismals" },
        go = { "gofumpt", "goimports_reviser", "golines" },
      },
    },
  },
}
