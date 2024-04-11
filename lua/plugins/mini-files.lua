return {
	"echasnovski/mini.files",
	version = "*",
	keys = {
		{
			"<leader>o",
			function()
				require("mini.files").open()
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
