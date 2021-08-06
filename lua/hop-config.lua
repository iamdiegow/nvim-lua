require'hop'.setup()

-- NORMAL MODE
vim.api.nvim_set_keymap('n', '<Leader>ww', ":HopWord<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>wa', ":HopChar1<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>ws', ":HopChar2<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>wd', ":HopLine<CR>", {})

-- VISUAL MODE
vim.api.nvim_set_keymap('x', '<Leader>ww', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('x', '<Leader>wd', "<cmd>lua require'hop'.hint_lines()<cr>", {})


