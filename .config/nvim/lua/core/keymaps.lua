local map = vim.keymap.set
-- UI
map("n", "<leader>so", "<cmd>noh<cr>", { desc = "Clear Search" })

-- ==========================================================================
-- Quickfix
-- ==========================================================================
map("n", "<leader>qn", vim.cmd.cnext, { desc = "quickfix next", silent = true })
map("n", "<leader>qp", vim.cmd.cprev, { desc = "quickfix next", silent = true })

-- ==========================================================================
-- Buffers
-- ==========================================================================
map("n", "<S-Tab>", "<C-6>", { desc = "Buffer Prev" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" }) -- new file

--[[
local utils = require("core.utils")
if not utils.has("bufferline.nvim") then
	map("n", "<S-l>", "<cmd>:bnext<CR>", { desc = "next tab" })
	map("n", "<S-h>", "<cmd>:bprevious<CR>", { desc = "prev tab" })
end
 ]]
-- ==========================================================================
-- Movement
-- ==========================================================================
map("v", "K", ":m '<-2<CR>gv=gv") -- move highlighted line up
map("v", "J", ":m '>+1<CR>gv=gv") -- move highlighted line down
map("n", "J", "mzJ`z") -- move line to end of about line
map("n", "j", "gj") -- move line to end of about line
map("n", "k", "gk") -- move line to end of about line

-- ==========================================================================
-- Yank
-- ==========================================================================
map({ "v", "n" }, "yl", "y$", { desc = "Yank To End Line" }) -- yanks to end of line
map({ "v", "n" }, "yaf", "<cmd> %y+ <CR>", { desc = "Yank All Buffer" }) -- yank whole file

-- ==========================================================================
-- Spell
-- ==========================================================================
map("n", "<leader>sn", "]s", { desc = "next spell error" })
map("n", "<leader>sp", "[s", { desc = "prev spell error" })
map("n", "<leader>sa", "zg", { desc = "add word" })

-- ==========================================================================
-- Vim
-- ==========================================================================
map("n", "<leader>vi", vim.show_pos, { desc = "Hl Inspect" }) -- highlight inspect
map("n", "<leader>vc", "<cmd>Telescope colorscheme <cr>", { desc = "ColorSchemes" }) -- colorschemes
map("n", "<leader>vh", "<cmd>Telescope highlights <cr>", { desc = "Highlights" })
map("n", "<leader>vk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
-- ==========================================================================
-- Morge
-- ==========================================================================
-- Windows
map("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>wp", "<C-W>c", { desc = "Window Pop" })
map("n", "<leader>w-", "<C-W>s", { desc = "Window Split Below" })
map("n", "<leader>w/", "<C-W>v", { desc = "Window Split Right" })
