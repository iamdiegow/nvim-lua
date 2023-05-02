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
		signs = {
			active = signs,
		},
		update_in_insert = false,
		underline = true,
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
	end, { desc = "(LSP) Go to declaration", silent = true, buffer = bufnr })

	map("n", "gd", function()
		vim.lsp.buf.definition()
	end, { desc = "(LSP) Go to definition", silent = true, buffer = bufnr })

	map("n", "K", function()
		vim.lsp.buf.hover()
	end, { desc = "(LSP) Hover", silent = true, buffer = bufnr })

	map("n", "gi", function()
		vim.lsp.buf.implementation()
	end, { desc = "(LSP) show implementations", silent = true, buffer = bufnr })

	map("n", "gr", function()
		vim.lsp.buf.references()
	end, { desc = "(LSP) Show references", silent = true, buffer = bufnr })

	map("n", "gR", function()
		vim.lsp.buf.rename()
	end, { desc = "(LSP) Rename Symbol", silent = true, buffer = bufnr })
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false

		local typescript = require("typescript")
		local map = vim.keymap.set

		map("n", "gM", function()
			typescript.actions.addMissingImports()
		end, { desc = "(Typescript) Add Missing Imports" })

		map("n", "gu", function()
			typescript.actions.removeUnused()
		end, { desc = "(Typescript) Remove Unused" })

		map("n", "gO", function()
			typescript.actions.organizeImports()
		end, { desc = "(Typescript) Organize Imports" })

		map("n", "ga", function()
			typescript.actions.fixAll()
		end, { desc = "(Typescript) Fix All" })
	end

	lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

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
		require("notify")("diagnostics off", "error", { render = "minimal" })
	else
		vim.diagnostic.show(nil, 0)
		require("notify")("diagnostics on", "info", { render = "minimal" })
	end
end

return M
