return {
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
				-- signs = {
				-- 	add = {
				-- 		hl = "GitSignsAdd",
				-- 		text = text1,
				-- 		numhl = "GitSignsAddNr",
				-- 		linehl = "GitSignsAddLn",
				-- 	},
				-- 	change = {
				-- 		hl = "GitSignsChange",
				-- 		text = text1,
				-- 		numhl = "GitSignsChangeNr",
				-- 		linehl = "GitSignsChangeLn",
				-- 	},
				-- 	delete = {
				-- 		hl = "GitSignsDelete",
				-- 		text = "契",
				-- 		numhl = "GitSignsDeleteNr",
				-- 		linehl = "GitSignsDeleteLn",
				-- 	},
				-- 	topdelete = {
				-- 		hl = "GitSignsDelete",
				-- 		text = "契",
				-- 		numhl = "GitSignsDeleteNr",
				-- 		linehl = "GitSignsDeleteLn",
				-- 	},
				-- 	changedelete = {
				-- 		hl = "GitSignsChange",
				-- 		text = text1,
				-- 		numhl = "GitSignsChangeNr",
				-- 		linehl = "GitSignsChangeLn",
				-- 	},
				-- },
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
