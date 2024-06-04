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
    -- { 'phaazon/hop.nvim' },


    { "nvim-lua/plenary.nvim" },
    -- File view like IDE
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        dependencies = {
            'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim', 's1n7ax/nvim-window-picker'
        }
    },

    -- Highlight syntax for neovim
    { 'nvim-treesitter/nvim-treesitter' },

    -- LSP manager
    { 'williamboman/mason.nvim',                  build = ':MasonUpdate' },
    { 'williamboman/mason-lspconfig.nvim' },
    -- LSP plugin
    { 'neovim/nvim-lspconfig' },

    -- Theme Dark
    { 'joshdick/onedark.vim' },
    -- Theme Darcula like Pycharm
    { 'santos-gabriel-dario/darcula-solid.nvim',  dependencies = { 'rktjmp/lush.nvim' } },

    -- CMP plugins
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },

    { 'saadparwaiz1/cmp_luasnip' },
    -- { 'hrsh7th/vim-vsnip' },
    -- { 'hrsh7th/vim-vsnip-integ' },

    -- Plugin for find files and words
    { 'nvim-telescope/telescope.nvim',            tag = '0.1.2',                                 dependencies = { 'nvim-lua/plenary.nvim' } },

    -- LSP like
    { 'jose-elias-alvarez/null-ls.nvim' },

    -- Autopair brackets
    { 'windwp/nvim-autopairs' },

    -- Buffer files
    { 'akinsho/bufferline.nvim',                  dependencies = { 'nvim-tree/nvim-web-devicons' } },

    -- Plugin for commenting lines
    { 'terrortylor/nvim-comment' },

    -- Startup dashboard
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },


    -- Git blame plugin
    { 'lewis6991/gitsigns.nvim' },

    -- ??? LUA
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
        }
    },

    { "folke/which-key.nvim" },

    -- Interactive terminal
    { 'akinsho/toggleterm.nvim',              version = "*",                                                      config = true },

    -- Highlighting logs
    { 'MTDL9/vim-log-highlighting' },

    -- F string format python
    { 'roobert/f-string-toggle' },

    -- Highlighting words under cursor
    { 'yamatsum/nvim-cursorline' },

    -- Notifications
    { 'rcarriga/nvim-notify' },

    -- Line length column
    { 'xiyaowong/virtcolumn.nvim' },

    -- Notify func signatutes
    { "folke/neodev.nvim",                    config = true,                                                      lazy = true },

    { 'nvie/vim-flake8' },

    { "lukas-reineke/indent-blankline.nvim",  main = "ibl",                                                       opts = {} },

    { "folke/todo-comments.nvim",             dependencies = { "nvim-lua/plenary.nvim" },                         opts = { highlight = { comments_only = false } } },

    { "elentok/format-on-save.nvim" },

    -- Debugger
    { 'rcarriga/nvim-dap-ui',                 dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' } },

    -- DAP Python
    { 'mfussenegger/nvim-dap-python' },

    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
    },

    -- Color git conflicts
    { 'akinsho/git-conflict.nvim', version = '*',               config = true },

    -- Snippet engine
    {
        'L3MON4D3/LuaSnip',
        version = 'v2',
        build = 'make install_jsregexp',
        dependencies = {
            'rafamadriz/friendly-snippets'
        }
    },

    { 'onsails/lspkind.nvim' },

    -- Docs generator
    { 'kkoomen/vim-doge',          run = ':call doge#install()' },

    -- Code screenshot
    { 'mistricky/codesnap.nvim',   build = 'make' },

    -- inline hints golang
    { 'simrat39/inlay-hints.nvim' },

    -- Multi Cursor inserting
    { 'mg979/vim-visual-multi' },

    -- GDScript support
    { 'habamax/vim-godot' },

    -- Tabnine AI
    { 'codota/tabnine-nvim',       build = './dl_binaries.sh' },

    -- Codeium AI
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
                enable_chat = true,
            })
        end,
    },

    -- Tabnine support for cmp
    -- { 'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp' },

    -- My custom plugins
    -- { 'forsigg/daily-symbols-count.nvim' },
})
