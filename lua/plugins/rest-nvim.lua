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
			encode_url = true,
			result = {
				show_url = true,
				show_curl_command = false,
				show_http_info = false,
				show_headers = true,
			},
		})
	end,
}
