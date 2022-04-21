-- Remove all trailing whitespace before save -----
vim.api.nvim_exec([[
  augroup TrimWhiteSpace
    au!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END
]], false)

-- Prevent new line to start with comment -----
vim.cmd([[
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

-- get to last cursor position -----
vim.cmd([[
	augroup last-cursor-position
			autocmd!
			autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
	augroup END
]])

-- Highlight yank -----
vim.cmd([[
	augroup AuYank
		autocmd!
		autocmd TextYankPost *
			\ lua vim.highlight.on_yank{higroup="IncSearch", timeout=300, on_visual=true}
	augroup END
]])
