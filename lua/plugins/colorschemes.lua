return {
	{
		"folke/tokyonight.nvim",
		enabled = true,
		priority = 1000,
		opts = {
			transparent = true,
			style = "moon",
			terminal_colors = true,
			hide_inactive_statusline = false,
			lualine_bold = true,
			dim_inactive = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = false, bold = false },
				sidebars = "transparent",
				floats = "transparent",
			},
			on_highlights = function(hl, c)
				hl["WinSeparator"] = {
					fg = c.blue,
				}
				hl["NvimTreeWinSeparator"] = {
					fg = c.blue,
				}
				hl["ZenBorder"] = {
					fg = c.blue,
				}
				hl["BufferLineBufferSelected"] = {
					fg = c.blue,
					bold = true,
				}
				hl["BufferLineDuplicateSelected"] = {
					fg = c.blue,
					bold = true,
				}
			end,
		},
	},
}
