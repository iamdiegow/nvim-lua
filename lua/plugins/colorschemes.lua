return {
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			style = "storm",
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
	{
		"rebelot/kanagawa.nvim",
		enabled = true,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = false },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				background = {
					dark = "wave",
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						-- Telescope overrides
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
						-- Dark completion menu
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					}
				end,
			})
		end,
	},
}
