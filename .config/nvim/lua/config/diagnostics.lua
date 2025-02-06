vim.fn.sign_define('DiagnosticSignError', {
  texthl = 'DiagnosticSignError',
  text = ' ', -- 󰅚 
  numhl = 'DiagnosticSignError',
})

vim.fn.sign_define('DiagnosticSignWarn', {
  texthl = 'DiagnosticSignWarn',
  text = ' ', -- 󰀪 
  numhl = 'DiagnosticSignWarn',
})
vim.fn.sign_define('DiagnosticSignHint', {
  texthl = 'DiagnosticSignHint',
  text = ' ',
  numhl = 'DiagnosticSignHint',
})
vim.fn.sign_define('DiagnosticSignInfo', {
  texthl = 'DiagnosticSignInfo',
  text = ' ', --  
  numhl = 'DiagnosticSignInfo',
})

local diagnostic_float = {
  header = '',
  border = { '▛', '▀', '▜', '▐', '▟', '▄', '▙', '▌' },
}

local diagnostic_opts = {
  title = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  virtual_text = {
    prefix = '',
    spacing = 0,
    format = function()
      return '󰄽'
    end,
  },
  float = diagnostic_float,
}

vim.diagnostic.config(diagnostic_opts)

-- setup borders for handlers
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = diagnostic_float.border,
  title = 'hover',
  max_width = math.floor(vim.o.columns * 0.8),
  max_height = math.floor(vim.o.lines * 0.3),
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = diagnostic_float.border,
  -- maxwidth = 60,
})
