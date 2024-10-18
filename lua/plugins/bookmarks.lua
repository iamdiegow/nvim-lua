return {
	enabled = false,
	"tomasky/bookmarks.nvim",
	event = "VimEnter",
	config = function()
		require("bookmarks").setup({
			sign_priority = 8, --set bookmark sign priority to cover other sign
			save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
			keywords = {
				["@t"] = "☑️ ",
				["@w"] = "⚠️ ",
				["@f"] = "⛏ ",
				["@n"] = " ",
			},
			on_attach = function()
				local bm = require("bookmarks")
				local map = vim.keymap.set
				map("n", "mm", bm.bookmark_toggle, { desc = "Add or remove bookmark" })
				map("n", "mi", bm.bookmark_ann, { desc = "Add or edit mark annotation at current line" })
				map("n", "mc", bm.bookmark_clean, { desc = "Clean all marks in local buffer" })
				map("n", "mn", bm.bookmark_next, { desc = "Jump to next mark in local buffer" })
				map("n", "mp", bm.bookmark_prev, { desc = "Jump to previous mark in local buffer" })
				map(
					"n",
					"ml",
					"<cmd>Telescope bookmarks list<CR>",
					{ desc = "Show marked file list in quickfix window" }
				)
			end,
		})
	end,
}
