require'hop'.setup()

-- VISUAL MODE
vim.api.nvim_set_keymap('x', '<Leader>ww', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('x', '<Leader>wd', "<cmd>lua require'hop'.hint_lines()<cr>", {})


