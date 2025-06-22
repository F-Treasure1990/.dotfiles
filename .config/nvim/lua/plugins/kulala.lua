return {
  'mistweaverco/kulala.nvim',
  keys = {
    { '<leader>ko', "<cmd>lua require('kulala').scratchpad()<cr>", desc = 'Open scratchpad' },
    { '<leader>kc', "<cmd>lua require('kulala').copy()<cr>", desc = 'Copy as cURL' },
    { '<leader>kC', "<cmd>lua require('kulala').from_curl()<cr>", desc = 'Paste from curl' },
    { '<leader>ki', "<cmd>lua require('kulala').inspect()<cr>", desc = 'Inspect current request' },
    { '<leader>kl', "<cmd>lua require('kulala').jump_next()<cr>", desc = 'Jump to next request' },
    { '<leader>kh', "<cmd>lua require('kulala').jump_prev()<cr>", desc = 'Jump to previous request' },
    { '<leader>kq', "<cmd>lua require('kulala').close()<cr>", desc = 'Close window' },
    { '<leader>kr', "<cmd>lua require('kulala').replay()<cr>", desc = 'Replay the last request' },
    { '<leader>kf', "<cmd>lua require('kulala').run()<cr>", desc = 'Send the request' },
    { '<leader>ks', "<cmd>lua require('kulala').show_stats()<cr>", desc = 'Show stats' },
    { '<leader>kt', "<cmd>lua require('kulala').toggle_view()<cr>", desc = 'Toggle headers/body' },
  },
  ft = { 'http', 'rest' },
  opts = {
    global_keymaps = false,
    global_keymaps_prefix = '<leader>k',
    kulala_keymaps_prefix = '',
  },
}
