return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>gd', '<cmd>:lua Snacks.picker.git_diff()<cr>', desc = 'Diff' },
    { '<leader>gb', '<cmd>:lua Snacks.picker.git_branches()<cr>', desc = 'Branches' },
    { '<leader>go', '<cmd>:lua Snacks.picker.git_log()<cr>', desc = 'Logs' },
    { '<leader>gw', '<cmd>:lua Snacks.picker.git_log_line()<cr>', desc = 'Blame Line' },
  },
  opts = {
    signs = {
      add = { text = '|' },
      change = { text = '|' },
      delete = { text = '|' },
      topdelete = { text = '|' },
      changedelete = { text = '|' },
    },
  },
}
