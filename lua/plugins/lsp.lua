return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		enabled = false,
		event = "LspAttach",
		config = function()
			local null_ls_status_ok, null_ls = pcall(require, "null-ls")
			if not null_ls_status_ok then
				return
			end

			local formatting = null_ls.builtins.formatting
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
					require("typescript.extensions.null-ls.code-actions"),
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
							"astro",
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
		"chikko80/error-lens.nvim",
		event = "BufRead",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			enabled = true,
			fallback_bg_color = nil,
			step = 7,
			total = 30,
			prefix = 5,
			colors = {
				error_fg = "#FF6363",
				error_bg = "#4B252C",
				warn_fg = "#FA973A",
				warn_bg = "#403733",
				info_fg = "#5B38E8",
				info_bg = "#281478",
				hint_fg = "#25E64B",
				hint_bg = "#147828",
			},
		},
	},
}
