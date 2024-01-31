vim.g.mapleader = " "

-- Neotree
vim.keymap.set('n', '<leader>e', ':Neotree float focus<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')

-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- Other
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>X', ':BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Tabs
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')

-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>')
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>')
vim.keymap.set('n', '<leader>mu', ':TermExec cmd="make up" direction=float<CR>')
vim.keymap.set('n', '<leader>md', ':TermExec cmd="make down" direction=float<CR>')
vim.keymap.set('n', '<leader>mp', ':TermExec cmd="make prune" direction=float<CR>')
vim.keymap.set('n', '<leader>mba', ':TermExec cmd="make build/airflow" direction=float<CR>')
vim.keymap.set('n', '<leader>mbp', ':TermExec cmd="make build/parsers/base" direction=float<CR>')
vim.keymap.set('n', '<leader>mbj', ':TermExec cmd="make build/joiners" direction=float<CR>')
vim.keymap.set('n', '<leader>mbo', ':TermExec cmd="make build/operators" direction=float<CR>')
vim.keymap.set('n', '<leader>mbx', ':TermExec cmd="make build/xporters/couch" direction=float<CR>')
vim.keymap.set('n', '<leader>mbc', ':TermExec cmd="make build/crawlers" direction=float<CR>')
vim.keymap.set('n', '<leader>mbe', ':TermExec cmd="make build/expert_filters" direction=float<CR>')
vim.keymap.set('n', '<leader>mbt', ':TermExec cmd="make build/tests" direction=float<CR>')
-- vim.keymap.set('n', '<leader>gl', ':TermExec cmd="lazygit" direction=float<CR>')


-- Docker
vim.keymap.set('n', '<leader>dil', ':! docker image ls<CR>')
vim.keymap.set('n', '<leader>dbb', ':TermExec cmd="docker build ." direction=float<CR>')
vim.keymap.set('n', '<leader>dp', ':! docker ps<CR>')

-- Refactoring

vim.keymap.set("x", "<leader>lxf", ":Refactor extract ")
-- vim.keymap.set("x", "<leader>lm", ":Refactor extract_to_file ")
vim.keymap.set("n", "<leader>lxb", ":Refactor extract_block")
vim.keymap.set("x", "<leader>lxv", ":Refactor extract_var ")
-- vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
-- vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")
-- vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
