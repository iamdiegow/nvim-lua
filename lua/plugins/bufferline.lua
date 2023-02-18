return {
	"akinsho/nvim-bufferline.lua",
	dependencies = "kyazdani42/nvim-web-devicons",
	event = "BufReadPre",
	opts = {
		options = {
			numbers = "none",
			close_command = "bdelete! %d",
			right_mouse_command = "bdelete! %d",
			left_mouse_command = "buffer %d",
			middle_mouse_command = nil,
			--"⎟ ⎜ ⎢ ⎜ ▏ ▊ ▋ ▉ ▎ ▍ ▋ ▍ ▎ "
			indicator = {
				icon = "▊",
			},
			buffer_close_icon = "",
			modified_icon = "",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 20,
			max_prefix_length = 15,
			truncate_names = true,
			tab_size = 20,
			offsets = {
				{
					filetype = "NvimTree",
					text = function()
						return vim.fn.getcwd()
					end,
					highlight = "Directory",
					text_align = "left",
					padding = 1,
				},
			},
			diagnostics = false,
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = true,
			persist_buffer_sort = true,
			separator_style = { "", "" },
			enforce_regular_tabs = true,
			always_show_bufferline = true,
			sort_by = "insert_after_current",
		},
		highlights = {
			buffer_selected = {
				bold = true,
				italic = false,
			},
		},
	},
}
