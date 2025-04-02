local M = {}

M.setup = function()
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
		vim.lsp.buf.hover({ border = "single" })
	end, { desc = "(LSP) Hover", silent = true, buffer = bufnr })

	map("n", "gh", function()
		vim.lsp.buf.hover()
	end, { desc = "(LSP) Hover", silent = true, buffer = bufnr })

	map("n", "gi", function()
		vim.lsp.buf.implementation()
	end, { desc = "(LSP) Show Implementations", silent = true, buffer = bufnr })

	map("n", "gr", function()
		vim.lsp.buf.references()
	end, { desc = "(LSP) Show References", silent = true, buffer = bufnr })

	map("n", "gR", function()
		vim.lsp.buf.rename()
	end, { desc = "(LSP) Rename Symbol", silent = true, buffer = bufnr })

	map("n", "gs", function()
		vim.lsp.buf.signature_help({ border = "single" })
	end, { desc = "(LSP) Signature Help", silent = true, buffer = bufnr })

	map("n", "ga", function()
		vim.lsp.buf.code_action()
	end, { desc = "(LSP) Code Actions", silent = true, buffer = bufnr })

	map("n", "gI", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
	end, { desc = "(LSP) Toggle Inlay Hint" })
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local status_ok, blink_cmp = pcall(require, "blink.cmp")
if not status_ok then
	return
end

M.capabilities = blink_cmp.get_lsp_capabilities(capabilities)

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
