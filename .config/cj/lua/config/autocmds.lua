vim.api.nvim_create_autocmd("LspAttach", {
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

		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end
			})
		end


		--[[	if client.supports_method('textDocument/completion') then
			vim.lsp._completion(true, client.id, args.buf, { autotrigger = true })
		end]]

		vim.keymap.set('n', 'grn', vim.lsp.buf.rename, desc("Rename"))
		vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, desc("Code Action"))
		vim.keymap.set('n', 'grr', vim.lsp.buf.references, desc("References"))
		vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, desc("Go to Implementation"))
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, desc("Definition"))
		vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol, desc("Document Symbols"))
	end
})


-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	desc = "Highlight text on yank",
	callback = function()
		vim.highlight.on_yank({
			-- higroup = "IncSearch", -- IncSearch
			time = 80,
		})
	end,
})

-- go to the last known loc/position when opening a file/buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("restore cursor", { clear = true }),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})