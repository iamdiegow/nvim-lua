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
vim.opt.scrolloff = 5
vim.opt.guicursor = ""
vim.opt.confirm = true
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "screen"

wo.number = true
wo.numberwidth = 2
wo.relativenumber = true

o.swapfile = false
o.dir = "/tmp"
o.smartcase = true
o.laststatus = 3
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 5
o.scroll = 5
-- o.colorcolumn = "80"
o.syntax = "enable"
o.hidden = true
o.splitbelow = true
o.splitright = true
o.clipboard = "unnamedplus"
o.timeoutlen = 300
o.updatetime = 300
o.background = "dark"
o.autoindent = true
o.cmdheight = 1
o.mouse = "a"
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

vim.cmd([[
 highlight WinSeparator guibg=None
]])

vim.cmd([[
 set listchars=tab:▸\ ,trail:▓,nbsp:░,eol:↲,space:•
]])

-- vim.cmd([[
-- 	set listchars=tab:▸\ ,trail:▓,nbsp:░,eol:↲
-- ]])

-- Neovide config
if vim.g.neovide then
	-- vim.o.guifont = "MesloLGSDZ Nerd Font Mono:h12"
	-- vim.o.guifont = "JetBrainsMonoNL NFM:h12"
	-- vim.o.guifont = "IosevkaTerm NFM:h14"
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	vim.g.neovide_transparency = 0.97
	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_cursor_animation_length = 0
end
