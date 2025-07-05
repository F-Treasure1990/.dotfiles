return {
  cmd = { 'astro-ls', '--stdio' },
  filetypes = { 'astro' },
  root_dir = vim.fs.root(0, { '.git', 'package.json' }),
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  init_options = {
    typescript = {
      tsdk = '/home/fenton/.local/share/pnpm/global/5/node_modules/typescript/lib',
    },
  },
}
