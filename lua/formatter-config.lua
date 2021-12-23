local formatterConfig = {}

local prettierConfig = function()
	return {
		exe = "prettier",
		args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
		stdin = true
	}
end

local commonFT = {
  "css",
  "scss",
  "html",
  "java",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "markdown",
  "markdown.mdx",
  "json"
}

for _, ft in ipairs(commonFT) do
	formatterConfig[ft] = {
		prettierConfig
	}
end

require('formatter').setup({
  logging = false,
  filetype = formatterConfig
})

if vim.g.format_on_save == true then
	-- Format on save
	vim.api.nvim_exec([[
		augroup FormatAutogroup
			autocmd!
			autocmd BufWritePost *.js,*.jsx,*.json,*.ts,*.tsx FormatWrite
		augroup END]]
		, true
	)
end
