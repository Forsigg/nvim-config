local cmp = require 'cmp'
local luasnip = require 'luasnip'


local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    }, 
    formatting = {
        format = function(_, vim_item)
            vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
            return vim_item
        end,
    },
    -- formatting = {
    --     format = function(entry, vim_item)
    --         if vim.tbl_contains({ 'path' }, entry.source.name) then
    --             local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
    --             if icon then
    --                 vim_item.kind = icon
    --                 vim_item.kind_hl_group = hl_group
    --                 return vim_item
    --             end
    --         end
    --         return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
    --     end
    -- },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = {
        
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    cmp.confirm({ select = false })

                    -- If menu not hide after confirm
                    if cmp.visible() then
                        fallback()
                    end
                end
            else
                fallback()
            end
        end, { 'i' }),
    },
    -- mapping = {
    --     ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i'}),
    --     ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i'}),
    --     ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i'}),
    --     ['<C-e>'] = cmp.mapping(cmp.mapping.abort(), {'i'}),
    --     ['<CR>'] = cmp.mapping(cmp.mapping.confirm({select = true}), {'i'}),
    --     ["<Tab>"] = cmp.mapping(function(fallback) if cmp.visible() then
    --             cmp.select_next_item()
    --         else
    --             fallback()
    --         end
    --     end, {"i", "s"}),
    --     ["<S-Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --             cmp.select_prev_item()
    --         else
    --             fallback()
    --         end
    --     end, {"i", "s"})
    -- },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip ' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' }
    }
    -- sources = cmp.config.sources({
    --     { name = 'luasnip' },
    --     {name = 'nvim_lsp'}, {name = 'vsnip'} -- For vsnip users.
    -- }, {{name = 'buffer'}, {name = 'nvim_lsp_signature_help'}})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
    }, {{name = 'buffer'}})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = 'buffer'}}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['tsserver'].setup {capabilities = capabilities}
