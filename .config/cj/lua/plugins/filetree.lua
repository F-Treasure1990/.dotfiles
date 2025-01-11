return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require('oil').setup({
      columns = {
        "icon",
        "size",
        -- "permissions",
        -- "mtime",
      },
      keymaps = {
        ["<Esc>"] = "actions.close",
        ["<C-h>"] = "actions.toggle_hidden",
      }

    })

    local set = vim.keymap.set
    set("n", "_", function()
      return require("oil").open(vim.fn.getcwd())
    end, { desc = "Open Oil Root" })

    set("n", "-", "<Cmd>Oil<CR>", { desc = "Open Oil" })
  end
}
