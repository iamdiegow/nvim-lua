local map = vim.keymap.set
local options = { noremap = true, silent = true }

-- Nops
-- Disable ex mode
map("n", "Q", "<Nop>", options)
map("n", "gQ", "<Nop>", options)

-- NORMAL MODE ----------
-- set LEADER key to space
map("n", "<Space>", "<NOP>", options)
-- Disable highlight
map("n", "<BS>", "<cmd>:noh<CR>", options)
-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

map("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit", noremap = true, silent = true })
map("n", "<leader>ii", "<cmd>set invlist<CR>", { desc = "Toggle white space and tabs", noremap = true, silent = true })

map("n", "<C-S-l>", "<cmd>Lazy<CR>", { desc = "Lazy", noremap = true, silent = true })

-- Movement
map("n", "<C-j>", "5gjzz", options)
map("n", "<C-k>", "5gkzz", options)

map("n", "<C-l>", "<C-w>l", options)
map("n", "<C-h>", "<C-w>h", options)

map("n", "<leader>-", "<C-w>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-w>v", { desc = "Split Window Right", remap = true })
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
map("n", "<C-q>", ":copen<CR>", options)
-- Move around wrap text with j-k
map("n", "j", "gj", options)
map("n", "k", "gk", options)
-- Save file
map("n", "<C-s>", "<cmd>w!<CR>", options)
-- move current line
map("n", "<A-j>", ":m .+1<CR>==", options)
map("n", "<A-k>", ":m .-2<CR>==", options)
-- insert empty lines
map("n", "<leader><CR>", '<cmd>call append(line("."), "")<CR>', options)
map("n", "<leader>\\", '<cmd>call append(line(".")-1, "")<CR>', options)

-- INSERT MODE ----------
-- exit insert mode
map("i", "jk", "<Esc>", options)

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

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

-- insert empty line
map("i", "<C-Enter>", "<ESC>o", options)
map("i", "<C-\\>", "<ESC>O", options)

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

-- Search and Replace
map("n", "<leader>SS", ":%s/\\v", { desc = "Substitute in same line" })
map("n", "<leader>Ss", ":s/\\v", { desc = "Substitute and replace in file" })
map("v", "<leader>Sv", ":s/\\%V", { desc = "Substitute in visual selection" })

vim.keymap.set("n", "<Leader>is", function()
	vim.o.spell = not vim.o.spell
	print("spell: " .. tostring(vim.o.spell))
end, { desc = "Toggle Spelling" })

vim.keymap.set(
	"n",
	"<leader>Sf",
	':let @+ = expand("%:p")<cr>:lua print("Copied path to: " .. vim.fn.expand("%:p"))<cr>',
	{ desc = "Copy current file name and path", silent = false }
)
