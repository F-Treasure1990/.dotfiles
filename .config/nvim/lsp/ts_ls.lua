-- return {
--   cmd = { 'typescript-language-server', '--stdio' },
--   filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
--workspace_required = true,
--   root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
--   init_options = { hostInfo = 'neovim' },
--   single_file_support = true,
--   settings = {
--     typescript = {
--       inlayHints = {
--         includeInlayParameterNameHints = 'all',
--         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = true,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--       },
--     },
--     javascript = {
--       inlayHints = {
--         includeInlayParameterNameHints = 'all',
--         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = true,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--       },
--     },
--   },
--   on_attach = function(client)
--     -- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
--     -- `vim.lsp.buf.code_action()` if specified in `context.only`.
--     vim.api.nvim_buf_create_user_command(0, 'LspTypescriptSourceAction', function()
--       local source_actions = vim.tbl_filter(function(action)
--         return vim.startswith(action, 'source.')
--       end, client.server_capabilities.codeActionProvider.codeActionKinds)
--
--       vim.lsp.buf.code_action({
--         context = {
--           only = source_actions,
--         },
--       })
--     end, {})
--   end,
-- }

-- codeActionKinds = {
--   'source.fixAll.ts',
--   'source.removeUnused.ts',
--   'source.addMissingImports.ts',
--   'source.organizeImports.ts',
--   'source.removeUnusedImports.ts',
--   'source.sortImports.ts',
--   'quickfix',
--   'refactor',
-- }

return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  workspace_required = true,
  init_options = { hostInfo = 'neovim' },
  single_file_support = true,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },

  on_attach = function(client, bufnr)
    -- Set buffer options using new API
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Helper function to create buffer-local keymaps
    local function map(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = bufnr
      opts.silent = opts.silent ~= false
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- TypeScript specific code actions

    local function ts_organize_imports()
      vim.lsp.buf.code_action({
        context = { only = { 'source.organizeImports' } },
        apply = true,
      })
    end

    local function ts_remove_unused()
      vim.lsp.buf.code_action({
        context = { only = { 'source.removeUnused' } },
        apply = true,
      })
    end

    local function ts_add_missing_imports()
      vim.lsp.buf.code_action({
        context = { only = { 'source.addMissingImports' } },
        apply = true,
      })
    end

    local function ts_fix_all()
      vim.lsp.buf.code_action({
        context = { only = { 'source.fixAll' } },
        apply = true,
      })
    end

    print(vim.inspect(client.server_capabilities.codeActionProvider))

    local function ts_source_actions()
      if client.server_capabilities.codeActionProvider then
        local source_actions = vim.tbl_filter(function(action)
          return vim.startswith(action, 'source.')
        end, client.server_capabilities.codeActionProvider.codeActionKinds or {})

        vim.lsp.buf.code_action({
          context = {
            only = source_actions,
          },
        })
      end
    end

    -- TypeScript specific keymaps
    map('n', 'gto', ts_organize_imports, { desc = 'Organize imports' })
    map('n', 'gti', ts_add_missing_imports, { desc = 'Add missing imports' })
    map('n', 'gtr', ts_remove_unused, { desc = 'Remove unused imports' })
    map('n', 'gtf', ts_fix_all, { desc = 'Fix all issues' })
    map('n', 'gta', ts_source_actions, { desc = 'TypeScript source actions' })
  end,
}
