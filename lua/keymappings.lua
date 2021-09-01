local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }


-- Disable accidentally pressing ctrl-z and suspending
map('n', '<c-z>', '<Nop>', options )
-- Disable ex mode
map('n', 'Q', '<Nop>', options )

-- NORMAL MODE ----------
-- set LEADER key to space
vim.g.mapleader = ' '
map('n', '<Space>', '<NOP>', options )
-- better movement
-- map('n', '<C-j>', '5j', options )
-- map('n', '<C-k>', '5k', options )
-- map('n', '<C-l>', '$', options )
-- map('n', '<C-h>', '0', options )
map('n', '<C-j>', '<C-w>j', options )
map('n', '<C-k>', '<C-w>k', options )
map('n', '<C-l>', '<C-w>l', options )
map('n', '<C-h>', '<C-w>h', options )
-- better yank
map('n', 'Y', 'y$', options )
-- search and center
map('n', 'n', 'nzzzv', options )
map('n', 'N', 'Nzzzv', options )
-- Tab switch buffer
map('n', '<TAB>', ':bnext<CR>', options )
map('n', '<S-TAB>', ':bprevious<CR>', options )
-- Resize buffers with arrows
map('n', '<C-Up>', ':resize -2<CR>', options )
map('n', '<C-Down>', ':resize +2<CR>', options )
map('n', '<C-Left>', ':vertical resize -2<CR>', options )
map('n', '<C-Right>', ':vertical resize +2<CR>', options )

-- quickfix list
map('n', '<]q>', ':cnext<CR>', options )
map('n', '<[q>', 'cprev<CR>', options )
map('n', '<C-q>', ':TroubleToggle<CR>', options )

-- Telescope Fuzzy find file
map('n', '<C-_>', ':lua require("telescope-config").fuzzy_find_file()<CR>', options )

map('n', '<C-s>', '<cmd>w!<CR>', options )
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

map('v', '<C-l>', '$', options )
map('v', '<C-h>', '0', options )

map('v', '<C-j>', '5j', options )
map('v', '<C-k>', '5k', options )

-- VISUAL BLOCK MODE
map('x', '<A-j>', ':m \'>+1<CR>gv-gv', options )
map('x', '<A-k>', ':m \'<-2<CR>gv-gv', options )
map('x', '<C-_>', ':CommentToggle<CR>', options )

-- map("", "j", 'v:count ? "j" : "gj"', {expr = true})
-- map("", "k", 'v:count ? "k" : "gk"', {expr = true})
