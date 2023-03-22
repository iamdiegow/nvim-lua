local colors = require("tokyonight.colors").default

local branch = {
	"branch",
	"b:gitsigns_head",
	icons_enabled = true,
	icon = "",
	color = { gui = "bold" },
}

local filename = {
	"filename",
	path = 1,
	file_status = true,
}

local diff = {
	"diff",
	source = function()
		local gitsigns = vim.b.gitsigns_status_dict
		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end,
	symbols = {
		added = " ",
		modified = " ",
		removed = " ",
	},
	padding = { left = 1, right = 1 },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.yellow },
		removed = { fg = colors.red },
	},
	cond = nil,
}

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		opts = {
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					"Outline",
					"NvimTree",
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { filename },
				lualine_x = { diff },
				lualine_y = { branch },
				lualine_z = {},
			},
		},
	},
}
