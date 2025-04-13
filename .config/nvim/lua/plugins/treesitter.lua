return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'html', 'bash', 'tsx', 'json', 'dockerfile', 'markdown' },
    sync_install = false,
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100kb
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
    },
    auto_install = true,
  },
}
