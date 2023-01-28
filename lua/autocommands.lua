-- Remove all trailing whitespace before save -----
vim.api.nvim_exec([[
  augroup TrimWhiteSpace
    au!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END
]], false)

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd "set formatoptions-=cro"
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
		"spectre_panel",
		"lir",
		"dap-float",
		"dap-repl",
		"httpResult",
		"lspsagaoutline",
		"neotest-summary",
		"neotest-output",
		"neotest-output-panel",
	},
	callback = function()
		vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
	end,
})

-- Keep equal size buffers
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
