return {
	{
		"David-Kunz/gen.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			local gen = require("gen")

			gen.setup({
				model = "llama3.2",
				quit_map = "q",
				retry_map = "<c-r>",
				accept_map = "<c-cr>",
				host = "localhost",
				port = "11434",
				display_mode = "split",
				show_prompt = false,
				show_model = true,
				no_auto_close = true,
				file = false,
				hidden = false,
				command = function(options)
					local body = { model = options.model, stream = true }
					return "curl --silent --no-buffer -X POST http://"
						.. options.host
						.. ":"
						.. options.port
						.. "/api/chat -d $body"
				end,
				debug = false,
			})

			gen.prompts = {
				Generate = { prompt = "$input", replace = false },
				Chat = { prompt = "$input" },
				Summarize = { prompt = "Summarize the following text:\n$text" },
				Ask = { prompt = "Regarding the following text, $input:\n$text" },
				Change = {
					prompt = "Change the following text, $input, just output the final text without additional quotes around it:\n$text",
					replace = false,
				},
				Enhance_Grammar_Spelling = {
					prompt = "Modify the following text to improve grammar and spelling, just output the final text without additional quotes around it:\n$text",
					replace = false,
				},
				Enhance_Wording = {
					prompt = "Modify the following text to use better wording, just output the final text without additional quotes around it:\n$text",
					replace = false,
				},
				Make_Concise = {
					prompt = "Modify the following text to make it as simple and concise as possible, just output the final text without additional quotes around it:\n$text",
					replace = false,
				},
				Make_List = {
					prompt = "Render the following text as a markdown list:\n$text",
					replace = false,
				},
				Review_Code = {
					prompt = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
				},
			}
		end,
	},
}
