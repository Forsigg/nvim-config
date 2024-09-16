local cspell = require('cspell')
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	log_level = "info",
	sources = {
		cspell.diagnostics,
		cspell.code_actions,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.code_actions.refactoring.with({
			filetypes = { "go", "javascript", "lua", "python", "typescript" },
		}), -- JSON
		-- null_ls.builtins.formatting.dprint.with {
		--     filetypes = {"json", "markdown", "toml"}
		-- },
		-- Python
		null_ls.builtins.diagnostics.flake8.with({ prefer_local = ".venv/bin" }),
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.black.with({
			filetypes = { "python" },
			args = { "--line-length", "120" },
		}),
		null_ls.builtins.formatting.djhtml, -- Golang
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.golines,

		-- Clojure
		null_ls.builtins.formatting.cljstyle,

		null_ls.builtins.formatting.eslint_d.with({
			filetypes = {
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
			},
		}),
		null_ls.builtins.formatting.lua_format,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.ltrs.with({ filetypes = { "markdown" } }),
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
			},
		}),
	},
})

null_ls.register({
	name = "My code actions",
	method = null_ls.methods.CODE_ACTION,
	filetypes = { "python" },
	generator = {
		fn = function(params)
			local out = {}

			table.insert(out,
				{
					title = 'Sort imports (isort)',
					action = function()
						-- vim.g.isort_vim_options = '-- multi-line 3 --trailing-comma --use-parentheses --ensure-newline-before-comments --line-length 120'
						--vim.g.isort_vim_options = '--multi-line 3 --trailing-comma --line-length 120'
						--vim.g.isort_vim_options = '--profile black'
						vim.cmd ":Isort"
					end
				}
			)
			return out
		end,
	},
})
