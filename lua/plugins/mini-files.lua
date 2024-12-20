return {
	"echasnovski/mini.files",
	version = "*",
	keys = {
		{
			"<leader>o",
			function()
				local MiniFiles = require("mini.files")
				if not MiniFiles.close() then
					MiniFiles.open()
				end
			end,
			desc = "Open Mini Files Explorer",
		},
	},
	config = function()
		require("mini.files").setup({
			windows = {
				preview = false,
			},
		})
	end,
}
