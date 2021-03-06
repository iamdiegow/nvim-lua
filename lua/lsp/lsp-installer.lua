local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
	 	local jsonls_opts = require("lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "yamlls" then
	 	local yamlls = require("lsp.settings.yamlls")
	 	opts = vim.tbl_deep_extend("force", yamlls, opts)
	end

	if server.name == "emmet_ls" then
	 	local emmet_ls = require("lsp.settings.emmet_ls")
	 	opts = vim.tbl_deep_extend("force", emmet_ls, opts)
	end

	server:setup(opts)
end)

