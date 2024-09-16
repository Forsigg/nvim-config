-- Sntup language servers.
local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local ih = require("inlay-hints")

lspconfig.pyright.setup({
	settings = {
		python = {
			analysis = {
				disableOrganizeImports = false,
				autoSearchPaths = true,
				autoImportCompletions = true,
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "standard",
				useLibraryCodeForTypes = true,
				extraPaths = {
					"/home/aberkhmiller/code/etlsrc/parsers/basev2/sdk",
					"/home/aberkhmiller/code/etlsrc/airflow/src",
					"/home/aberkhmiller/code/etlsrc/expert_filters/basev2/expert_api",
					"/home/aberkhmiller/code/etlsrc/xporters/ptkb/base/ptkb_xporters_sdk",
					"/home/aberkhmiller/code/etlsrc/crawlers/base/app",
				},
			},
		},
	},
})

-- Clojure LSP
lspconfig.clojure_lsp.setup({})

lspconfig.gdscript.setup({})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = { globals = { "vim", "require" } },
			-- Make the server aware of Neovim runtime files
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
		},
	},
})
lspconfig.tsserver.setup({})
lspconfig.prismals.setup({})
-- lspconfig.spectral.setup {}
lspconfig.gopls.setup({
	on_attach = function(c, b)
		ih.on_attach(c, b)
	end,
	settings = {
		gopls = {
			analyses = { unusedparams = true },
			staticcheck = true,
			gofumpt = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})

if not configs.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = {
					"golangci-lint",
					"run",
					"--out-format",
					"json",
					"--issues-exit-code=1"
				};
			}
		};
	}
end

lspconfig.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}

lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			check = { command = "clippy" },
			diagnostics = {
				enable = true, experimental = {
					enable = true
				}
			},
		},
	},
})
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
		vim.keymap.set({ "n", "v" }, "<Leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
