return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  root_markers = { '*.json', '.git' },
  filetypes = { 'json', 'jsonc' },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
  },
  init_options = {
    provideFormatter = true,
  },
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
      format = {
        enable = true,
      },
      -- Enable comments in JSON files (for jsonc)
      allowComments = true,
      allowTrailingCommas = true,
    },
  },
}
