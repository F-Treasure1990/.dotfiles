return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    }
  },
  config = function()
    local actions = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    local tsb = require("telescope.builtin")
    local ts = require("telescope")

    require("telescope").setup {
      pickers = {
        find_files = { theme = 'ivy' },
        grep_string = { theme = 'ivy' },
        oldfiles = { theme = 'ivy' },
        spell_suggest = { theme = 'ivy' },
        live_grep = { theme = 'ivy' },
      },
      defaults = {
        preview = {
          filesize_limit = 0.1, -- MB
        },
        file_ignore_patterns = { ".git/", "node_modules/", ".DS_Store", ".obsidian/" },
        selection_caret = " ",
        prompt_prefix = " 󰀘  ",
        sorting_strategy = "ascending",
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim", -- add this value
        },
        path_display = function(_, path)
          local tail = require("telescope.utils").path_tail(path)
          local find_file_in_path = vim.fs.dirname(path)
          if find_file_in_path == "." then
            return string.format("%s", tail)
          end
          return string.format(" %s ..[ %s ]", tail, find_file_in_path)
        end,
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
            ["<C-p>"] = actions_layout.toggle_preview,
            ["<C-j>"] = function(...)
              return actions.preview_scrolling_down(...)
            end,
            ["<C-k>"] = function(...)
              return actions.preview_scrolling_up(...)
            end,
          },
        }
      }
    }

    -- Keymaps
    local set = vim.keymap.set
    set("n", "<space><space>", tsb.find_files, { desc = "Find Files" })
    set("n", "<space>fr", tsb.oldfiles, { desc = "Recent" })
    set("n", "<space>/", require("config.utils").live_multigrep, { desc = "Grep" })
    set("n", "<space>fh", tsb.help_tags, { desc = "Help Tags" })
    set("n", "<space>ss", tsb.spell_suggest, { desc = "Spell Suggest" })
    set("n", "<space>t", "<cmd>TodoTelescope <cr>", { desc = "Todo's" })

    set("n", "<space>n",
      function()
        local opts = require('telescope.themes').get_ivy({
          cwd = vim.fn.stdpath('config'),
        })
        require('telescope.builtin').find_files(opts)
      end,
      { desc = "Find Neovim Config" })

    ts.load_extension("fzf")
  end

}
