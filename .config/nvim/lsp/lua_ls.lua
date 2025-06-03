return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
        completion = {
          keywordSnippet = 'Replace',
        },
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
        disable = { 'missing-fields' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files and plugins
        library = { vim.env.VIMRUNTIME },
        checkThirdParty = false,
      },
      hint = {
        enable = true,
        arrayIndex = 'Enable',
        await = true,
        paramName = 'All',
        paramType = true,
        semicolon = 'Disable',
        setType = true,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
