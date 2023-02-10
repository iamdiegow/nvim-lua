local function open_nvim_tree(data)
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	if no_name then
		vim.cmd([[ Telescope oldfiles ]])
		return
	end

	require("nvim-tree.api").tree.open()
end

return {
	"kyazdani42/nvim-tree.lua",
	lazy = false,
	dependencies = "kyazdani42/nvim-web-devicons",
	keys = {
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<CR>",
			desc = "Toggle Nvim Tree",
		},
	},
	config = function()
		require("nvim-tree").setup({
			auto_reload_on_write = true,
			disable_netrw = true,
			hijack_netrw = true,
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
				highlight_opened_files = "all",
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
			remove_keymaps = {
				"<C-k>", "<C-l>"
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
					quit_on_focus_loss = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * 0.6
						local window_h = screen_h * 0.8
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
			},
			filters = {
				dotfiles = false,
				custom = {
					"^.git$",
				},
				exclude = {
					".github",
					"node_modules",
					".gitignore",
				},
			},
			git = {
				enable = true,
				ignore = false,
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
				always_show_folders = false,
			},
		})

		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
	end,
}
