return {
	"folke/lazy.nvim",

	-- Colorschemes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			styles = {
				comments = { italic = false },
				keywords = { italic = false, bold = false },
				sidebars = "normal",
				floats = "normal",
			},
			on_highlights = function(hl, c)
				hl.CursorLineNr = { fg = c.orange, bold = false }
				hl.LineNr = { fg = c.orange, bold = true }
				hl.LineNrAbove = { fg = c.fg_gutter }
				hl.LineNrBelow = { fg = c.fg_gutter }
			end,
		},
	},

	-- Workflow
	{
		"famiu/bufdelete.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>c",
				"<cmd>Bwipeout<CR>",
				desc = "Close Buffer",
			},
		},
	},

	"tpope/vim-surround",

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
				width = 80,
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
