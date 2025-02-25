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
		added = " ",
		modified = " ",
		removed = " ",
	},
	padding = { left = 1, right = 1 },
	cond = nil,
}

return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		-- event = "BufReadPre",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				icons_enabled = true,
				theme = vim.g.lualine_theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					"Outline",
					"NvimTree",
					"alpha",
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch },
				lualine_c = { filename },
				lualine_x = { diff },
				lualine_y = {},
				lualine_z = {},
			},
		},
	},
}
