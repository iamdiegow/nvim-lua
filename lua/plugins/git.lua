return {
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
			{ "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "View File History" },
		},
		dependencies = { "nvim-lua/plenary.nvim" },
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
				icons = {
					-- Only applies when use_icons is true.
					folder_closed = "",
					folder_open = "",
				},
				signs = {
					fold_closed = "",
					fold_open = "",
				},
				file_panel = {
					listing_style = "tree", -- One of 'list' or 'tree'
					tree_options = {
						-- Only applies when listing_style is 'tree'
						flatten_dirs = true, -- Flatten dirs that only contain one single dir
						folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
					},
					win_config = {
						-- See ':h diffview-config-win_config'
						position = "left",
						width = 25,
					},
				},
				file_history_panel = {
					log_options = {
						-- See ':h diffview-config-log_options'
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
					win_config = {
						-- See ':h diffview-config-win_config'
						position = "bottom",
						height = 16,
					},
				},
				commit_log_panel = {
					win_config = {}, -- See ':h diffview-config-win_config'
				},
				default_args = {
					-- Default args prepended to the arg-list for the listed commands
					DiffviewOpen = {},
					DiffviewFileHistory = {},
				},
				hooks = {}, -- See ':h diffview-config-hooks'
				keymaps = {
					disable_defaults = false,
					view = {
						{ "n", "<leader>b", actions.focus_files, { desc = "Bring focus to the file panel" } },
						{ "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel" } },
						{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
					},
					file_panel = {
						{ "n", "<leader>b", actions.focus_files, { desc = "Bring focus to the file panel" } },
						{ "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel" } },
						{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
						{
							"n",
							"s",
							actions.toggle_stage_entry,
							{ desc = "Stage / unstage the selected entry." },
						},
					},
					file_history_panel = {
						{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
					},
				},
			})
		end,
	},
	{
		"NeogitOrg/neogit",
		keys = {
			{ "<leader>gg", "<cmd>lua require('neogit').open()<CR>", desc = "Open Neogit" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = function()
			require("neogit").setup({
				disable_hint = false,
				disable_context_highlighting = false,
				disable_signs = false,
				disable_commit_confirmation = false,
				disable_insert_on_commit = true,
				remember_settings = true,
				use_per_project_settings = true,
				ignored_settings = {
					"NeogitPushPopup--force-with-lease",
					"NeogitPushPopup--force",
					"NeogitPullPopup--rebase",
					"NeogitCommitPopup--allow-empty",
					"NeogitRevertPopup--no-edit",
				},
				auto_refresh = true,
				sort_branches = "-committerdate",
				kind = "tab",
				console_timeout = 2000,
				auto_show_console = true,
				status = {
					recent_commit_count = 10,
				},
				commit_editor = {
					kind = "split",
				},
				commit_select_view = {
					kind = "tab",
				},
				commit_view = {
					kind = "vsplit",
				},
				log_view = {
					kind = "tab",
				},
				rebase_editor = {
					kind = "split",
				},
				reflog_view = {
					kind = "tab",
				},
				merge_editor = {
					kind = "split",
				},
				preview_buffer = {
					kind = "split",
				},
				popup = {
					kind = "split",
				},
				signs = {
					hunk = { "", "" },
					item = { ">", "v" },
					section = { ">", "v" },
				},
				integrations = {
					diffview = true,
				},
				sections = {
					sequencer = {
						folded = false,
						hidden = false,
					},
					untracked = {
						folded = false,
						hidden = false,
					},
					unstaged = {
						folded = false,
						hidden = false,
					},
					staged = {
						folded = false,
						hidden = false,
					},
					stashes = {
						folded = true,
						hidden = false,
					},
					unpulled_upstream = {
						folded = true,
						hidden = false,
					},
					unmerged_upstream = {
						folded = false,
						hidden = false,
					},
					unpulled_pushRemote = {
						folded = true,
						hidden = false,
					},
					unmerged_pushRemote = {
						folded = false,
						hidden = false,
					},
					recent = {
						folded = true,
						hidden = false,
					},
					rebase = {
						folded = true,
						hidden = false,
					},
				},
				mappings = {
					finder = {
						["<cr>"] = "Select",
						["<c-c>"] = "Close",
						["<esc>"] = "Close",
						["q"] = "Close",
						["<c-n>"] = "Next",
						["<c-p>"] = "Previous",
						["<down>"] = "Next",
						["<up>"] = "Previous",
						["<tab>"] = "MultiselectToggleNext",
						["<s-tab>"] = "MultiselectTogglePrevious",
						["<c-j>"] = "NOP",
					},
					popup = {
						["?"] = "HelpPopup",
						["A"] = "CherryPickPopup",
						["D"] = "DiffPopup",
						["M"] = "RemotePopup",
						["P"] = "PushPopup",
						["X"] = "ResetPopup",
						["Z"] = "StashPopup",
						["b"] = "BranchPopup",
						["c"] = "CommitPopup",
						["f"] = "FetchPopup",
						["l"] = "LogPopup",
						["m"] = "MergePopup",
						["p"] = "PullPopup",
						["r"] = "RebasePopup",
						["v"] = "RevertPopup",
					},
					status = {
						["q"] = "Close",
						["I"] = "InitRepo",
						["1"] = "Depth1",
						["2"] = "Depth2",
						["3"] = "Depth3",
						["4"] = "Depth4",
						["<tab>"] = "Toggle",
						["x"] = "Discard",
						["s"] = "Stage",
						["S"] = "StageUnstaged",
						["<c-s>"] = "StageAll",
						["u"] = "Unstage",
						["U"] = "UnstageStaged",
						["d"] = "DiffAtFile",
						["$"] = "CommandHistory",
						["#"] = "Console",
						["<c-r>"] = "RefreshBuffer",
						["<enter>"] = "GoToFile",
						["<c-v>"] = "VSplitOpen",
						["<c-x>"] = "SplitOpen",
						["<c-t>"] = "TabOpen",
						["{"] = "GoToPreviousHunkHeader",
						["}"] = "GoToNextHunkHeader",
					},
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
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
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				trouble = true,
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil,
				word_diff = false,
			})
		end,
	},
}
