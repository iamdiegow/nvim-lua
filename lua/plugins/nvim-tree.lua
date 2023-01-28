return {
	"kyazdani42/nvim-tree.lua",
	dependencies = "kyazdani42/nvim-web-devicons",
	keys = {
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<CR>",
			desc = "Toggle Nvim Tree"
		}
	},
	opts = {
		auto_reload_on_write = true,
		disable_netrw = true,
		hijack_netrw = true,
		open_on_setup = false,
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
			ignore_list = {},
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		renderer = {
			highlight_git = true,
			group_empty = false,
			highlight_opened_files = "none",
			root_folder_modifier = ":~",
			add_trailing = true,
			indent_width = 2,
			indent_markers = {
				enable = false,
				icons = {
					corner = "└ ",
					item = "├─",
					edge = "│ ",
					none = "  ",
				},
			},
			icons = {
				webdev_colors = true,
				git_placement = "after",
				padding = " ",
				symlink_arrow = " ➛ ",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
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
						unstaged = "",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
			symlink_destination = true,
		},
		view = {
			adaptive_size = false,
			centralize_selection = false,
			hide_root_folder = true,
			width = 30,
			side = "left",
			number = false,
			signcolumn = "no",
			preserve_window_proportions = true,
			mappings = {
				list = {
					{ key = "l", action = "edit" },
					{ key = "h", action = "close_node" },
				},
			},
			float = {
				enable = true,
				open_win_config = {
					relative = "editor",
					border = "none",
					width = 200,
					height = 100,
					row = 1,
					col = 1,
				},
			},
		},
		filters = {
			dotfiles = false,
			custom = {
				".git",
			},
			exclude = {
				".github",
				"node_modules",
			},
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 1000,
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
				restrict_above_cwd = false,
			},
			open_file = {
				quit_on_open = false,
				resize_window = false,
				window_picker = {
					enable = true,
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
						buftype = { "nofile", "terminal", "help" },
					},
				},
			},
			remove_file = {
				close_window = true,
			},
			expand_all = {
				max_folder_discovery = 300,
			},
		},
		live_filter = {
			always_show_folders = true,
		},
	},
}