require'hop'.setup({
	keys = 'asdfhjklwqeryuio'
})

-- VISUAL MODE
vim.api.nvim_set_keymap('x', '<Leader>ww', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('x', '<Leader>wd', "<cmd>lua require'hop'.hint_lines()<cr>", {})
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})


