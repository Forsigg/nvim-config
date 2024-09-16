local gitlab = require("gitlab")
local gitlab_server = require("gitlab.server")

local opts = {silent=true}

vim.g.mapleader = " "
vim.g.maplocalleader = ','

-- Neotree
vim.keymap.set("n", "<leader>e", ":Neotree float focus reveal<CR>", opts)
vim.keymap.set("n", "<leader>o", ":Neotree float git_status<CR>", opts)

-- Navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", opts)
vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>", opts)

-- Splits
vim.keymap.set("n", "|", ":vsplit<CR>", opts)
vim.keymap.set("n", "\\", ":split<CR>", opts)

-- Other
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>", opts)
vim.keymap.set("n", "<leader>X", ":BufferLineCloseRight<CR>", opts)
vim.keymap.set("n", "<leader>s", ":BufferLineSortByTabs<CR>", opts)
vim.keymap.set("i", "jj", "<Esc>", opts)
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", opts)
vim.keymap.set("n", "<leader>tt", ":TransparentToggle<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Terminal
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>", opts)
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", opts)
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=40<CR>", opts)

-- Debugger
vim.keymap.set("n", "<leader>dt", ':lua require("dapui").toggle()<CR>', opts)
vim.keymap.set("n", "<leader>db", ':lua require("dap").toggle_breakpoint()<CR>', opts)

-- Golang mappings
vim.keymap.set("n", "<leader>im", function()
	require("telescope").extensions.goimpl.goimpl({})
end)
vim.keymap.set("n", "<leader>gotf", ":GoTests<CR>")
vim.keymap.set("v", "<leader>gotf", ":GoTests<CR>")
vim.keymap.set("n", "<leader>gota", ":GoTestsAll<CR>")

-- Refactoring
vim.keymap.set("x", "<leader>lxf", ":Refactor extract ")
-- vim.keymap.set("x", "<leader>lm", ":Refactor extract_to_file ")
vim.keymap.set("n", "<leader>lxb", ":Refactor extract_block")
vim.keymap.set("x", "<leader>lxv", ":Refactor extract_var ")
-- vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
-- vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")
-- vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- Docs generate
-- Generate comment for current line
vim.keymap.set("n", "<Leader>d", "<Plug>(doge-generate)")

-- Git
vim.keymap.set("n", "<leader>gn", ":Neogit<CR>", opts)

-- Gitlab
vim.keymap.set("n", "glb", gitlab.choose_merge_request)
vim.keymap.set("n", "glrs", gitlab.review)
vim.keymap.set("n", "gls", gitlab.summary)
vim.keymap.set("n", "glA", gitlab.approve)
vim.keymap.set("n", "glR", gitlab.revoke)
vim.keymap.set("n", "glc", gitlab.create_comment)
vim.keymap.set("v", "glc", gitlab.create_multiline_comment)
vim.keymap.set("v", "glC", gitlab.create_comment_suggestion)
vim.keymap.set("n", "glO", gitlab.create_mr)
vim.keymap.set("n", "glm", gitlab.move_to_discussion_tree_from_diagnostic)
vim.keymap.set("n", "gln", gitlab.create_note)
vim.keymap.set("n", "gld", gitlab.toggle_discussions)
vim.keymap.set("n", "glaa", gitlab.add_assignee)
vim.keymap.set("n", "glad", gitlab.delete_assignee)
vim.keymap.set("n", "glla", gitlab.add_label)
vim.keymap.set("n", "glld", gitlab.delete_label)
vim.keymap.set("n", "glra", gitlab.add_reviewer)
vim.keymap.set("n", "glrd", gitlab.delete_reviewer)
vim.keymap.set("n", "glp", gitlab.pipeline)
vim.keymap.set("n", "glo", gitlab.open_in_browser)
vim.keymap.set("n", "glM", gitlab.merge)
vim.keymap.set("n", "glu", gitlab.copy_mr_url)
vim.keymap.set("n", "glP", gitlab.publish_all_drafts)
vim.keymap.set("n", "glD", gitlab.toggle_draft_mode)

-- Makefile
vim.keymap.set("n", "<leader>mo", ":MakeitOpen<CR>", opts)
vim.keymap.set("n", "<leader>mt", ":MakeitToggleResults<CR>", opts)
vim.keymap.set("n", "<leader>ms", ":MakeitStop<CR>", opts)
vim.keymap.set("n", "<leader>mr", ":MakeitRedo<CR>", opts)

-- Interactive mode comment todo-jumping
-- vim.keymap.set('n', '<TAB>', '<Plug>(doge-comment-jump-forward)')
-- vim.keymap.set('n', '<S-TAB>', '<Plug>(doge-comment-jump-backward)')
-- vim.keymap.set('i', '<TAB>', '<Plug>(doge-comment-jump-forward)')
-- vim.keymap.set('i', '<S-TAB>', '<Plug>(doge-comment-jump-backward)')
-- vim.keymap.set('x', '<TAB>', '<Plug>(doge-comment-jump-forward)')
-- vim.keymap.set('x', '<S-TAB>', '<Plug>(doge-comment-jump-backward)')
