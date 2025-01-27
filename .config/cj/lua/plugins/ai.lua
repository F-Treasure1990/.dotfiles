return {
  "Exafunction/codeium.vim",
  event = { "BufReadPre", "BufNewFile" },
  --commit = "289eb724e5d6fab2263e94a1ad6e54afebefafb2",
  config = function()
    vim.g.codeium_disable_bindings = 1 -- disable original keybindings
    vim.g.codeium_idle_delay = 250
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set("i", "<C-l>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true, desc = " Codeium Accept Selection" })
    vim.keymap.set("i", "<C-k>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true, desc = " Codeium Cycle Completions" })
    vim.keymap.set("i", "<C-j>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, silent = true, desc = "Codeium Cycle Completions " })
    vim.keymap.set("i", "<C-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true, desc = " Codeium Accept Selection" })
  end,
}
