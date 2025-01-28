return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = true,
    event = function()
      if vim.fn.exists("$TMUX") == 1 then
        return "VeryLazy"
      end
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "undotree" },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        filetypes = {
          "css",
          "scss",
          "sass",
          "lua",
          "javascript",
          "typescript",
          "typescriptreact",
          "javascriptreact",
          "html",
        },
        user_default_options = {
          css = true,
          names = true,
          mode = "virtualtext",
          tailwind = true,
          virtualtext = "■", -- 
          always_update = true,
          hsl_fn = true,
          rgb_fn = true,
          css_fn = true,
          AARRGGBB = true,
        },
      })
    end,
  }
}
