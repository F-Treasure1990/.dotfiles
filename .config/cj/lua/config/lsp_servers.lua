-- These are just settings
local M = {}

M.lua_ls = {
  Lua = {
    completion = {
      callSnippet = "Replace",
    },
    runtime = {
      version = "LuaJIT",
    },
    diagnostics = {
      globals = { "vim" },
      disable = {
        "missing-fields",
        "incomplete-signature-doc",
      },
    },
  },
  workspace = {
    -- make language server aware of runtime files
    library = vim.api.nvim_get_runtime_file("", true),
    checkThirdParty = false,
  },
  format = {
    enable = false,
  },
}

M.ts_ls = {}

return M
