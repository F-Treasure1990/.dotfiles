return {
  cmd = {
    'vscode-html-language-server',
    '--stdio',
  },
  filetypes = {
    'html',
    'templ',
  },
  root_markers = {
    'package.json',
    '.git',
  },

  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { 'html', 'css', 'javascript', 'typescript' },
  },
  single_file_support = true,
  settings = {
    html = {
      suggest = {
        completionItem = {
          triggerCharacters = { '{{' }, -- Example: trigger completion on "{{" in ejs templates
        },
      },
    },
  },
}
