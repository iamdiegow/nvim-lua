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

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
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
}
