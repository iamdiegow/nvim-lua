local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- NORMAL MODE ----------
-- set LEADER key to space
map('n', '<Space>', '<NOP>', options )
vim.g.mapleader = ' '
-- disable highlight search
map('n', '<Leader>h', ':set hlsearch!<CR>', options)
-- better movement
map('n', '<C-j>', '5j', options )
map('n', '<C-k>', '5k', options )
map('n', '<C-l>', '$', options )
map('n', '<C-h>', '0', options )
-- better yank
map('n', 'Y', 'y$', options )
-- search and center
map('n', 'n', 'nzzzv', options )
map('n', 'N', 'Nzzzv', options )
-- disable highlight on search
map('n', '<Leader>h', ':noh<CR>', options )
-- Tab switch buffer
map('n', '<TAB>', ':bnext<CR>', options )
map('n', '<S-TAB>', ':bprevious<CR>', options )

-- INSERT MODE ----------
-- exit INSERT mode
map('i', 'jj', '<Esc>', options )
map('i', 'jk', '<Esc>', options )
map('i', 'kj', '<Esc>', options )

-- VISUAL MODE -----------
-- better indenting
map('v', '<', '<gv', options )
map('v', '>', '>gv', options )


-- NVIM TREE
-- toggle nvim tree
map('n', '<Leader>e', ':NvimTreeToggle<CR>', options )
