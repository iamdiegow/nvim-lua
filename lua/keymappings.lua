local map = vim.keymap.set
local options = { noremap = true, silent = true }

-- Nops
-- Disable accidentally pressing ctrl-z and suspending
map("n", "<c-z>", "<Nop>", options)
-- Disable ex mode
map("n", "Q", "<Nop>", options)
map("n", "gQ", "<Nop>", options)

-- NORMAL MODE ----------
map("n", "<C-z>", ":ZenMode<CR>", options)
-- set LEADER key to space
map("n", "<Space>", "<NOP>", options)
-- Disable highlight
map("n", "<BS>", "<cmd>:noh<CR>", options)
vim.g.mapleader = " "
-- Format file
map("n", "<C-f>", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", options)
-- LSP
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
-- better movement
map("n", "<C-j>", "5gjzz", options)
map("n", "<C-k>", "5gkzz", options)
-- map('n', '<C-l>', '$', options )
-- map('n', '<C-h>', '0', options )
-- window movement
-- map('n', '<C-j>', '<C-w>j', options )
-- map('n', '<C-k>', '<C-w>k', options )
map("n", "<C-l>", "<C-w>l", options)
map("n", "<C-h>", "<C-w>h", options)
-- tabs
map("n", "tt", ":tab split<CR>", options)
-- Buffer cycle
map("n", "<S-l>", ":BufferLineCycleNext<CR>", options)
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", options)
-- map('n', '<S-l>', ':bnext<CR>', options)
-- map('n', '<S-h>', ':bprev<CR>', options)
-- Tab switch buffer
map("n", "<TAB>", ":BufferLineCycleNext<CR>", options)
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", options)
-- map('n', '<TAB>', ':bnext<CR>', options)
-- map('n', '<S-TAB>', ':bprev<CR>', options)
-- better yank
map("n", "Y", "y$", options)
-- Center screen
map("n", "n", "nzzzv", options)
map("n", "N", "Nzzzv", options)
map("n", "*", "*zzzv", options)
map("n", "#", "#zzzv", options)
map("n", "<C-o>", "<C-o>zz", options)
map("n", "<C-i>", "<C-i>zz", options)
-- Resize buffers with arrows
map("n", "<C-Down>", ":resize -2<CR>", options)
map("n", "<C-Up>", ":resize +2<CR>", options)
map("n", "<C-Right>", ":vertical resize -2<CR>", options)
map("n", "<C-Left>", ":vertical resize +2<CR>", options)
-- Quickfix list
map("n", "<]q>", ":cnext<CR>", options)
map("n", "<[q>", ":cprev<CR>", options)
map("n", "<C-q>", ":TroubleToggle<CR>", options)
-- Move around wrap text with j-k
map("n", "j", "gj", options)
map("n", "k", "gk", options)
-- Save file
map("n", "<C-s>", "<cmd>w!<CR>", options)
-- move current line
map("n", "<A-j>", ":m .+1<CR>==", options)
map("n", "<A-k>", ":m .-2<CR>==", options)
-- insert empty lines
map("n", "<C-Enter>", '<cmd>call append(line("."), "")<CR>', options)
map("n", "<C-BS>", '<cmd>call append(line(".")-1, "")<CR>', options)

-- INSERT MODE ----------
-- exit insert mode
map("i", "jj", "<Esc>", options)
map("i", "jj", "<Esc>", options)
map("i", "jk", "<Esc>", options)

-- move current line
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", options)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", options)

-- navigate within insert mode
map("i", "<C-h>", "<Left>", options)
map("i", "<C-l>", "<Right>", options)
map("i", "<C-j>", "<Down>", options)
map("i", "<C-k>", "<Up>", options)

map("i", "<A-l>", "<C-Right>", options)
map("i", "<A-h>", "<C-Left>", options)
map("i", "<A-a>", "<ESC>A", options)
map("i", "<A-b>", "<ESC>I", options)

-- insert empty lines
map("i", "<C-Enter>", "<ESC>o", options)
map("i", "<C-BS>", "<ESC>O", options)

-- VISUAL MODE -----------
-- better indenting
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

map("v", "<C-l>", "$", options)
map("v", "<C-h>", "0", options)

map("v", "<C-j>", "5j", options)
map("v", "<C-k>", "5k", options)

-- VISUAL BLOCK MODE
map("x", "<A-j>", ":m '>+1<CR>gv-gv", options)
map("x", "<A-k>", ":m '<-2<CR>gv-gv", options)

map("x", "y", "ygv<Esc>")

-- Create only for Diffview filetype
vim.api.nvim_create_autocmd("FileType", {
	pattern = "DiffviewFiles",
	callback = function()
		map("n", "q", ":DiffviewClose<CR>", options)
	end,
})

-- Create only for Diffview filetype
vim.api.nvim_create_autocmd("FileType", {
	pattern = "httpResult",
	callback = function()
		map("n", "q", ":q!<CR>", options)
	end,
})

vim.keymap.set("n", "<Leader>is", function()
	vim.o.spell = not vim.o.spell
	print("spell: " .. tostring(vim.o.spell))
end, { desc = "Toggle Spelling" })
