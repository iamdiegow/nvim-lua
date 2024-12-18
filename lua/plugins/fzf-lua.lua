return {
	{
		"ibhagwan/fzf-lua",
		keys = {
			{
				"<leader>sf",
				function()
					require("fzf-lua").files()
				end,
				desc = "Files (fzf-lua)",
			},
			{
				"<leader>sp",
				function()
					require("fzf-lua").resume()
				end,
				desc = "Resume (fzf-lua)",
			},
			{
				"<leader>sb",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "Buffers (fzf-lua)",
			},
			{
				"<leader>so",
				function()
					require("fzf-lua").oldfiles()
				end,
				desc = "Old Files (fzf-lua)",
			},
			{
				"<leader>sr",
				function()
					require("fzf-lua").grep()
				end,
				desc = "Grep (fzf-lua)",
			},
			{
				"<leader>sl",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Live Grep (fzf-lua)",
			},
		},
		config = function()
			require("fzf-lua").setup({ "max-perf" })
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
