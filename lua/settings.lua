local o = vim.o
local wo = vim.wo
local bo = vim.bo

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldnestmax = 10
vim.opt.foldenable = false
vim.opt.foldlevel = 10
vim.opt.lazyredraw = true
vim.opt.encoding = "UTF-8"
vim.opt.showmatch = true
--vim.opt.fillchars = { vert = ' '}
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.ruler = false
vim.opt.pumheight = 10
vim.opt.scrolloff = 8

wo.number = false
wo.numberwidth = 2
wo.relativenumber = false

o.swapfile = false
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 3
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 0
o.scroll = 5
-- o.colorcolumn = "80"
o.syntax = 'enable'
o.hidden = true
o.splitbelow = true
o.splitright = true
o.clipboard = 'unnamedplus'
o.timeoutlen = 300
o.updatetime = 300
o.background = 'dark'
o.autoindent = true
o.cmdheight = 1
o.mouse = 'a'
o.tabstop = 2
o.shiftwidth = 2
o.signcolumn = "yes"
o.showmode = false
o.backup = false
o.writebackup = false
o.cursorline = false
o.cursorcolumn = false
o.wrap = true

bo.tabstop = 2
bo.shiftwidth = 2
bo.autoindent = false

vim.cmd([[ set shortmess+=sI ]])
vim.cmd([[ set iskeyword+=- ]])

vim.cmd([[ let g:vimwiki_global_ext = 0 ]])

if vim.g.transparent_window then
	vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi LineNr ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
	vim.cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
end

vim.cmd([[
 highlight WinSeparator guibg=None
]])
