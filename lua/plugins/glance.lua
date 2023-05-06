return {
	"dnlhc/glance.nvim",
	event = "LspAttach",
	keys = {
		{
			"<leader>lgd",
			"<cmd>Glance definitions<CR>",
			desc = "definitions (Glance)",
		},
		{
			"<leader>lgr",
			"<cmd>Glance references<CR>",
			desc = "references (Glance)",
		},
		{
			"<leader>lgi",
			"<cmd>Glance implementations<CR>",
			desc = "implementations (Glance)",
		},
		{
			"<leader>lgt",
			"<cmd>Glance type_definitions<CR>",
			desc = "type_definitions (Glance)",
		},
	},
	config = function()
		local glance = require("glance")
		local actions = glance.actions
		glance.setup({
			height = 20,
			zindex = 50,
			preview_win_opts = {
				cursorline = true,
				number = true,
				wrap = true,
			},
			border = {
				enable = true,
			},
			list = {
				position = "left",
				width = 0.35,
			},
			theme = {
				enable = true,
				mode = "darken",
			},
			indent_lines = {
				enable = false,
			},
			mappings = {
				list = {
					["<C-l>"] = actions.enter_win("preview"), -- Focus preview window
				},
				preview = {
					["Q"] = actions.close,
					["q"] = actions.close,
					["<C-h>"] = actions.enter_win("list"), -- Focus list window
				},
			},
		})
	end,
}
