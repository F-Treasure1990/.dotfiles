return {
  {
    {
      "MeanderingProgrammer/render-markdown.nvim",
      main = "render-markdown",
      name = "render-markdown",
      opts = {},
      dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
