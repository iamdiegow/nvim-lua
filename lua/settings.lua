local o = vim.o
-- local wo = vim.wo
-- local bo = vim.bo

o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
-- o.laststatus = 0
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.number = true
o.relativenumber = false
o.colorcolumn = "80"
o.syntax = 'enable'
o.hidden = true
o.splitbelow = true
o.clipboard = 'unnamedplus'
o.timeoutlen = 300
o.updatetime = 300
o.background = 'dark'
o.autoindent = true
o.cmdheight = 2
o.mouse = 'a'
o.tabstop = 2
o.signcolumn = "yes"
o.showmode = false
o.backup = false
o.writebackup = false

vim.cmd('colorscheme dracula')
