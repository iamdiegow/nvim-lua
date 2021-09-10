vim.g.start_time = vim.fn.reltime()

-- Core
require('plugins')
require('keymappings')
require('settings')
require('colorscheme')

-- Plugin config
require('lualine-config')
require('bufferline-config')
require('nvim-tree-config')
require('treesitter-config')
require('telescope-config')
require('nvim-comment-config')
require('formatter-config')
require('indent-blankline-config')
require('nvim-autopairs-config')
require('nvim-ts-autotag-config')
require('hop-config')
require('nvim-toggleterm-config')
require('gitsigns-config')
require('which-key-config')
require('trouble-config')
require('dashboard-config')
require('nvim-web-devicons-config')
--require('nvim-dap-config')

-- LSP
require('lsp')
require('compe-config')
require('lspconfig-config')
require('lspsaga-config')

