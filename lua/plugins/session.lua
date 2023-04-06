return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>pl",
			"<cmd>lua require('persistence').load({ last = true })",
			desc = "Restore last session (Persistence)",
		},
		{
			"<leader>pr",
			"<cmd>lua require('persistence').load()",
			desc = "Restore session for current directory (Persistence)",
		},
		{
			"<leader>pd",
			"<cmd>lua require('persistence').stop()",
			desc = "Dont save session (Persistence)",
		},
	},
	config = function()
		require("persistence").setup()
	end,
}
