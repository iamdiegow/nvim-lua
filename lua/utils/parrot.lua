local M = {}

M.ChatEnglish = function(prt, params)
	local chat_prompt = [[
						  You are an expert English teacher. Please perform a spell check and improve the grammar of user input text.
							Response the improved text with a short explanation of the grammar and mention the theory behind it. Your
							response should have less than 200 words.
						]]
	prt.ChatNew(params, chat_prompt)
end

M.ExplainCode = function(prt, params)
	local template = [[
							Please take the following code snippet from {{filename}} and explain it with with gradually
							increasing complexity.
							Break down the code, explain it's functionality, purpose, and key parts.
							The objective is to help the reader understand the code and how it works.

							```{{filetype}}
							{{selection}}
							```

							Use the markdown format with codeblocks and inline code.
							Explanation of the code above:
						]]
	local model = prt.get_model("command")
	prt.logger.info("Explaining selection with model: " .. model.name)
	prt.Prompt(params, prt.ui.Target.new, model, nil, template)
end

M.ExplainGrammar = function(prt, params)
	local template = [[
							I want you to act as an English teacher.
							Please take the following text: `{{selection}}`, and explain it's grammar,
							check spelling and punctuation errors. Provide suggestions and corrections.
							The objective is to help the reader understand English grammar better.
							Your response should have less than 200 words.
						]]
	local model = prt.get_model("command")
	prt.logger.info("Explain Grammar")
	prt.Prompt(params, prt.ui.Target.new, model, nil, template)
end

return M
