return {
	"windwp/nvim-spectre",
	keys = {
		{
			"<leader>ss",
			function()
				require("spectre").open()
			end,
			desc = "Replace in files (Spectre)",
		},
		{
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Open visual - select word (Spectre)",
		},
		{
			"<leader>sf",
			function()
				require("spectre").open_file_search()
			end,
			desc = "File Search (Spectre)",
		},
	},
}
