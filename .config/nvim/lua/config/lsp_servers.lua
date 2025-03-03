-- These are just settings
local M = {}

M.lua_ls = {
  settings = {
    Lua = {
      completion = {
        --callSnippet = 'Replace',
        --keywordSnippet = 'Replace',
      },
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
        disable = {
          'missing-fields',
          'incomplete-signature-doc',
        },
      },
    },
    workspace = {
      -- make language server aware of runtime files
      library = vim.api.nvim_get_runtime_file('', true),
      checkThirdParty = false,
    },
    format = {
      enable = false,
    },
  },
}

M.jsonls = {
  --https://github.com/SchemaStore/schemastore/blob/master/src/api/json/catalog.json
  settings = {
    json = {
      format = { enable = true },
      validate = { enable = true },
      schemas = require('schemastore').json.schemas(),
    },
  },
}

M.yamlls = {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = '',
      },
    },
    schemas = require('schemastore').json.schemas({
      select = {
        'docker-compose.yml',
        'GitHub Workflow',
      },
    }),
    cmd = { 'yaml-language-server', '--stdio' },
  },
  filetypes = { 'yaml' },
}

--M.ts_ls = {}

M.ensure_installed = {
  -------------------
  --- LSP Servers ---
  -------------------
  'cssls',
  'html',
  'jsonls',
  'lua_ls',
  'ts_ls',
  'yamlls',
  'docker_compose_language_service',
  'dockerls',
  'emmet_language_server',
  'marksman',
  'vimls',
  'yamlls',

  ----------------------------
  --- Linters / Formatters ---
  ----------------------------
  --'eslint_d',
  'prettierd',
  'stylua',
  'markdownlint',
  'yamlfmt',
}
return M
