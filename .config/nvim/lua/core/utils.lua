local M = {}
---@param modules string[]
M.lazy_load = function(modules)
	-- when no file is opened at startup
	if vim.fn.argc(-1) == 0 then
		-- autocmds and keymaps can wait to load
		-- always load lazyvim, then user file
		M.on_very_lazy(function()
			for i = 1, #modules do
				require(modules[i])
			end
		end)
	else
		-- load them now so they affect the opened buffers
		for i = 1, #modules do
			require(modules[i])
		end
	end
end

---@param ... table
M.merge_tables = function(...)
	return vim.tbl_deep_extend("force", ...)
end

---@param mode string|table
---@param lhs string
---@param rhs string|function
---@param opts? table
---@param desc? string
M.map = function(mode, lhs, rhs, opts, desc)
	opts = opts and opts or {}
	opts = M.merge_tables(opts, { desc = desc })
	vim.keymap.set(mode, lhs, rhs, opts)
end

---@param name string
M.augroup = function(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

---@param fn fun()
function M.on_very_lazy(fn)
	vim.api.nvim_create_autocmd("User", {
		group = vim.api.nvim_create_augroup("Lazy", { clear = true }),
		pattern = "VeryLazy",
		callback = function()
			fn()
		end,
	})
end

function M.cmp_formt(_, item)
	local ELLIPSIS_CHAR = "…"
	local MAX_LABEL_WIDTH = 24
	local MAX_KIND_WIDTH = 14
	local icons = require("core.icons").kind

	local get_ws = function(max, len)
		return (" "):rep(max - len)
	end
	local content = item.abbr
	--	item.kind = icons[item.kind] .. " " .. item.kind

	if #content > MAX_LABEL_WIDTH then
		item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
	else
		item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
	end
	return item
end

---@param plugin string
function M.has(plugin)
	if package.loaded["lazy"] then
		return require("lazy.core.config").plugins[plugin] ~= nil
	else
		local plugin_name = vim.split(plugin, ".", { plain = true, trimempty = true })
		return package.loaded[plugin_name[1]] ~= nil
	end
end

M.has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

---@param on_attach fun(client, bufnr)
function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local bufnr = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, bufnr)
		end,
	})
end

--@param hl string
--@param extended_hl string
--@param opts? table
--@param alts? table
function M.extend_hl(hl, ext_hl, opts)
	local highlight = vim.api.nvim_get_hl(0, { name = hl, link = false })
	local extended_hl = vim.api.nvim_get_hl(0, { name = ext_hl, link = false })
	local hl_opts = vim.tbl_extend("force", highlight, extended_hl, opts)
	vim.api.nvim_set_hl(0, hl, hl_opts)
end

return M
