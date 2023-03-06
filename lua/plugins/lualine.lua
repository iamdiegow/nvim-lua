return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			local branch = {
				"branch",
				"b:gitsigns_head",
				icons_enabled = true,
				icon = "",
				color = { gui = "bold" },
			}

			local filename = {
				"filename",
				path = 3,
				file_status = true,
				shorting_target = 30,
				component_separators = { left = "", right = "" },
			}

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "tokyonight",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					left_padding = 0,
					right_padding = 0,
					disabled_filetypes = {
						"Outline",
						"NvimTree",
					},
					always_divide_middle = true,
					globalstatus = true,
				},
				sections = {
					lualine_a = { { "mode" } },
					lualine_b = { branch },
					lualine_c = { filename },
					lualine_x = {},
					lualine_y = {},
					lualine_z = { function()
						return " " .. os.date("%R")
					end },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = {},
			})

			vim.cmd([[ au BufEnter * :set laststatus=3 ]])
		end,
	},
}
