local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ 'phaazon/hop.nvim' },
	
	{
	  'nvim-neo-tree/neo-tree.nvim',
	  branch = 'v2.x',
	  dependencies = {
		'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim', 's1n7ax/nvim-window-picker'
	  }
	},
	
	{ 'nvim-treesitter/nvim-treesitter' },
	
    { 'williamboman/mason.nvim', build = ':MasonUpdate' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },

	{ 'joshdick/onedark.vim' },
    { 'santos-gabriel-dario/darcula-solid.nvim' , dependencies = {'rktjmp/lush.nvim'}},

    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path'},
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },


    { 'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = {'nvim-lua/plenary.nvim'} },

    { 'jose-elias-alvarez/null-ls.nvim' }, 

    { 'windwp/nvim-autopairs' },

    { 'akinsho/bufferline.nvim', dependencies = {'nvim-tree/nvim-web-devicons'} },

    { 'terrortylor/nvim-comment' },

    {'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    },


    { 'lewis6991/gitsigns.nvim' },

    {'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
    },

    { "folke/which-key.nvim" },

    { 'akinsho/toggleterm.nvim', version = "*", config = true },

    {'MTDL9/vim-log-highlighting'},

    {'roobert/f-string-toggle'},

    {'yamatsum/nvim-cursorline'},

    {'rcarriga/nvim-notify'},

    {'rmagatti/auto-session'},

    {'xiyaowong/virtcolumn.nvim'},

}
})
