local protocol = require'vim.lsp.protocol'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	client.resolved_capabilities.document_formatting = false

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>E', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- formatting
  -- if client.resolved_capabilities.document_formatting then
  --   vim.api.nvim_command [[augroup Format]]
  --   vim.api.nvim_command [[autocmd! * <buffer>]]
  --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
  --   vim.api.nvim_command [[augroup END]]
  -- end

	  -- define an alias
  vim.cmd("command -buffer Formatting lua vim.lsp.buf.formatting()")

  -- format on save
  -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
  vim.cmd("autocmd BufWritePost <buffer> :Format")

	local ts_utils = require('nvim-lsp-ts-utils')

	ts_utils.setup {
		debug = false,
		disable_commands = false,
		enable_import_on_completion = false,

		-- import all
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
		eslint_enable_code_actions = true,
		eslint_enable_disable_comments = true,
		eslint_bin = "eslint",
		eslint_config_fallback = nil,
		eslint_enable_diagnostics = false,
		eslint_show_rule_id = false,

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

  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

require'lspconfig'.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" }
}

-- require'lspconfig'.diagnosticls.setup {
--   on_attach = on_attach,
--   filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
--   init_options = {
--     linters = {
--       eslint = {
--         command = 'eslint_d',
--         rootPatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'eslint_d',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--     },
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--     },
--     formatters = {
--       eslint_d = {
--         command = 'eslint_d',
--         args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
--         rootPatterns = { '.git' },
--       },
--       prettier = {
--         command = 'prettier',
--         args = { '--stdin-filepath', '%filename' }
--       }
--     },
--     formatFiletypes = {
--       css = 'prettier',
--       javascript = 'eslint_d',
--       javascriptreact = 'eslint_d',
--       scss = 'prettier',
--       less = 'prettier',
--       typescript = 'eslint_d',
--       typescriptreact = 'eslint_d',
--       json = 'prettier',
--       markdown = 'prettier',
--     }
--   }
-- }

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
    underline = false,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {    
      spacing = 4,
      prefix = ''
    }
  }
)

vim.cmd([[
  nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
  nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
  nnoremap <silent> <leader>et <cmd>lua vim.lsp.diagnostic.clear()<CR>
]])

vim.cmd([[
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
  autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
]])

-- YAML
require'lspconfig'.yamlls.setup({})
