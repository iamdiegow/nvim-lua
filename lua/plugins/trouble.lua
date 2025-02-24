return {
	"folke/trouble.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	cmd = { "TroubleToggle", "Trouble" },
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<CR>",
			desc = "(Trouble) Toggle Diagnostics",
		},
		{
			"<leader>xb",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "(Trouble) Toggle Buffer Diagnostics",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=false<CR>",
			desc = "(Trouble) Toggle Symbols",
		},
		{
			"<leader>xd",
			"<cmd>Trouble lsp toggle focus=false<CR>",
			desc = "(Trouble) Toggle Symbols",
		},
		{
			"<leader>xq",
			"<cmd>Trouble qflist toggle<CR>",
			desc = "(Trouble) Toggle Quickfix List",
		},
		{
			"<leader>xi",
			"<cmd>Trouble lsp_incoming_calls toggle<CR>",
			desc = "(Trouble) Toggle Lsp Incoming Calls",
		},
		{
			"<leader>xr",
			"<cmd>Trouble lsp_references toggle<CR>",
			desc = "(Trouble) Toggle Lsp References",
		},
	},
	opts = {
		auto_close = false,
		auto_open = false,
		auto_preview = true,
		auto_refresh = true,
		focus = true,
		restore = true,
		follow = true,
		indent_guides = false,
		max_items = 200,
		pinned = false,
		win = {
			type = "split",
			position = "bottom",
			size = 15,
		},
		preview = {
			type = "main",
			scratch = true,
		},
		modes = {
			symbols = {
				win = {
					position = "bottom",
				},
			},
		},
	},
}
