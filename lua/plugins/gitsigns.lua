return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		-- event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>gj",
				"<cmd>lua require 'gitsigns'.next_hunk({preview = true, foldopen = true})<cr>",
				desc = "Next Hunk",
			},
			{
				"<leader>gk",
				"<cmd>lua require 'gitsigns'.prev_hunk({preview = true, foldopen = true})<cr>",
				desc = "Prev Hunk",
			},
			{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
			{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
			{ "<leader>gi", "<cmd>lua require 'gitsigns'.preview_hunk_inline()<cr>", desc = "Preview Hunk Inline" },
			{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
			{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
			{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
			{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
			{ "<leader>gw", "<cmd>Gitsigns toggle_word_diff<cr>", desc = "Toggle Word Diff" },
			{ "<leader>ge", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle Line Highlight" },
			{ "<leader>gn", "<cmd>Gitsigns toggle_numhl<cr>", desc = "Toggle Number Highlight" },
			{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Line Blame" },
			{ "<leader>gq", "<cmd>Gitsigns setqflist<cr>", desc = "Set QuickFix List" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local status_ok, gitsigns = pcall(require, "gitsigns")
			if not status_ok then
				return
			end

			--"⎟ ⎜ ⎢ ⎜ ▏ ▊ ▋ ▉ ▎ ▍ ▋ ▍ ▎ "
			local text1 = "▊"

			gitsigns.setup({
				signs = {
					add = {
						text = text1,
					},
					change = {
						text = text1,
					},
					delete = {
						text = "契",
					},
					topdelete = {
						text = "契",
					},
					changedelete = {
						text = text1,
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
