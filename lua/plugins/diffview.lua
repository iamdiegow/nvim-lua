return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
		{ "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "View File History" },
		{ "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "View Current File History" },
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local status_ok, diffview = pcall(require, "diffview")
		if not status_ok then
			return
		end

		local actions = require("diffview.actions")

		diffview.setup({
			diff_binaries = false,
			enhanced_diff_hl = false,
			git_cmd = { "git" },
			use_icons = true,
			icons = {
				folder_closed = "",
				folder_open = "",
			},
			signs = {
				fold_closed = "",
				fold_open = "",
			},
			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
					folder_statuses = "only_folded",
				},
				win_config = {
					position = "left",
					width = 25,
				},
			},
			file_history_panel = {
				log_options = {
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
					position = "bottom",
					height = 16,
				},
			},
			commit_log_panel = {
				win_config = {},
			},
			default_args = {
				DiffviewOpen = {},
				DiffviewFileHistory = {},
			},
			hooks = {},
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
}
