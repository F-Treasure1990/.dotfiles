local diagnostic = {
	opts = {
		title = false,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		virtual_text = {
			prefix = "",
			spacing = 0,
			format = function()
				return "󰄽"
			end,
		},
		float = {
			focusable = false,
			--border = 'rounded', -- shadow
			border = { "▛", "▀", "▜", "▐", "▟", "▄", "▙", "▌" },
			--border = { "▀", "▀", "▀", "▐", "▟", "▄", "▙", "▌" },
			source = "always",
			relative = "cursor",
			header = "",
			prefix = "» ",
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			zindex = 3,
			focus = false,
			-- vim.diagnostic.open_float()
		},
	},
	icons = {
		Error = "󰅚 ", --🅴," ""󰢃 "
		Warn = "󰀪 ", --🆆," "
		Hint = "󰌶", --🅸," " "󰛩 "
		Info = " ", --🅷," ","󰗡 "
	},
}

-- ==========================================================================
-- Diagnostic Opts
-- ==========================================================================
vim.diagnostic.config(diagnostic.opts)

-- setup borders for handlers
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = diagnostic.opts.float.border,
	-- title = ' ',
})
--
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = diagnostic.opts.float.border,
	-- maxwidth = 60,
})

-- configure diagnostics signs
for name, _ in pairs(diagnostic.icons) do
	name = "DiagnosticSign" .. name
	vim.fn.sign_define(name, { text = "", texthl = name, numhl = "" })
end

-- -- configure debugger diagnostics signs
-- for name, icon in pairs(require("config.defaults").icons.debugger) do
--     vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
-- end

-- ==========================================================================
-- Diagnostic Keymaps
-- ==========================================================================
local map = require("core.utils").map
map("n", "dp", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "dn", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "dl", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "dq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
