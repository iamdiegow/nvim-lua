return {
	"windwp/nvim-spectre",
	keys = {
		{
			"<leader>So",
			function()
				require("spectre").open()
			end,
			desc = "Replace in files (Spectre)",
		},
		{
			"<leader>Sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Open visual - select word (Spectre)",
		},
		{
			"<leader>Sf",
			function()
				require("spectre").open_file_search()
			end,
			desc = "File Search (Spectre)",
		},
	},
}
