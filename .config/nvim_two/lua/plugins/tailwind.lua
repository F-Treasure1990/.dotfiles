return {
  {
    'razak17/tailwind-fold.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>et', '<cmd>TailwindFoldToggle<cr>', desc = 'Toggle Tailwind Classes' },
    },
    opts = {
      enabled = false,
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade' },
  },
  { 'roobert/tailwindcss-colorizer-cmp.nvim', opts = {} },
}
