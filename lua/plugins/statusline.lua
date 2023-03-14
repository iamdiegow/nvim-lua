local branch = {
	"branch",
	"b:gitsigns_head",
	icons_enabled = true,
	icon = "",
	color = { gui = "bold" },
}

local filename = {
	"filename",
	path = 5,
	file_status = true,
	shorting_target = 30,
	component_separators = { left = "", right = "" },
}

local colors = require("tokyonight.colors")

return {
	{
		enabled = false,
		"nvim-lualine/lualine.nvim",
		lazy = false,
		opts = {
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					"Outline",
					"NvimTree",
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch },
				lualine_c = {},
				lualine_x = {},
				lualine_y = { filename },
				lualine_z = {},
			},
		},
	},
	{
		"tamton-aquib/staline.nvim",
		event = "BufReadPre",
		opts = {
			sections = {
				left = { " ", "mode", " ", "lsp" },
				mid = { "file_name" },
				right = { "branch", " " },
			},
			mode_colors = {
				i = colors.green,
				n = colors.blue,
				c = colors.yellow,
				v = colors.orange,
				V = colors.orange,
			},
			mode_icons = {
				i = "INSERT",
				n = "NORMAL",
				c = "COMMAND",
				v = "VISUAL",
				V = "VISUAL",
			},
			defaults = {
				true_colors = true,
				full_path = true,
				branch_symbol = " ",
				mod_symbol = " ",
			},
		},
	},
}
