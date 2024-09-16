local envs = require("core.envs")

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

	{ "nvim-lua/plenary.nvim" }, -- File view like IDE
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"s1n7ax/nvim-window-picker",
		},
	}, -- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim", -- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	}, -- Highlight syntax for neovim
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = { highlight = { enable = true } },
	},                                      -- LSP manager
	{ "williamboman/mason.nvim",          build = ":MasonUpdate" },
	{ "williamboman/mason-lspconfig.nvim" }, -- LSP plugin
	{ "neovim/nvim-lspconfig" },
	{ "simrat39/rust-tools.nvim" },         -- Theme Dark
	{ "joshdick/onedark.vim" },             -- Theme Darcula like Pycharm
	{
		"santos-gabriel-dario/darcula-solid.nvim",
		dependencies = { "rktjmp/lush.nvim" },
	}, -- CMP plugins
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/cmp-cmdline" },

	{ "saadparwaiz1/cmp_luasnip" }, -- Plugin for find files and words
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		config = function()
			require("telescope").load_extension("smart_open")
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			-- Only required if using match_algorithm fzf
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
	},

	-- LSP like
	{ "jose-elias-alvarez/null-ls.nvim" }, -- Autopair brackets
	{ "windwp/nvim-autopairs" },          -- Buffer files
	{ "akinsho/bufferline.nvim",        dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- Plugin for commenting lines
	{ "terrortylor/nvim-comment" }, -- Startup dashboard
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	}, -- Git blame plugin
	{ "lewis6991/gitsigns.nvim" },
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({})
		end,
	}, -- ??? LUA
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/lsp-progress.nvim",
		},
	},                         -- Hints for key mapping
	{ "folke/which-key.nvim" }, -- Interactive terminal
	{ "akinsho/toggleterm.nvim",             version = "*", config = true },

	-- Highlighting logs
	{ "MTDL9/vim-log-highlighting" }, -- F string format python
	{ "roobert/f-string-toggle" },   -- Highlighting words under cursor
	{ "yamatsum/nvim-cursorline" },  -- Notifications
	{ "rcarriga/nvim-notify" },      -- Line length column
	{ "xiyaowong/virtcolumn.nvim" }, -- Notify func signatutes
	{ "folke/neodev.nvim",                   config = true, lazy = true },
	{ "nvie/vim-flake8" },

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl",  opts = {} },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { highlight = { comments_only = false } },
	},
	{ "elentok/format-on-save.nvim" }, -- Debugger UI
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	}, -- DAP Python
	{ "mfussenegger/nvim-dap-python" },
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	}, -- Color git conflicts
	{ "akinsho/git-conflict.nvim", version = "*",               config = true },

	-- Snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{ "onsails/lspkind.nvim" },
	{ "kkoomen/vim-doge",          run = ":call doge#install()" }, -- Docs generator
	{ "mistricky/codesnap.nvim",   build = "make" },     -- Code screenshot
	{ "simrat39/inlay-hints.nvim" },                     -- inline hints golang
	{ "mg979/vim-visual-multi" },                        -- Multi Cursor inserting
	{ "habamax/vim-godot" },                             -- GDScript support
	{
		"Exafunction/codeium.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" },
		config = function()
			require("codeium").setup({ enable_chat = true })
		end,
	},
	{
		"brentyi/isort.vim",
		config = function()
			vim.g.isort_vim_options = "--settings-path /home/aberkhmiller/.config/nvim/.isort.cfg"
		end,
	}, -- Gitlab Features
	{
		"harrisoncramer/gitlab.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"stevearc/dressing.nvim",   -- Recommended but not required. Better UI for pickers.
			"nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
		},
		enabled = true,
		build = function()
			require("gitlab.server").build(true)
		end, -- Builds the Go binary
	},   -- Neogit
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",      -- required
			"sindrets/diffview.nvim",     -- optional - Diff integration
			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua",           -- optional
		},
		config = true,
	}, -- Golang Implements helper
	{
		"edolphin-ydf/goimpl.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("telescope").load_extension("goimpl")
		end,
	}, -- Golang tests generate
	{
		"yanskun/gotests.nvim",
		ft = "go",
		config = function()
			require("gotests").setup()
		end,
	},
	{ "xiyaowong/transparent.nvim" }, -- Markdown Preview

	-- Makefile plugin
	{
		"iamcco/markdown-preview.nvim",
		cmd = {
			"MarkdownPreviewToggle",
			"MarkdownPreview",
			"MarkdownPreviewStop",
		},
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_theme = 'light'
		end,
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"Zeioth/makeit.nvim",
		cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
		dependencies = { "stevearc/overseer.nvim" },
		opts = {},
	},
	{
		"stevearc/overseer.nvim",
		commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
		cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},
		},
	},

	-- For parentheses in LISP
	{ 'gpanders/nvim-parinfer' },

	-- Spellchecking
	{ 'davidmh/cspell.nvim' },

	-- REPL for Clojure
	{
		'Olical/conjure',
		init = function()
		end,
		dependencies = {"PaterJason/cmp-conjure"}
	},
	{
		"PaterJason/cmp-conjure",
		config = function()
			local cmp = require("cmp")
			local config = cmp.get_config()
			table.insert(config.sources, {name = "conjure"})
			return cmp.setup(config)
		end
	}
	-- My custom plugins
	-- { 'forsigg/daily-symbols-count.nvim' },
})
