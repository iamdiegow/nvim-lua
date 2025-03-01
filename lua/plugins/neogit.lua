return {
	"NeogitOrg/neogit",
	keys = {
		{ "<leader>gg", "<cmd>lua require('neogit').open()<CR>", desc = "Open Neogit" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	opts = {
		disable_hint = true,
		disable_context_highlighting = false,
		disable_signs = false,
	},
}
