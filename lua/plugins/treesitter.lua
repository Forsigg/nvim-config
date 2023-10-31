require'nvim-treesitter.install'.prefer_git = true 
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
      'typescript', 'lua', 'go', 'tsx',
      'javascript', 'python', 'yaml', 'bash',
      'regex', 'html', 'json', 'make',
      'diff'
    },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
