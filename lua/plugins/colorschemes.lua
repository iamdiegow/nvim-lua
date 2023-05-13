return {
	{
		"folke/tokyonight.nvim",
		enabled = false,
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
		lazy = false,
		priority = 1000,
		config = function()
			local colors = require("gruvbox.palette").colors
			require("gruvbox").setup({
				contrast = "dark",
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
		version = "v0.0.7",
		priority = 1000,
		config = function()
			require("github-theme").setup({
				transparent = true,
			})
		end,
	},
}
