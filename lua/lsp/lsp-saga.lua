local status_ok, saga = pcall(require, 'lspsaga')
if not status_ok then
	return
end

saga.init_lsp_saga({
	border_style = "single",
	saga_winblend = 0,
	move_in_saga = { prev = '<C-k>', next = '<C-j>' },
	diagnostic_header = { " ", " ", " ", "ﴞ " },
	code_action_icon = "💡",
	code_action_num_shortcut = true,
	code_action_lightbulb = {
		enable = true,
		sign = false,
		enable_in_insert = true,
		sign_priority = 20,
		virtual_text = true,
	},
	finder_icons = {
		def = '  ',
		ref = '諭 ',
		link = '  ',
	},
	finder_request_timeout = 1500,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = "q",
		scroll_down = "<C-j>",
		scroll_up = "<C-k>",
	},
	code_action_keys = {
		quit = "q",
		exec = "<CR>",
	},
	rename_action_quit = "<C-c>",
	rename_in_select = true,
	symbol_in_winbar = {
		in_custom = false,
		enable = false,
		separator = ' ',
		show_file = false,
		click_support = false,
	},
	show_outline = {
		win_position = 'right',
		win_with = '',
		win_width = 25,
		auto_enter = true,
		auto_preview = false,
		virt_text = '┃',
		jump_key = 'o',
		auto_refresh = true,
	},
	server_filetype_map = {},
})
