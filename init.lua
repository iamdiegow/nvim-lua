-- vim.g.start_time = vim.fn.reltime()
vim.g.transparent_window = true
vim.g.format_on_save = false
-- 'vscode' | 'moonfly' | 'tokyonight' | 'darkplus'
vim.g.color_theme = 'darkplus'
vim.g.highlight_document = false

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
require('nvim-web-devicons-config')
require('zen-mode-config')
require('stabilize-config')

-- LSP
require('nvim-cmp-config')
require('lsp')
