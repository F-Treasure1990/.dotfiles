local map = vim.keymap.set

-- ────────────────────────────────────────────
-- ▶ GENERAL
-- ────────────────────────────────────────────
map('n', '<leader>so', '<cmd>noh<CR>', { desc = 'Clear Search' })
--map('n', '<leader>lf', '<cmd>Format<CR>', { desc = 'Format' })

-- ────────────────────────────────────────────
-- ▶ MOVEMENT
-- ────────────────────────────────────────────
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Hl Line Up' })
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Hl Line Down' })
map('n', 'J', 'mzJ`z', { desc = 'Join Line Keep Cursor' })
map('n', 'j', 'gj', { desc = 'Visual Line Down' })
map('n', 'k', 'gk', { desc = 'Visual Line Up' })

-- ────────────────────────────────────────────
-- ▶ SCROLLING
-- ────────────────────────────────────────────
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll Down & Center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll Up & Center' })

-- ────────────────────────────────────────────
-- ▶ YANKING
-- ────────────────────────────────────────────
map('n', 'yl', 'y$', { desc = 'Yank To End Of Line' })
map('n', 'yaf', '<cmd> %y+ <CR>', { desc = 'Yank Entire File' })

-- ────────────────────────────────────────────
-- ▶ WINDOW MANAGEMENT
-- ────────────────────────────────────────────
map('n', '<leader>we', '<C-w>=', { desc = 'Make Splits Equal Size' })
map('n', '<leader>wp', '<C-W>c', { desc = 'Close Split' })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split Window Below' })
map('n', '<leader>w/', '<C-W>v', { desc = 'Split Window Right' })

-- ────────────────────────────────────────────
-- ▶ BUFFERS
-- ────────────────────────────────────────────
map('n', '<S-Tab>', '<C-6>', { desc = 'Previous Buffer' })
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })

-- ────────────────────────────────────────────
-- ▶ INSERT MODE
-- ────────────────────────────────────────────
map('i', 'jj', '<esc>', { desc = 'Escape' })

-- ────────────────────────────────────────────
-- ▶ DIAGNOSTICS
-- ────────────────────────────────────────────
map('n', 'dp', function()
  vim.diagnostic.goto_prev({ float = false })
end, { desc = 'Go to prev Diagnostic' })

map('n', 'dn', function()
  vim.diagnostic.goto_next({ float = false })
end, { desc = 'Go to next Diagnostic' })

map('n', 'dl', vim.diagnostic.open_float, { desc = 'Show Diagnostic Float' })
map('n', 'dq', vim.diagnostic.setloclist, { desc = 'Open Quickfix List' })
