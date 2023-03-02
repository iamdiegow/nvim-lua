return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile "},
		config = function()
			require("lsp.mason")
			require("lsp.handlers").setup()
		end,
	},
	"jose-elias-alvarez/typescript.nvim",
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
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
				debounce = 2000,
				debug = false,
				diagnostics_format = "[#{c}] #{m} (#{s})",
				sources = {
					-- diagnostics
					diagnostics.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
						end,
					}),
					diagnostics.markdownlint,
					-- code actions
					code_actions.eslint_d,
					require("typescript.extensions.null-ls.code-actions"),
					-- formatting
					formatting.black.with({ extra_args = { "--fast" } }),
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
							"graphql",
							"markdown"
						},
						prefer_local = "node_modules/.bin",
					}),
					formatting.stylua,
				},
				update_in_insert = false,
			})
		end,
	},
	{
		"folke/neodev.nvim"
	}
}
