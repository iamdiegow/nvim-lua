local status_ok, neotree = pcall(require, 'neo-tree')
if not status_ok then
	return
end

neotree.setup({
	close_if_last_window = true,
	close_floats_on_escape_key = true,
	default_source = "filesystem",
	enable_diagnostics = true,
	enable_git_status = true,
	enable_modified_markers = true,
	enable_refresh_on_write = true,
	git_status_async = true,
	git_status_async_options = {
		batch_size = 1000,
		batch_delay = 10,
		max_lines = 10000,
	},
	hide_root_node = true,
	log_level = "info", -- "trace", "debug", "info", "warn", "error", "fatal"
	log_to_file = false,
	open_files_in_last_window = true,
	popup_border_style = "rounded",
	resize_timer_interval = 500,
	sort_case_insensitive = false,
	sort_function = nil ,
	use_popups_for_input = false,
	use_default_mappings = true,
	default_component_configs = {
		container = {
			enable_character_fade = true
		},
		indent = {
			indent_size = 2,
			padding = 1,
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "ﰊ",
			-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
			-- then these will never be used.
			default = "*",
			highlight = "NeoTreeFileIcon"
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				-- Change type
				added     = "✚",
				deleted   = "✖",
				modified  = "",
				renamed   = "",
				-- Status type
				untracked = "",
				ignored   = "",
				unstaged  = "",
				staged    = "",
				conflict  = "",
			},
			align = "right"
		},
	},
	renderers = {
		directory = {
			{ "indent" },
			{ "icon" },
			{ "current_filter" },
			{
				"container",
				width = "100%",
				right_padding = 1,
				max_width = 30,
				content = {
					{ "name", zindex = 10 },
					{ "clipboard", zindex = 10 },
					{ "diagnostics", errors_only = true, zindex = 20, align = "right" },
				},
			},
		},
		file = {
			{ "indent" },
			{ "icon" },
			{
				"container",
				width = "100%",
				right_padding = 1,
				--max_width = 60,
				content = {
					{
						"name",
						use_git_status_colors = true,
						zindex = 10
					},
					-- {
					--   "symlink_target",
					--   zindex = 10,
					--   highlight = "NeoTreeSymbolicLinkTarget",
					-- },
					{ "clipboard", zindex = 10 },
					{ "bufnr", zindex = 10 },
					{ "modified", zindex = 20, align = "right" },
					{ "diagnostics",  zindex = 20, align = "right" },
					{ "git_status", zindex = 20, align = "right" },
				},
			},
		},
		message = {
			{ "indent", with_markers = false },
			{ "name", highlight = "NeoTreeMessage" },
		},
		terminal = {
			{ "indent" },
			{ "icon" },
			{ "name" },
			{ "bufnr" }
		}
	},
	nesting_rules = {},
	window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
		-- possible options. These can also be functions that return these options.
		position = "left", -- left, right, float, current
		width = 25, -- applies to left and right positions
		popup = { -- settings that apply to float position only
			size = {
				height = "80%",
				width = "50%",
			},
			position = "50%", -- 50% means center it
			-- you can also specify border here, if you want a different setting from
			-- the global popup_border_style.
		},
		-- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in commands.
		-- You can also create your own commands by providing a function instead of a string.
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<space>"] = {
				"toggle_node",
				nowait = false
			},
			["l"] = {
				"toggle_node"
			},
			["<2-LeftMouse>"] = "open",
			["<cr>"] = "open",
			["s"] = "open_split",
			["v"] = "open_vsplit",
			["w"] = "open_with_window_picker",
			["h"] = "close_node",
			["z"] = "close_all_nodes",
			["Z"] = "expand_all_nodes",
			["R"] = "refresh",
			["a"] = {
				"add",
				config = {
					show_path = "none"
				}
			},
			["A"] = "add_directory",
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy",
			["m"] = "move",
			["q"] = "close_window",
			["?"] = "show_help",
		},
	},
	filesystem = {
		window = {
			mappings = {
				["H"] = "toggle_hidden",
				["D"] = "fuzzy_finder_directory",
				["/"] = "filter_as_you_type", -- this was the default until v1.28
				["f"] = "filter_on_submit",
				["<C-x>"] = "clear_filter",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["[g"] = "prev_git_modified",
				["]g"] = "next_git_modified",
			}
		},
		async_directory_scan = "auto",
		bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
		cwd_target = {
			sidebar = "tab",   -- sidebar is when position = left or right
			current = "window" -- current is when position = current
		},
		filtered_items = {
			visible = false,
			force_visible_in_empty_folder = false,
			show_hidden_count = true,
			hide_dotfiles = false,
			hide_gitignored = true,
			hide_hidden = true,
			hide_by_name = {
				".DS_Store",
				"thumbs.db",
				".git"
			},
			hide_by_pattern = { -- uses glob style patterns
				--"*.meta"
			},
			never_show = { -- remains hidden even if visible is toggled to true
				--".DS_Store",
				--"thumbs.db"
			},
		},
		find_by_full_path_words = false,
		group_empty_dirs = false,
		search_limit = 50,
		follow_current_file = false,
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = false,
	},
	buffers = {
		bind_to_cwd = true,
		follow_current_file = true, -- This will find and focus the file in the active buffer every time
		group_empty_dirs = true, -- when true, empty directories will be grouped together
		window = {
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["bd"] = "buffer_delete",
			},
		},
	},
	git_status = {
		window = {
			mappings = {
				["A"] = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			},
		},
	},
	example = {
		renderers = {
			custom = {
				{"indent"},
				{"icon", default="C" },
				{"custom"},
				{"name"}
			}
		},
		window = {
			mappings = {
				["<cr>"] = "toggle_node",
				["e"] = "example_command",
				["d"] = "show_debug_info",
			},
		},
	},
})
