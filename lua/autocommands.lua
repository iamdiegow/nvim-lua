-- Remove all trailing whitespace before save -----
vim.api.nvim_exec([[
  augroup TrimWhiteSpace
    au!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END
]], false)

-- -- Prevent new line to start with comment -----
-- vim.cmd([[
-- 	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
-- ]])

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

-- Set cursorline on active buffer
vim.cmd([[
	augroup CursorLineOnlyInActiveWindow
		autocmd!
		autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
		autocmd WinLeave * setlocal nocursorline
	augroup END
]])

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir", "dap-float", "dap-repl" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

if vim.g.enable_winbar then
	vim.api.nvim_create_autocmd(
	{ "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
	{
		callback = function()
			local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
			if not status_ok then
				require("winbar-config").get_winbar()
			end
		end,
	}
)
end
