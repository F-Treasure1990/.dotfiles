--[[ vim.fn.sign_define('DiagnosticSignError', {
  --texthl = 'DiagnosticSignError',
  text = ' ', -- 󰅚 
  numhl = 'DiagnosticSignError',
})

vim.fn.sign_define('DiagnosticSignWarn', {
  --texthl = 'DiagnosticSignWarn',
  text = ' ', -- 󰀪 
  numhl = 'DiagnosticSignWarn',
})
vim.fn.sign_define('DiagnosticSignHint', {
  --texthl = 'DiagnosticSignHint',
  text = ' ',
  numhl = 'DiagnosticSignHint',
})
vim.fn.sign_define('DiagnosticSignInfo', {
  --texthl = 'DiagnosticSignInfo',
  text = ' ', --  
  numhl = 'DiagnosticSignInfo',
}) ]]

local signs = {
  text = {
    [vim.diagnostic.severity.ERROR] = ' ',
    [vim.diagnostic.severity.WARN] = ' ',
    [vim.diagnostic.severity.INFO] = ' ',
    [vim.diagnostic.severity.HINT] = ' ',
  },
  texthl = {
    [vim.diagnostic.severity.ERROR] = 'Error',
    [vim.diagnostic.severity.WARN] = 'Error',
    [vim.diagnostic.severity.HINT] = 'Hint',
    [vim.diagnostic.severity.INFO] = 'Info',
  },
  numhl = {
    [vim.diagnostic.severity.ERROR] = '',
    [vim.diagnostic.severity.WARN] = '',
    [vim.diagnostic.severity.HINT] = '',
    [vim.diagnostic.severity.INFO] = '',
  },
}

local diagnostic_float = {
  header = '',
  border = { '▛', '▀', '▜', '▐', '▟', '▄', '▙', '▌' },
}

local diagnostic_opts = {
  title = false,
  signs = signs,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = diagnostic_float,
  virtual_text = {
    current_line = true,
  },
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

--[[ virtual_text = {
    prefix = '',
    spacing = 0,
    format = function()
      return '󰄽'
    end,
  }, ]]
