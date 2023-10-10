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
		},
		opts = {
			enabled = false,
			indent = {
				highlight = { "Function", "Label" },
			},
			scope = {
				enabled = false,
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
