-- Remove all trailing whitespace before save -----
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		vim.cmd([[ %s/\s\+$//e ]])
	end,
})

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- get to last cursor position -----
vim.cmd([[
	augroup last-cursor-position
			autocmd!
			autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
	augroup END
]])

-- Highlight yank
vim.cmd([[
	augroup AuYank
		autocmd!
		autocmd TextYankPost *
			\ lua vim.highlight.on_yank{higroup="IncSearch", timeout=300, on_visual=true}
	augroup END
]])

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"qf",
		"help",
		"man",
		"lspinfo",
		"grug-far",
		"lir",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

-- Keep equal size buffers
vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Fix folding in files opened with nvim-tree of telescope
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx" })

vim.api.nvim_create_autocmd("FocusGained", {
	desc = "Reload files from disk when we focus vim",
	pattern = "*",
	command = "if getcmdwintype() == '' | checktime | endif",
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	desc = "Reload files from disk",
	pattern = "*",
	command = "if getcmdwintype() == '' | checktime | endif",
})

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Every time we enter an unmodified buffer, check if it changed on disk",
	pattern = "*",
	command = "if &buftype == '' && !&modified && expand('%') != '' | exec 'checktime ' . expand('<abuf>') | endif",
})
