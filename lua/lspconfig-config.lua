vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- TYPESCRIPT LSP
local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false

	local ts_utils = require('nvim-lsp-ts-utils')

	ts_utils.setup {
		debug = false,
		disable_commands = false,
		enable_import_on_completion = false,

		import_all_timeout = 5000, -- ms
		import_all_priorities = {
				buffers = 4, -- loaded buffer names
				buffer_content = 3, -- loaded buffer content
				local_files = 2, -- git files or files with relative path markers
				same_file = 1, -- add to existing import statement
		},
		import_all_scan_buffers = 100,
		import_all_select_source = false,

		-- eslint
		eslint_enable_code_actions = false,
		eslint_enable_disable_comments = false,
		eslint_bin = "eslint_d",
		eslint_config_fallback = nil,
		eslint_enable_diagnostics = true,
		eslint_show_rule_id = true,

		-- formatting
		enable_formatting = false,
		formatter = "prettier",
		formatter_config_fallback = nil,

		-- update imports on file move
		update_imports_on_move = false,
		require_confirmation_on_move = false,
		watch_dir = nil,
	}

	-- required to fix code action ranges
	ts_utils.setup_client(client)

	-- no default maps, so you may want to define some here
	local options = {silent = true}

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", options)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", options)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", options)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", options)

end

require('null-ls').config()
require('lspconfig')['null-ls'].setup({})

require'lspconfig'.tsserver.setup {
	capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = false,
    underline = false,
		severity_sort = false,
		update_in_insert = true,
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {})

vim.cmd([[
  nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
]])

vim.cmd([[
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
]])

-- YAML yarn global add yaml-language-server
require'lspconfig'.yamlls.setup{
	capabilities = capabilities
}
-- CSS npm i -g vscode-langservers-extracted
require'lspconfig'.cssls.setup{
	capabilities = capabilities
}

-- HTML npm i -g vscode-langservers-extracted
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup {
  capabilities = capabilities,
}

-- DOCKER npm install -g dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup{
	capabilities = capabilities
}
-- JSON npm i -g vscode-langservers-extracted
require'lspconfig'.jsonls.setup({
	capabilities = capabilities,
  commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
			end
		}
	}
})
