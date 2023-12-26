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
				enabled = false,
				show_exact_scope = true,
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
