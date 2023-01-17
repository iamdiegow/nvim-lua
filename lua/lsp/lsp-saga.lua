local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
	return
end

saga.setup({
	preview = {
		lines_above = 0,
		lines_below = 10,
	},
	scroll_preview = {
		scroll_down = "<C-j>",
		scroll_up = "<C-k>",
	},
	request_timeout = 2000,
	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
	diagnostic_header = { " ", " ", " ", "ﴞ " },
	finder = {
		edit = { "o", "<CR>" },
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = { "q", "<ESC>" },
	},
	code_action = {
		num_shortcut = true,
		keys = {
			quit = "q",
			exec = "<CR>",
		},
	},
	lightbulb = {
		enable = true,
		virtual_text = true,
		sign = false,
		enable_in_insert = false,
	},
	diagnostic = {
		show_code_action = true,
		show_source = true,
		jump_num_shorcut = true,
		keys = {
			exec_action = "o",
			quit = "q",
			go_action = "g",
		},
	},
	rename = {
		quit = "<C-c>",
		exec = "<CR>",
		mark = "x",
		confirm = "<CR>",
		in_select = true,
		whole_project = false,
	},
	outline = {
		win_position = "right",
		show_detail = true,
		auto_preview = false,
		auto_refresh = true,
		auto_close = true,
		keys = {
			jump = "o",
			expand_collapse = "u",
			quit = "q",
		},
	},
	symbol_in_winbar = {
		enable = true,
		separator = "  ",
		hide_keyword = false,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = false,
	},
})
