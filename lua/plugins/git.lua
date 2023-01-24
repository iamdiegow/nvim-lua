return {
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
			{ "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "View File History" },
		},
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local status_ok, diffview = pcall(require, "diffview")
			if not status_ok then
				return
			end

			local actions = require("diffview.actions")

			diffview.setup({
				diff_binaries = false, -- Show diffs for binaries
				enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
				git_cmd = { "git" }, -- The git executable followed by default args.
				use_icons = true, -- Requires nvim-web-devicons
				icons = { -- Only applies when use_icons is true.
					folder_closed = "",
					folder_open = "",
				},
				signs = {
					fold_closed = "",
					fold_open = "",
				},
				file_panel = {
					listing_style = "tree", -- One of 'list' or 'tree'
					tree_options = { -- Only applies when listing_style is 'tree'
						flatten_dirs = true, -- Flatten dirs that only contain one single dir
						folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
					},
					win_config = { -- See ':h diffview-config-win_config'
						position = "left",
						width = 25,
					},
				},
				file_history_panel = {
					log_options = { -- See ':h diffview-config-log_options'
						git = {
							single_file = {
								follow = true,
								max_count = 512,
							},
							multi_file = {
								diff_merges = "first-parent",
							},
						},
					},
					win_config = { -- See ':h diffview-config-win_config'
						position = "bottom",
						height = 16,
					},
				},
				commit_log_panel = {
					win_config = {}, -- See ':h diffview-config-win_config'
				},
				default_args = { -- Default args prepended to the arg-list for the listed commands
					DiffviewOpen = {},
					DiffviewFileHistory = {},
				},
				hooks = {}, -- See ':h diffview-config-hooks'
				keymaps = {
					disable_defaults = false, -- Disable the default keymaps
					view = {
						-- The `view` bindings are active in the diff buffers, only when the current
						-- tabpage is a Diffview.
						["<tab>"] = actions.select_next_entry, -- Open the diff for the next file
						["<s-tab>"] = actions.select_prev_entry, -- Open the diff for the previous file
						["gf"] = actions.goto_file, -- Open the file in a new split in the previous tabpage
						["<C-w><C-f>"] = actions.goto_file_split, -- Open the file in a new split
						["<C-w>gf"] = actions.goto_file_tab, -- Open the file in a new tabpage
						["<leader>e"] = actions.focus_files, -- Bring focus to the files panel
						["<leader>b"] = actions.toggle_files, -- Toggle the files panel.
					},
					file_panel = {
						["j"] = actions.next_entry, -- Bring the cursor to the next file entry
						["<down>"] = actions.next_entry,
						["k"] = actions.prev_entry, -- Bring the cursor to the previous file entry.
						["<up>"] = actions.prev_entry,
						["<cr>"] = actions.select_entry, -- Open the diff for the selected entry.
						["o"] = actions.select_entry,
						["<2-LeftMouse>"] = actions.select_entry,
						["-"] = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
						["S"] = actions.stage_all, -- Stage all entries.
						["U"] = actions.unstage_all, -- Unstage all entries.
						["X"] = actions.restore_entry, -- Restore entry to the state on the left side.
						["R"] = actions.refresh_files, -- Update stats and entries in the file list.
						["L"] = actions.open_commit_log, -- Open the commit log panel.
						["<c-b>"] = actions.scroll_view(-0.25), -- Scroll the view up
						["<c-f>"] = actions.scroll_view(0.25), -- Scroll the view down
						["<tab>"] = actions.select_next_entry,
						["<s-tab>"] = actions.select_prev_entry,
						["gf"] = actions.goto_file,
						["<C-w><C-f>"] = actions.goto_file_split,
						["<C-w>gf"] = actions.goto_file_tab,
						["i"] = actions.listing_style, -- Toggle between 'list' and 'tree' views
						["f"] = actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
						["<leader>e"] = actions.focus_files,
						["<leader>b"] = actions.toggle_files,
					},
					file_history_panel = {
						["g!"] = actions.options, -- Open the option panel
						["<C-A-d>"] = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
						["y"] = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
						["L"] = actions.open_commit_log,
						["zR"] = actions.open_all_folds,
						["zM"] = actions.close_all_folds,
						["j"] = actions.next_entry,
						["<down>"] = actions.next_entry,
						["k"] = actions.prev_entry,
						["<up>"] = actions.prev_entry,
						["<cr>"] = actions.select_entry,
						["o"] = actions.select_entry,
						["<2-LeftMouse>"] = actions.select_entry,
						["<c-b>"] = actions.scroll_view(-0.25),
						["<c-f>"] = actions.scroll_view(0.25),
						["<tab>"] = actions.select_next_entry,
						["<s-tab>"] = actions.select_prev_entry,
						["gf"] = actions.goto_file,
						["<C-w><C-f>"] = actions.goto_file_split,
						["<C-w>gf"] = actions.goto_file_tab,
						["<leader>e"] = actions.focus_files,
						["<leader>b"] = actions.toggle_files,
					},
					option_panel = {
						["<tab>"] = actions.select_entry,
						["q"] = actions.close,
					},
				},
			})
		end,
	},
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Neogit" },
		},
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			disable_signs = false,
			disable_hint = false,
			disable_context_highlighting = false,
			disable_commit_confirmation = false,
			auto_refresh = true,
			disable_builtin_notifications = false,
			use_magit_keybindings = false,
			kind = "tab",
			commit_popup = {
				kind = "split",
			},
			popup = {
				kind = "split",
			},
			signs = {
				section = { ">", "v" }, -- { CLOSED, OPENED }
				item = { ">", "v" },
				hunk = { "", "" },
			},
			integrations = {
				diffview = true,
			},
			-- Setting any section to `false` will make the section not render at all
			sections = {
				untracked = {
					folded = false,
				},
				unstaged = {
					folded = false,
				},
				staged = {
					folded = false,
				},
				stashes = {
					folded = true,
				},
				unpulled = {
					folded = true,
				},
				unmerged = {
					folded = false,
				},
				recent = {
					folded = true,
				},
			},
			-- override/add mappings
			mappings = {
				-- modify status buffer mappings
				status = {
					-- Adds a mapping with "B" as key that does the "BranchPopup" command
					["B"] = "BranchPopup",
				},
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local status_ok, gitsigns = pcall(require, "gitsigns")
			if not status_ok then
				return
			end

			--"⎟ ⎜ ⎢ ⎜ ▏ ▊ ▋ ▉ ▎ ▍ ▋ ▍ ▎ "
			local text1 = "▍"

			gitsigns.setup({
				signs = {
					add = {
						hl = "GitSignsAdd",
						text = text1,
						numhl = "GitSignsAddNr",
						linehl = "GitSignsAddLn",
					},
					change = {
						hl = "GitSignsChange",
						text = text1,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "契",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "契",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = text1,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				signcolumn = true,
				numhl = false,
				linehl = false,
				keymaps = {
					noremap = true,
					buffer = true,
				},
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 500,
				},
				preview_config = {
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil,
				word_diff = false,
			})
		end,
	},
}
