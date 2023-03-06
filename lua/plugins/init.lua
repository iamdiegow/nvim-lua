return {
	"folke/lazy.nvim",
	-- Workflow
	{
		"famiu/bufdelete.nvim",
		keys = {
			{
				"<leader>c",
				"<cmd>Bwipeout<CR>",
				desc = "Close Buffer",
			},
		},
	},

	{
		"tpope/vim-surround",
		lazy = false,
	},
	-- UI
	{
		"luukvbaal/stabilize.nvim",
		event = "VeryLazy",
		config = function()
			require("stabilize").setup({
				force = true,
				forcemark = nil,
				ignore = {
					filetype = { "help", "list", "NvimTree" },
					buftype = { "terminal", "quickfix", "loclist" },
				},
				nested = nil,
			})
		end,
	},
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		keys = {
			{
				"<leader>z",
				"<cmd>ZenMode<CR>",
				desc = "Toggle Zen Mode",
			},
		},
		opts = {
			window = {
				backdrop = 1,
				width = 100,
				height = 1,
				options = {
					number = false,
					relativenumber = false,
					cursorline = true,
				},
			},
			plugins = {
				twilight = { enabled = false },
			},
		},
	},
	"folke/twilight.nvim",
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = { "*", "!lazy" },
			buftype = { "*", "!prompt", "!nofile" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = true,
				AARRGGBB = false,
				rgb_fn = true,
				hsl_fn = true,
				css = false,
				css_fn = true,
				mode = "background",
				virtualtext = "■",
			},
		},
	},
}
