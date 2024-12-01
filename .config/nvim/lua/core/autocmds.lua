local autocmd = vim.api.nvim_create_autocmd
local utils = require("core.utils")
local augroup = utils.augroup
local map = utils.map

-- close some filetypes with q
autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"netrw",
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
		"qf",
		"query",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		map("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- highlight yank
autocmd("TextYankPost", {
	group = augroup("HighlightYank"),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			-- higroup = "IncSearch", -- IncSearch
			time = 80,
		})
	end,
})

-- don't auto comment new line
autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- removes white space from end of all lines on save
autocmd("BufWritePre", {
	group = augroup("ClearTrailingWhitespace"),
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- go to the last known loc/position when opening a file/buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("restore cursor"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd(
	"FileType",
	-- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
	{
		pattern = { "*.txt", "*.md", "gitcommit" },
		callback = function()
			vim.opt.spell = true
			vim.opt.spelllang = "en"
			vim.opt_local.wrap = true
		end,
	}
)

-- ==========================================================================
-- LSP On Attach
-- ==========================================================================
utils.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = true, silent = true }

	map("n", "gd", require("telescope.builtin").lsp_definitions, opts, "[G]oto Definition")
	map("n", "gD", function()
		vim.lsp.buf.declartion()
	end, opts, "[G]oto Definition")
	map("n", "gr", require("telescope.builtin").lsp_references, opts, "Go References")
	map("n", "K", vim.lsp.buf.hover, opts, "Hover Docs")
	map("n", "gI", require("telescope.builtin").lsp_implementations, opts, "Go Implementations")
	map("n", "<leader>lr", vim.lsp.buf.rename, opts, "Rename")
	map("n", "<leader>la", vim.lsp.buf.code_action, opts, "Code Action")
	map("n", "<leader>lo", "<cmd>TSToolsOrganizeImports<cr>", opts, "Organize/Remove Imports")
	map("n", "<leader>li", "<cmd>TSToolsAddMissingImports<cr>", opts, "Missing Imports")
	map("n", "<leader>le", "<cmd>EslintFixAll<cr>", opts, "Eslint Fix All")
end)
