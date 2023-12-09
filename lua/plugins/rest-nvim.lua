return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	ft = { "http" },
	keys = {
		{
			"<leader>rr",
			"<Plug>RestNvim<CR>",
			desc = "Run request under cursor (Rest Nvim)",
		},
		{
			"<leader>rl",
			"<Plug>RestNvimLast<CR>",
			desc = "Re-Run last request (Rest Nvim)",
		},
	},
	config = function()
		require("rest-nvim").setup({
			skip_ssl_verification = false,
			result_split_horizontal = true,
			stay_in_current_window_after_split = false,
			encode_url = true,
			result = {
				-- URL, HTTP info, headers at the top of the result
				show_url = true,
				show_curl_command = false,
				show_http_info = true,
				show_headers = true,
			},
		})
	end,
}
