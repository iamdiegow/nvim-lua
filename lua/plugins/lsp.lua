return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile " },
		config = function()
			require("lsp.mason")
			require("lsp.handlers").setup()
		end,
	},
	"jose-elias-alvarez/typescript.nvim",
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "LspAttach",
		config = function()
			local null_ls_status_ok, null_ls = pcall(require, "null-ls")
			if not null_ls_status_ok then
				return
			end

			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			local formatting = null_ls.builtins.formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			local diagnostics = null_ls.builtins.diagnostics
			-- local code_actions = null_ls.builtins.code_actions
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			local lsp_formatting = function(bufnr)
				vim.lsp.buf.format({
					filter = function(client)
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end

			null_ls.setup({
				debounce = 2000,
				debug = false,
				diagnostics_format = "[#{c}] #{m} (#{s})",
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								lsp_formatting(bufnr)
							end,
						})
					end
				end,
				sources = {
					-- diagnostics
					-- diagnostics.eslint_d.with({
					-- 	condition = function(utils)
					-- 		return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
					-- 	end,
					-- }),
					diagnostics.markdownlint,
					-- code actions
					-- code_actions.eslint_d,
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
							"markdown",
						},
						prefer_local = "node_modules/.bin",
					}),
					formatting.stylua,
				},
				update_in_insert = true,
			})
		end,
	},
	{
		"folke/neodev.nvim",
	},
	{
		"stevearc/aerial.nvim",
		keys = {
			{
				"<leader>a",
				"<cmd>AerialToggle! right<CR>",
				desc = "Aerial Outline",
			},
		},
		opts = {
			attach_mode = "window",
			backends = { "lsp", "markdown", "man" },
			layout = { min_width = 28 },
			show_guides = false,
			lazy_load = true,
			filter_kind = false,
		},
	},
	{
		"chikko80/error-lens.nvim",
		event = "LspAttach",
		opts = true,
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		config = function()
			require("fidget").setup({
				window = {
					blend = 0,
				},
			})
		end,
	},
}
