return {
	{
		"folke/tokyonight.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			style = "storm",
			styles = {
				comments = { italic = true },
				keywords = { italic = false, bold = true },
				sidebars = "dark",
				floats = "normal",
			},
			sidebars = {
				"NvimTree",
				"terminal",
				"qf",
				"telescope",
				"lazy"
			},
			dim_inactive = false,
			hide_inactive_statusline = true,
			lualine_bold = true
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
					Pmenu = { bg = colors.dark0_hard  },
					SignColumn = { bg = colors.dark0_hard},
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
}
