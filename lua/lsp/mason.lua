local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
	"cssls",
	"html",
	"jsonls",
	"lua_ls",
	"tsserver",
	"pyright",
	"yamlls",
	"bashls",
	"marksman",
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)

mason_lspconfig.setup({
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
			allow_incremental_sync = true, debounce_text_changes = 200,
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
		require("neodev").setup()
		local luals_opts = require("lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", luals_opts, opts)
	end

	if server == "emmet_ls" then
		local emmet_ls_opts = require("lsp.settings.emmet_ls")
		opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
	end

	if server == "tsserver" then
		-- this plugins won't work if a call to lspconfig["tsserver"].setup() is made
		require("typescript").setup({
			disable_commands = false,
			debug = false,
			go_to_source_definition = {
				fallback = true,
			},
			server = {
				on_attach = opts.on_attach,
				capabilities = opts.capabilities,
			},
		})

		local options = { noremap = true, silent = true }
		local map = vim.api.nvim_set_keymap
		map("n", "gM", "<cmd>TypescriptAddMissingImports<CR>", options)
		map("n", "gR", "<cmd>TypescriptRemoveUnused<CR>", options)
		map("n", "gO", "<cmd>TypescriptOrganizeImports<CR>", options)
		-- prevent calling lspconfig["tsserver"].setup()
		::continue::
	end

	lspconfig[server].setup(opts)
	::continue::
end
