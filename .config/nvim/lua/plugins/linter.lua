local function eslint_config_exists()
  local files = { '.eslintrc.js', '.eslintrc.json', '.eslintrc.yml', '.eslintrc.yaml', '.eslintrc' }
  for _, file in ipairs(files) do
    if vim.fn.filereadable(vim.fn.getcwd() .. '/' .. file) == 1 then
      return true
    end
  end
  return false
end

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = { 'eslint' },
      typescript = { 'eslint' },
      javascriptreact = { 'eslint' },
      typescriptreact = { 'eslint' },
    }
  end,
}
