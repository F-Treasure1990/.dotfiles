local keymap = vim.keymap

--- General ---
keymap.set('n', '<leader>so', '<cmd>noh<CR>', { desc = 'Clear Search' })
keymap.set('n', '<leader>lf', '<cmd>Format<CR>', { desc = 'Format' })

--- Diagnostics ---
keymap.set('n', 'dp', vim.diagnostic.goto_prev, { desc = 'Go to prev Diagnostic' })
keymap.set('n', 'dn', vim.diagnostic.goto_next, { desc = 'Go to next Diagnostic' })
keymap.set('n', 'dl', vim.diagnostic.open_float, { desc = 'Show Diagnostic Float' })
keymap.set('n', 'dq', vim.diagnostic.setloclist, { desc = 'Open Quickfix List' })

--- Buffers ---
keymap.set('n', '<S-Tab>', '<C-6>', { desc = 'Buffer Prev' })
keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' }) -- new file
keymap.set('i', 'jj', '<esc>', { desc = 'Escape' })

--- Movement ---
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Hl Line Up' })
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Hl Line Down' }) -- move highlighted line down
keymap.set('n', 'J', 'mzJ`z', { desc = 'Move Hl Line Down' }) -- move line to end of about line
keymap.set('n', 'j', 'gj', { desc = 'Move Hl Line Down' }) -- move line to end of about line
keymap.set('n', 'k', 'gk', { desc = 'Move Hl Line Up' }) -- move line to end of about line

--- Yank --
keymap.set({ 'n' }, 'yl', 'y$', { desc = 'Yank To End Line' }) -- yanks to end of line
keymap.set({ 'n' }, 'yaf', '<cmd> %y+ <CR>', { desc = 'Yank All Buffer' }) -- yank whole file

--- Spell ---
keymap.set('n', '<leader>sn', ']s', { desc = 'next spell error' })
keymap.set('n', '<leader>sp', '[s', { desc = 'prev spell error' })
keymap.set('n', '<leader>sa', 'zg', { desc = 'add word' })

--- Windows ---
keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
keymap.set('n', '<leader>wp', '<C-W>c', { desc = 'Window Pop' })
keymap.set('n', '<leader>w-', '<C-W>s', { desc = 'Window Split Below' })
keymap.set('n', '<leader>w/', '<C-W>v', { desc = 'Window Split Right' })
