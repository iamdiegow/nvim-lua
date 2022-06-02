require('nvim-tree').setup {
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = false,
	open_on_setup = true, -- open the tree if no file is provided
	ignore_ft_on_setup = {},
	open_on_tab = false,
	sort_by = "modification_time",
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {}
	},
	system_open = {
		cmd  = nil,
		args = {}
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
	renderer = {
		highlight_git = true,
		group_empty = false,
		highlight_opened_files = "all",
		root_folder_modifier = ":~",
		add_trailing = false,
		indent_markers = {
			enable = false,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  "
			}
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
          },
		}
	},
	view = {
		adaptive_size = true,
		hide_root_folder = true,
		width = 25,
		height = 20,
		side = 'left',
		number = false,
		signcolumn = "no",
		preserve_window_proportions = true,
		mappings = {
			list = {
				{ key = "l", action = "edit" },
				{ key = "h", action = "close_node" }
			}
		}
	},
	filters = {
		dotfiles = true,
		custom = {
			".git",
		},
		exclude = {
			".github",
			"node_modules"
		}
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 1000
	},
	trash = {
		cmd = "trash",
		require_confirm = true
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false
		},
		open_file = {
			quit_on_open = true,
			resize_window = true,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				}
			}
		},
		remove_file = {
			close_window = true
		},
		expand_all = {
			max_folder_discovery = 300
		}
	},
	live_filter = {
		always_show_folders = true
	}
}

-- hide statusline when nvim tree is opened
vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree_1" | set laststatus=0 | else | set laststatus=2 | endif]]
vim.cmd[[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]]

