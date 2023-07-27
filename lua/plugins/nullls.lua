local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.refactoring.with {
            filetypes = { "go", "javascript", "lua", "python", "typescript" }
        },

        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.black.with { filetypes = {
            'python'
        }, args = {'--line-length', '79'} },
        null_ls.builtins.formatting.djhtml,


        null_ls.builtins.formatting.eslint_d.with { filetypes = {
            "typescript",
            "javascript",
            "typescriptreact",
            "javascriptreact"
        } },
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.ltrs,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.prettierd.with { filetypes = {
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
}
    },
})
