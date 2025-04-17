return {
  'mfussenegger/nvim-lint',
  events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = { 'eslint' },
      typescript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescriptreact = { 'eslint' },
      markdown = { 'markdownlint-cli2' },
      dockerfile = { 'hadolint' },
    }
  end,
}
