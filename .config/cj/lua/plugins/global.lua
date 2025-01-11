return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = true,
    event = function()
      if vim.fn.exists("$TMUX") == 1 then
        return "VeryLazy"
      end
    end,
  }
}
