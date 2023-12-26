local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false,
		-- signs = {
		-- 	active = signs,
		-- },
		signs = false,
		update_in_insert = false,
		underline = false,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "single",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "single",
	})
end

local function lsp_keymaps(bufnr)
	local map = vim.keymap.set

	map("n", "gD", function()
		vim.lsp.buf.declaration()
	end, { desc = "(LSP) Go to Declaration", silent = true, buffer = bufnr })

	map("n", "gd", function()
		vim.lsp.buf.definition()
	end, { desc = "(LSP) Go to Definition", silent = true, buffer = bufnr })

	map("n", "K", function()
		vim.lsp.buf.hover()
	end, { desc = "(LSP) Hover", silent = true, buffer = bufnr })

	map("n", "gi", function()
		vim.lsp.buf.implementation()
	end, { desc = "(LSP) Show Implementations", silent = true, buffer = bufnr })

	map("n", "gR", function()
		vim.lsp.buf.references()
	end, { desc = "(LSP) Show References", silent = true, buffer = bufnr })

	map("n", "gr", function()
		vim.lsp.buf.rename()
	end, { desc = "(LSP) Rename Symbol", silent = true, buffer = bufnr })

	map("n", "gs", function()
		vim.lsp.buf.signature_help()
	end, { desc = "(LSP) Signature Help", silent = true, buffer = bufnr })

	map("n", "gf", function()
		vim.lsp.buf.format()
	end, { desc = "(LSP) Format Current File", silent = true, buffer = bufnr })

	map("n", "ga", function()
		vim.lsp.buf.code_action()
	end, { desc = "(LSP) Code Actions", silent = true, buffer = bufnr })
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false

		local typescript = require("typescript")
		local map = vim.keymap.set

		map("n", "gM", function()
			typescript.actions.addMissingImports()
		end, { desc = "(LSP - Typescript) Add Missing Imports" })

		map("n", "gu", function()
			typescript.actions.removeUnused()
		end, { desc = "(LSP - Typescript) Remove Unused" })

		map("n", "gO", function()
			typescript.actions.organizeImports()
		end, { desc = "(LSP - Typescript) Organize Imports" })

		map("n", "ga", function()
			typescript.actions.fixAll()
		end, { desc = "(LSP - Typescript) Fix All" })
	end

	lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local diagnostics_visible = true

M.toggle_diagnostics = function()
	diagnostics_visible = not diagnostics_visible
	if diagnostics_visible then
		vim.diagnostic.hide(nil, 0)
	else
		vim.diagnostic.show(nil, 0)
	end
end

return M
