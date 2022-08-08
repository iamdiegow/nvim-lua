local M = {}

if vim.g.diagnostics_hover_window == true then
	vim.o.updatetime = 250
	vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
end

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
    --   active = signs,
    -- },
		signs = false,
    update_in_insert = true,
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
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
	local map = vim.api.nvim_buf_set_keymap
  map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- map(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- map(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  map(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  map(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    opts
  )
  map(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  -- map(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false

		require('typescript').setup({
	    disable_commands = false,
			debug = false,
		})
  end

  vim.g.navic_silence = true
	require'nvim-navic'.attach(client, bufnr)

  lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local diagnostics_visible = true
M.toggle_diagnostics = function()
	diagnostics_visible = not diagnostics_visible
	if diagnostics_visible then
		vim.diagnostic.hide(nil, 0)
		require'notify'('diagnostics off', 'error', { render = 'minimal' })
	else
		vim.diagnostic.show(nil, 0)
		require'notify'('diagnostics on', 'info', { render = 'minimal' })
	end
end

return M
