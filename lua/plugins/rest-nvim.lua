return {
	{
		"vhyrro/luarocks.nvim",
		enabled = false,
		config = function()
			require("luarocks").setup({
				rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
			})
		end,
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = {
			"vhyrro/luarocks.nvim",
		},
		ft = { "http" },
		keys = {
			{
				"<leader>rr",
				"<cmd>Rest run<CR>",
				desc = "Run request under cursor (Rest Nvim)",
			},
			{
				"<leader>rl",
				"<cmd>Rest run last<CR>",
				desc = "Re-Run last request (Rest Nvim)",
			},
		},
		config = function()
			require("rest-nvim").setup({
				skip_ssl_verification = false,
				encode_url = true,
				result = {
					split = {
						horizontal = false,
						in_place = false,
						stay_in_current_window_after_split = true,
					},
					behavior = {
						decode_url = true,
						show_info = {
							url = true,
							headers = true,
							http_info = true,
							curl_command = false,
						},
					},
				},
				highlight = {
					enable = false,
					timeout = 100,
				},
			})
		end,
	},
}
