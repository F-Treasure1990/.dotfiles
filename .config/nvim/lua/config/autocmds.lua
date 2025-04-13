local autocmd = vim.api.nvim_create_autocmd

local function eslint_config_exists()
  local files = { '.eslintrc.js', '.eslintrc.json', '.eslintrc.yml', '.eslintrc.yaml', '.eslintrc' }
  for _, file in ipairs(files) do
    if vim.fn.filereadable(vim.fn.getcwd() .. '/' .. file) == 1 then
      return true
    end
  end
  return false
end

autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_attach', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local opts = { buffer = args.buf, silent = true, remap = true }
    local function desc(d)
      opts = opts
      opts.desc = d
      return opts
    end

    if not client then
      return
    end

    --[[ 		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end
			})
		end ]]

    if client.supports_method('textDocument/formatting') and eslint_config_exists() then
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
        buffer = args.buf,
        group = vim.api.nvim_create_augroup('format_on_save', { clear = true }),
        callback = function()
          require('lint').try_lint()
        end,
      })
    end
    --[[	if client.supports_method('textDocument/completion') then
			vim.lsp._completion(true, client.id, args.buf, { autotrigger = true })
		end]]

    --vim.keymap.set('n', 'grn', vim.lsp.buf.rename, desc('Rename'))
    --vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, desc('Code Action'))
    --vim.keymap.set('n', 'grr', vim.lsp.buf.references, desc('References'))
    -- vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, desc('Go to Implementation'))
    --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, desc('Definition'))
    --vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol, desc('Document Symbols'))
  end,
})

-- highlight yank
autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
  desc = 'Highlight text on yank',
  callback = function()
    vim.highlight.on_yank({
      -- higroup = "IncSearch", -- IncSearch
      time = 80,
    })
  end,
})

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd(
  'FileType',
  -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
  {
    pattern = { '*.txt', '*.md', 'gitcommit' },
    callback = function()
      vim.opt.spell = true
      vim.opt.spelllang = 'en'
      vim.opt_local.wrap = true
    end,
  }
)

-- don't auto comment new line
autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- go to the last known loc/position when opening a file/buffer
autocmd('BufReadPost', {
  group = vim.api.nvim_create_augroup('restore cursor', { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with q
autocmd('FileType', {
  group = vim.api.nvim_create_augroup('close_with_q', { clear = true }),
  pattern = {
    'netrw',
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'man',
    'notify',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'neotest-output',
    'checkhealth',
    'neotest-summary',
    'neotest-output-panel',
    'qf',
    'query',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_user_command('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end
  require('conform').format({ async = true, lsp_format = 'fallback', range = range })
end, { range = true })
