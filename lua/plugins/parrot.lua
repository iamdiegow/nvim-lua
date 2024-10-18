return {
	{
		"frankroeder/parrot.nvim",
		keys = {
			{ "<leader>/v", "<cmd>PrtChatToggle vsplit<CR>", desc = "Toggle Chat vsplit(Parrot)" },
			{ "<leader>/s", "<cmd>PrtChatToggle split<CR>", desc = "Toggle Chat split(Parrot)" },
			{ "<leader>/p", "<cmd>PrtChatToggle popup<CR>", desc = "Toggle Chat popup(Parrot)" },
			{ "<leader>//", "<cmd>PrtChatRespond<CR>", desc = "Chat Respond (Parrot)" },
		},
		dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
		config = function()
			require("parrot").setup({
				chat_free_cursor = false,
				chat_shortcut_respond = { modes = { "n" }, shortcut = "<CR>" },
				chat_shortcut_stop = { modes = { "n" }, shortcut = "<BS>" },
				providers = {
					ollama = {
						topic = {
							model = "llama3.2:latest",
							params = {
								max_tokens = 32,
							},
						},
						params = {
							chat = { max_tokens = 1024 },
							command = { max_tokens = 1024 },
						},
					},
				},
			})
		end,
	},
}
