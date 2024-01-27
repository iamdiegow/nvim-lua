return {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		event = "BufReadPost",
		main = "ibl",
		keys = {
			{
				"<leader>ig",
				"<cmd>IBLToggle<CR>",
				{ desc = "Toggle indent line" },
			},
			{
				"<leader>ih",
				"<cmd>IBLToggleScope<CR>",
				{ desc = "Toggle indent line scope" },
			},
		},
		opts = {
			enabled = false,
			scope = {
				enabled = true,
				show_exact_scope = false,
				show_start = false,
				show_end = false,
				highlight = { "Function", "Label" },
				priority = 500,
			},
			whitespace = {
				highlight = { "Whitespace", "NonText" },
				remove_blankline_trail = true,
			},
			indent = {
				char = "┆",
			},
		},
	},
	{
		"echasnovski/mini.indentscope",
		enabled = false,
		event = "VeryLazy",
		version = "*",
		config = function()
			require("mini.indentscope").setup({
				draw = {
					delay = 1000,
				},
				--"⎟ ⎜ ⎢ ⎜ ▏ ▊ ▋ ▉ ▎ ▍ ▋ ▍ ▎╎"
				symbol = "▍",
				options = {
					border = "top",
				},
			})
		end,
	},
}
