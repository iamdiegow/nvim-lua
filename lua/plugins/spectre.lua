return {
	"windwp/nvim-spectre",
	keys = {
		{
			"<leader>sr",
			function()
				require("spectre").open()
			end,
			desc = "Open Spectre (Spectre)",
		},
		{
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			mode = "v",
			desc = "Open visual (Spectre)",
		},
		{
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			mode = "n",
			desc = "Search current word (Spectre)",
		},
		{
			"<leader>sf",
			function()
				require("spectre").open_file_search({ select_word = true })
			end,
			desc = "Search in file (Spectre)",
		},
	},
	opts = {
		open_cmd = "noswapfile new",
	},
}
