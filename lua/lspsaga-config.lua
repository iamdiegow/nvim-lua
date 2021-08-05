local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",

}

vim.api.nvim_set_keymap('n', '<Leader>D', ':Lspsaga diagnostics_jump_next<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', ':Lspsaga signature_help<CR>', { noremap = true, silent = true })


vim.cmd("")
vim.cmd([[
	nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
	nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
	nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
	nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
	nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
	nnoremap <silent> gs :Lspsaga signature_help<CR>
	nnoremap <silent> GD :Lspsaga preview_definition<CR>
	nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
	nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
	nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
]])
