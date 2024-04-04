return {
	"akinsho/nvim-bufferline.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ "echasnovski/mini.bufremove", version = "*" },
	},
	event = "BufReadPre",
	opts = {
		options = {
			mode = "buffers",
			numbers = "none",
			-- close_command = "bdelete! %d",
			close_command = function(n)
				require("mini.bufremove").delete(n, false)
			end,
			right_mouse_command = "bdelete! %d",
			left_mouse_command = "buffer %d",
			middle_mouse_command = nil,
			--"⎟ ⎜ ⎢ ⎜ ▏ ▊ ▋ ▉ ▎ ▍ ▋ ▍ ▎ "
			indicator = {
				-- icon = "▍",
				style = "none",
			},
			buffer_close_icon = "  ",
			modified_icon = "  ",
			close_icon = "  ",
			left_trunc_marker = "  ",
			right_trunc_marker = "  ",
			max_name_length = 18,
			max_prefix_length = 15,
			truncate_names = true,
			tab_size = 18,
			diagnostics = false,
			diagnostics_update_in_insert = false,
			color_icons = true,
			show_buffer_icons = false,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = true,
			persist_buffer_sort = true,
			separator_style = { "", "" },
			enforce_regular_tabs = false,
			always_show_bufferline = false,
			sort_by = "insert_after_current",
		},
		highlights = {
			buffer_selected = {
				bold = true,
				italic = false,
			},
		},
	},
	keys = {
		{ "<S-l>", ":BufferLineCycleNext<CR>", desc = "Go To Next Buffer" },
		{ "<S-h>", ":BufferLineCyclePrev<CR>", desc = "Go To Prev Buffer" },
		{ "<TAB>", ":BufferLineCycleNext<CR>", desc = "Go To Next Buffer" },
		{ "<S-TAB>", ":BufferLineCyclePrev<CR>", desc = "Go To Prev Buffer" },
	},
}
