local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- set leader key to space
map('n', '<Space>', '<NOP>', options )

vim.g.mapleader = ' '

-- disable highlight search
map('n', '<Leader>h', ':set hlsearch!<CR>', options)


map('n', '<C-j>', '5j', options )
map('n', '<C-k>', '5k', options )
map('n', '<C-l>', '$', options )
map('n', '<C-h>', '0', options )

-- INSERT MODE
map('i', 'jj', '<Esc>', options )
map('i', 'jk', '<Esc>', options )
map('i', 'kj', '<Esc>', options )

-- NVIM TREE
map('n', '<Leader>e', ':NvimTreeToggle<CR>', options )

