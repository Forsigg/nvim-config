local noice = require("noice")

noice.setup({
	lsp = {
		hover = {
			enabled = false
		},
		signature = {
			enabled = false,
			auto_open = {
				enabled = false
			},
		}
	},
	routes = {
		{ view = "notify", filter = { event = "msg_showmode" } },
		{
			filter = { event = "msg_show", kind = "", find = "записано" },
			opts = { skip = true },
		},

		{
			filter = { event = "cmdline", kind = "", find = ":w" },
			opts = { skip = true },
		},
	},
})
