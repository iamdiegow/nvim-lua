return {
	{
		"frankroeder/parrot.nvim",
		event = "VeryLazy",
		keys = {
			{ "<C-g>v", "<cmd>PrtChatToggle vsplit<CR>", desc = "Toggle Chat vsplit(Parrot)" },
			{ "<C-g>s", "<cmd>PrtChatToggle split<CR>", desc = "Toggle Chat split(Parrot)" },
			{ "<C-g><C-g>", "<cmd>PrtChatToggle popup<CR>", desc = "Toggle Chat popup(Parrot)" },
			{
				"<C-g>e",
				":<C-u>'<,'>PrtExplainGrammar<CR>",
				mode = { "v" },
				desc = "ExplainGrammar command(Parrot)",
			},
			{
				"<C-g>c",
				":<C-u>'<,'>PrtExplainCode<CR>",
				mode = { "v" },
				desc = "ExplainCode command(Parrot)",
			},
		},
		dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
		config = function()
			local prompts = require("utils.parrot-prompts")

			require("parrot").setup({
				chat_free_cursor = true,
				chat_shortcut_respond = { modes = { "n" }, shortcut = "<CR>" },
				chat_shortcut_stop = { modes = { "n" }, shortcut = "<BS>" },
				command_auto_select_response = false,
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
				hooks = prompts,
			})
		end,
	},
}
