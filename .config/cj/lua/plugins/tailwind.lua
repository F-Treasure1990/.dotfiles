return {
  {
    "razak17/tailwind-fold.nvim",
    event = "BufReadPre",
    keys = {
      { "<leader>lt", "<cmd>TailwindFoldToggle<cr>", desc = "Tailwind Hide" },
    },
    opts = {
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade", "tsx" },
  },
}
