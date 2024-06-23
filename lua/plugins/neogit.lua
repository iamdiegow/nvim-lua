return {
	"NeogitOrg/neogit",
	keys = {
		{ "<leader>gg", "<cmd>lua require('neogit').open()<CR>", desc = "Open Neogit" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	config = true,
}
