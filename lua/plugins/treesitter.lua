require 'nvim-treesitter.install'.prefer_git = true
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'c', 'lua', 'vim', 'vimdoc', 'query',
    'typescript', 'go', 'tsx',
    'javascript', 'python', 'yaml', 'bash',
    'regex', 'html', 'json', 'make',
    'diff', 'rust'
  },

  sync_install = false,
  auto_install = true,
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
  },
}
