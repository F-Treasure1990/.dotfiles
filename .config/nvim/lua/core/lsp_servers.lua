return {
  -- ────────────────────────────────────────────
  -- ▶ General
  -- ────────────────────────────────────────────
  tailwindcss = {},
  dockerls = {},
  docker_compose_language_service = {},
  astro = {},

  -- ────────────────────────────────────────────
  -- ▶ LUA
  -- ────────────────────────────────────────────
  lua_ls = {
    -- cmd = { ... },
    -- filetypes = { ... },
    -- capabilities = {},
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  ['marksman'] = {},
  ['eslint-lsp'] = {
    settings = {
      workingDirectories = { mode = 'auto' },
    },
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        command = 'EslintFixAll',
      })
    end,
  },

  -- ────────────────────────────────────────────
  -- ▶ TYPESCRIPT
  -- ────────────────────────────────────────────
  ts_ls = {
    enabled = false,
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    settings = {
      complete_function_calls = true,
      vtsls = {
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = 'always' },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = 'literals' },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
      },
      javascript = {
        updateImportsOnFileMove = { enabled = 'always' },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = 'literals' },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
      },
    },
  },

  -- ────────────────────────────────────────────
  -- ▶ HTML
  -- ────────────────────────────────────────────
  html = {
    filetypes = { 'html', 'ejs' }, -- Add "django-html" as a recognized filetype
    settings = {
      html = {
        suggest = {
          completionItem = {
            triggerCharacters = { '{{' }, -- Example: trigger completion on "{{" in ejs templates
          },
        },
      },
    },
  },

  -- ────────────────────────────────────────────
  -- ▶ JSON
  -- ────────────────────────────────────────────
  jsonls = {
    -- lazy-load schemastore when needed
    on_new_config = function(new_config)
      new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
    end,
    settings = {
      json = {
        format = {
          enable = true,
        },
        validate = { enable = true },
      },
    },
  },
}
