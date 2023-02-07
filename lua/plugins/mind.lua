return {
	"phaazon/mind.nvim",
	cmd = { "MindOpenMain" },
	keys = {
		{
			"<leader>oo",
			"<cmd>:MindOpenMain<cr>",
			desc = "Mind Open Main Vault",
		},
		{
			"<leader>ol",
			"<cmd>:MindOpenProject<cr>",
			desc = "Mind Open Project Vault",
		},
		{
			"<leader>or",
			"<cmd>:MindReloadState<cr>",
			desc = "Mind Reload State",
		},
		{
			"<leader>oc",
			"<cmd>:MindClose<cr>",
			desc = "Mind Close",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("mind").setup({
			keymaps = {
				normal = {
					["<leader>os"] = "open_data_index",
				},
			},
		})
	end,
}
