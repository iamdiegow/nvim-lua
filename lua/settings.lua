local o = vim.o
local wo = vim.wo
local bo = vim.bo

wo.number = true
wo.relativenumber = false

o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
-- o.laststatus = 0
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.colorcolumn = "80"
o.syntax = 'enable'
o.hidden = true
o.splitbelow = true
o.clipboard = 'unnamedplus'
o.timeoutlen = 500
o.updatetime = 300
o.background = 'dark'
o.autoindent = true
o.cmdheight = 1
o.mouse = 'a'
o.tabstop = 2
o.signcolumn = "yes"
o.showmode = false
o.backup = false
o.writebackup = false
o.cursorline = true
o.termguicolors = true

bo.tabstop = 2
bo.shiftwidth = 2

-- vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
-- vim.cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
-- vim.cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
-- vim.cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
-- vim.cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
-- vim.cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
vim.cmd('colorscheme dracula')
