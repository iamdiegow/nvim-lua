require'hop'.setup()

vim.api.nvim_set_keymap('n', '<Leader>ww', ":HopWord<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>wa', ":HopChar1<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>ws', ":HopChar2<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>wd', ":HopLine<CR>", {})

