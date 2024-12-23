return {
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		dependencies = {
			{
				lazy = false,
				"williamboman/mason.nvim",
			},
			{
				"neovim/nvim-lspconfig",
				lazy = false,
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
				ensure_installed = servers,
				automatic_installation = true,
			})

			local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
			if not lspconfig_status_ok then
				return
			end

			local opts = {}

			for _, server in pairs(servers) do
				opts = {
					on_attach = require("lsp.handlers").on_attach,
					capabilities = require("lsp.handlers").capabilities,
					flags = {
						allow_incremental_sync = true,
						debounce_text_changes = 200,
					},
				}

				server = vim.split(server, "@")[1]

				if server == "jsonls" then
					local jsonls_opts = require("lsp.settings.jsonls")
					opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
				end

				if server == "yamlls" then
					local yamlls_opts = require("lsp.settings.yamlls")
					opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
				end

				if server == "lua_ls" then
					local luals_opts = require("lsp.settings.lua_ls")
					opts = vim.tbl_deep_extend("force", luals_opts, opts)
				end

				if server == "eslint" then
					local eslint_opts = require("lsp.settings.eslint")
					opts = vim.tbl_deep_extend("force", eslint_opts, opts)
				end

				lspconfig[server].setup(vim.tbl_deep_extend("force", opts, {
					capabilities = {
						textDocument = {
							foldingRange = {
								dynamicRegistration = false,
								lineFoldingOnly = true,
							},
						},
					},
				}))
				::continue::
			end

			require("lsp.handlers").setup()
		end,
	},
}
