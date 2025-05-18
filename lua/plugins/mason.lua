return {
	{
		"mason-org/mason-lspconfig.nvim",
		event = "BufReadPre",
		dependencies = {
			{
				lazy = false,
				"mason-org/mason.nvim",
			},
			{
				lazy = false,
				"neovim/nvim-lspconfig",
			},
		},
		config = function()
			require("mason").setup({
				ui = {
					border = "single",
					icons = {
						package_installed = "◍",
						package_pending = "◍",
						package_uninstalled = "◍",
					},
				},
				log_level = vim.log.levels.INFO,
				max_concurrent_installers = 2,
			})

			local servers = {
				"cssls",
				"html",
				"jsonls",
				"lua_ls",
				"ts_ls",
				"yamlls",
				"bashls",
				"eslint",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"astro",
				"tailwindcss",
				"prismals",
				"emmet_language_server",
				"marksman",
			}

			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_enable = true,
			})

			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "",
						[vim.diagnostic.severity.INFO] = "",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "ErrorMsg",
						[vim.diagnostic.severity.WARN] = "WarningMsg",
						[vim.diagnostic.severity.HINT] = "DiagnosticHint",
						[vim.diagnostic.severity.INFO] = "DiagnisticInfo",
					},
				},
				update_in_insert = false,
				underline = true,
				severity_sort = true,
			})

			vim.lsp.config("*", {
				capabilities = require("lsp.handlers").capabilities,
				on_attach = require("lsp.handlers").on_attach,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local bufnr = event.buf
					local client = vim.lsp.get_client_by_id(event.data.client_id)

					if not client then
						return
					end

					require("lsp.handlers").lsp_keymaps(bufnr)
				end,
			})
		end,
	},
}
