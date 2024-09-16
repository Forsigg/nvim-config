local wk = require("which-key")

wk.add(
  {
		-- C
    { "<leader>c", group = "Comment" },
    { "<leader>cl", desc = "Comment Line" },

		-- D
    { "<leader>d", desc = "Docs generate" },

		-- F
    { "<leader>e", desc = "File Manager" },
    { "<leader>f", group = "Find" },
    { "<leader>fb", desc = "Find Buffer" },
    { "<leader>ff", desc = "Find File" },
    { "<leader>fh", desc = "Find Help" },
    { "<leader>fw", desc = "Find Text" },

		-- G
    { "<leader>g", group = "Git" },
    { "<leader>gb", desc = "Branches" },
    { "<leader>gc", desc = "Commits" },
    { "<leader>gl", group = "Gitlab" },

		-- G + L
    { "<leader>glA", desc = "Approve" },
    { "<leader>glC", desc = "Create comment suggestion" },
    { "<leader>glD", desc = "Toggle draft mode" },
    { "<leader>glM", desc = "Merge" },
    { "<leader>glO", desc = "Create Merge Request" },
    { "<leader>glP", desc = "Publish all drafts" },
    { "<leader>glR", desc = "Revoke" },
    { "<leader>gla", group = "Actions with assignee" },
    { "<leader>glaa", desc = "Add assignee" },
    { "<leader>glad", desc = "Delete assignee" },
    { "<leader>glb", desc = "Choose merge request" },
    { "<leader>glc", desc = "Create comment" },
    { "<leader>gld", desc = "Toggle discussion" },
    { "<leader>gll", group = "Actions with label" },
    { "<leader>glla", desc = "Add label" },
    { "<leader>glld", desc = "Delete label" },
    { "<leader>glm", desc = "Move to discission tree from diagnostic" },
    { "<leader>gln", desc = "Create note" },
    { "<leader>glo", desc = "Open in browser" },
    { "<leader>glp", desc = "Pipeline" },
    { "<leader>glr", group = "Actions with reviewer" },
    { "<leader>glra", desc = "Add reviewer" },
    { "<leader>glrd", desc = "Delete reviewer" },
    { "<leader>glrs", desc = "Start review" },
    { "<leader>gls", desc = "Summary" },
    { "<leader>glu", desc = "Copy MR URL" },

    { "<leader>gn", desc = "Neogit" },

		-- G + O
    { "<leader>go", group = "Golang" },
    { "<leader>got", group = "Generate tests" },
    { "<leader>gota", desc = "Generate tests for all funcs in file" },
    { "<leader>gotf", desc = "Generate test for func" },

    { "<leader>gs", desc = "Status" },

		-- H
    { "<leader>h", desc = "No highlight" },

		-- L
    { "<leader>l", group = "LSP" },
    { "<leader>lD", desc = "Hover diagnostic" },
    { "<leader>la", desc = "Action" },
    { "<leader>ld", desc = "Diagnostic" },
    { "<leader>lf", desc = "Format" },
    { "<leader>lr", desc = "Rename" },
    { "<leader>ls", desc = "Symbol" },
    { "<leader>lx", group = "Extract" },
    { "<leader>lxb", desc = "Extract Block to func" },
    { "<leader>lxf", desc = "Extract visual code to func" },
    { "<leader>lxv", desc = "Extract Var" },

		-- O
    { "<leader>o", desc = "Git status" },

		-- T
    { "<leader>t", group = "Terminal" },
    { "<leader>tf", desc = "Float terminal" },
    { "<leader>th", desc = "Horizontal terminal" },
    { "<leader>tt", desc = "Transparent toggle" },

		-- M
		{ "<leader>m", group = "Makefile Plugin"},
		{ '<leader>mo', desc = 'Open Makefile window'},
		{'<leader>mt', desc = 'Toggle Makefile results'},
		{'<leader>ms', desc = 'Stop Makefile'},
		{'<leader>mr', desc = 'Makefile redo'},

		-- W
    { "<leader>w", desc = "Save" },

		-- X
    { "<leader>x", desc = "Close Buffer" },
  }
)
