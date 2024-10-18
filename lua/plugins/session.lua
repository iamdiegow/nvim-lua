return {
	"folke/persistence.nvim",
	keys = {
		{
			"<leader>pl",
			"<cmd>lua require('persistence').load({ last = true })<CR>",
			desc = "Restore last session (Persistence)",
		},
		{
			"<leader>pr",
			"<cmd>lua require('persistence').load()<CR>",
			desc = "Restore session for current directory (Persistence)",
		},
		{
			"<leader>pd",
			"<cmd>lua require('persistence').stop()<CR>",
			desc = "Dont save session (Persistence)",
		},
	},
	config = function()
		require("persistence").setup()
	end,
}
