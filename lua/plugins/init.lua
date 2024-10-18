return {
	"folke/lazy.nvim",
	-- Workflow
	{
		"famiu/bufdelete.nvim",
		enabled = false,
		keys = {
			{
				"<leader>c",
				"<cmd>Bwipeout<CR>",
				desc = "Close Buffer",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	-- UI
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
				width = 0.95,
				height = 0.95,
				options = {
					signcolumn = "yes",
					number = true,
					relativenumber = true,
					cursorline = true,
					cursorcolumn = false,
				},
			},
			plugins = {
				twilight = { enabled = false },
				gitsigns = { enabled = true },
			},
		},
	},
	{
		"folke/twilight.nvim",
		cmd = "Twilight",
	},
	{
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		keys = {
			{
				"<leader>=c",
				"<cmd>:ColorizerToggle<CR>",
				desc = "Colorizer Toggle",
			},
		},
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
	{
		"arnamak/stay-centered.nvim",
		event = "VeryLazy",
		config = function()
			require("stay-centered")
		end,
	},
	{
		"echasnovski/mini.bufremove",
		event = "VeryLazy",
		version = "*",
		keys = {
			{
				"<leader>q",
				function()
					require("mini.bufremove").wipeout(0, false)
				end,
				desc = "Close Buffer",
			},
			{
				"<leader>c",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Close Buffer",
			},
		},
		config = function()
			require("mini.bufremove").setup()
		end,
	},
	{
		"szw/vim-maximizer",
		pin = true,
		keys = {
			{
				"<leader>bm",
				"<cmd>MaximizerToggle<CR>",
				desc = "Maximize/minimize split",
			},
		},
	},
}
