return {
	"HampusHauffman/block.nvim",
	keys = {
		{
			"<leader>lb",
			"<cmd>Block<CR>",
			desc = "Toggle Block (Visual Blocks)",
		},
	},
	config = function()
		require("block").setup({
			percent = 0.9,
			depth = 4,
			colors = nil,
			automatic = false,
		})
	end,
}
