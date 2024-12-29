return {
	"akinsho/nvim-bufferline.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ "echasnovski/mini.bufremove", version = "*" },
	},
	event = "VeryLazy",
	-- event = "BufReadPre",
	opts = {
		options = {
			mode = "buffers",
			numbers = "none",
			themable = true,
			-- close_command = "bdelete! %d",
			close_command = function(n)
				require("mini.bufremove").delete(n, false)
			end,
			offsets = {
				{

					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "left",
					separator = true,
				},
			},
			right_mouse_command = "bdelete! %d",
			left_mouse_command = "buffer %d",
			middle_mouse_command = nil,
			buffer_close_icon = "  ",
			modified_icon = "  ",
			close_icon = "  ",
			left_trunc_marker = "  ",
			right_trunc_marker = "  ",
			max_name_length = 18,
			max_prefix_length = 15,
			truncate_names = true,
			tab_size = 20,
			diagnostics = false,
			diagnostics_update_in_insert = false,
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = true,
			persist_buffer_sort = true,
			separator_style = { "", "" },
			enforce_regular_tabs = true,
			always_show_bufferline = true,
			-- sort_by = "insert_after_current",
			-- sort by modified date
			sort_by = function(buffer_a, buffer_b)
				local modified_a = vim.fn.getftime(buffer_a.path)
				local modified_b = vim.fn.getftime(buffer_b.path)
				return modified_a > modified_b
			end,
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
		{ "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Pick and close" },
		{ "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Jump to buffer" },
		{ "<leader>bw", "<cmd>Bwipeout<cr>", desc = "Wipeout buffer" },
		{ "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all buffers left" },
		{ "<leader>bl", "<cmd>BufferLineCloseRight<CR>", desc = "Close all buffers right" },
		{ "<leader>bs", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort BufferLines automatically by language" },
		{ "<leader>bd", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort BufferLines automatically by directory" },
		{ "<leader>bt", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle Buffer pin" },
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close all other buffers" },
		{ "<leader>b[", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },
		{ "<leader>b]", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
	},
}
