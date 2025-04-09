return {
	"echasnovski/mini.files",
	version = "*",
	keys = {
		{
			"<leader>o",
			function()
				local MiniFiles = require("mini.files")
				local buf_name = vim.api.nvim_buf_get_name(0)
				local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
				MiniFiles.open(path)
				MiniFiles.reveal_cwd()
			end,
			desc = "Open Mini Files Explorer",
		},
	},
	config = function()
		require("mini.files").setup({
			windows = {
				preview = false,
				width_focus = 20,
				width_nofocus = 20,
			},
			mappings = {
				go_in_plus = "l",
				go_in = "<CR>",
				synchronize = "<C-s>",
			},
		})
	end,
}
