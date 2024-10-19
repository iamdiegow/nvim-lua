return {
	{
		"frankroeder/parrot.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>/v", "<cmd>PrtChatToggle vsplit<CR>", desc = "Toggle Chat vsplit(Parrot)" },
			{ "<leader>/s", "<cmd>PrtChatToggle split<CR>", desc = "Toggle Chat split(Parrot)" },
			{ "<leader>//", "<cmd>PrtChatToggle popup<CR>", desc = "Toggle Chat popup(Parrot)" },
			{
				"<leader>/g",
				":<C-u>'<,'>PrtExplainGrammar<CR>",
				mode = { "v" },
				desc = "ExplainGrammar command(Parrot)",
			},
			{
				"<leader>/c",
				":<C-u>'<,'>PrtExplainCode<CR>",
				mode = { "v" },
				desc = "ExplainCode command(Parrot)",
			},
		},
		dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
		config = function()
			local prompts = require("utils.parrot")

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
