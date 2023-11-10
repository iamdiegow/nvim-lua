return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>o",
			"<cmd>Oil<CR>",
			desc = "Open Oil File Explorer",
		},
	},
	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
			},
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["q"] = "actions.close",
				["l"] = "actions.select",
				["h"] = "actions.parent",
			},
		})
	end,
}
