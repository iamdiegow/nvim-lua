return {
	{
		"folke/tokyonight.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			style = "night",
			styles = {
				comments = { italic = true },
				keywords = { italic = false, bold = false },
				sidebars = "normal",
				floats = "normal",
			},
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		priority = 1000,
		config = function()
			local colors = require("gruvbox.palette").colors
			require("gruvbox").setup({
				transparent_mode = true,
				contrast = "hard",
				italic = {
					strings = false,
					folds = false,
				},
				overrides = {
					Pmenu = { bg = colors.dark0_hard },
					SignColumn = { bg = colors.dark0_hard },
					GitSignsAdd = { bg = colors.dark0_hard, fg = colors.bright_green },
					GitSignsChange = { bg = colors.dark0_hard, fg = colors.bright_aqua },
					GitSignsDelete = { bg = colors.dark0_hard, fg = colors.bright_red },
					DiagnosticSignWarn = { bg = colors.dark0_hard, fg = colors.bright_yellow },
					DiagnosticSignInfo = { bg = colors.dark0_hard, fg = colors.bright_blue },
					DiagnosticSignHint = { bg = colors.dark0_hard, fg = colors.bright_aqua },
					DiagnosticSignError = { bg = colors.dark0_hard, fg = colors.bright_red },
				},
			})
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		enabled = false,
		priority = 1000,
		opts = {
			options = {
				transparency = true,
				cursorline = true,
			},
			styles = {
				comments = "italic",
			},
			highlights = {
				CursorColumn = { link = "CursorLine" },
			},
		},
	},
	{
		"projekt0n/github-nvim-theme",
		enabled = false,
		version = "v1.0.0",
		priority = 1000,
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
					hide_end_of_buffer = true,
				},
			})
		end,
	},
}
