local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debounce = 1000,
	debug = false,
	diagnostics_format = "[#{c}] #{m} (#{s})",
	sources = {
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
			end
		}),
		code_actions.eslint_d,
		code_actions.gitsigns,
		formatting.black.with { extra_args = { "--fast" } },
		formatting.prettierd.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"css",
				"scss",
				"html",
				"json",
				"yaml",
				"graphql"
			},
			prefer_local = "node_modules/.bin"
		}),
		formatting.stylua
	},
	update_in_insert = true
})
