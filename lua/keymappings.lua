local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }


-- NORMAL MODE ----------
-- set LEADER key to space
vim.g.mapleader = ','
map('n', '<Space>', '<NOP>', options )
map("n", "<Leader>sv", ":luafile ~/.config/nvim/init.lua<CR>", options )
-- disable highlight search
map('n', '<Leader>h', ':set hlsearch!<CR>', options)
-- exit buffer
map('n', '<Leader>q', ':wq<CR>', options)
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
-- Resize buffers with arrows
map('n', '<C-Up>', ':resize -2<CR>', options )
map('n', '<C-Down>', ':resize +2<CR>', options )
map('n', '<C-Left>', ':vertical resize -2<CR>', options )
map('n', '<C-Right>', ':vertical resize +2<CR>', options )

-- INSERT MODE ----------
-- exit insert mode
map('i', 'jj', '<Esc>', options )
map('i', 'jk', '<Esc>', options )
map('i', 'kj', '<Esc>', options )

-- move current line
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', options )
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', options )


-- VISUAL MODE -----------
-- better indenting
map('v', '<', '<gv', options )
map('v', '>', '>gv', options )

-- VISUAL BLOCK MODE
map('x', '<A-j>', ':m \'>+1<CR>gv-gv', options )
map('x', '<A-k>', ':m \'<-2<CR>gv-gv', options )


-- NVIM TREE
-- toggle nvim tree
map('n', '<Space>e', ':NvimTreeToggle<CR>', options )

-- TERMINAL
-- open terminal below
map('n', '<C-x>', ':10new +terminal | setlocal nobuflisted <CR>', options ) 
-- open terminal in new buffer
map('n', '<C-t>', ':terminal<CR>' , options )
-- escape terminal mode
map('t', '<C-\\>', '<C-\\><C-n>', options )
-- terminal window navigation
map('t', '<C-h>', '<C-\\><C-N><C-w>h', options )
map('t', '<C-j>', '<C-\\><C-N><C-w>j', options )
map('t', '<C-k>', '<C-\\><C-N><C-w>k', options )
map('t', '<C-l>', '<C-\\><C-N><C-w>l', options )
