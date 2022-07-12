-- vim.g.start_time = vim.fn.reltime()
vim.g.transparent_window = true
vim.g.format_on_save = false
vim.g.autocomplete = false
vim.g.rainbow = true
vim.g.current_context = false

-- 'vscode' | 'moonfly' | 'tokyonight' | 'darkplus' | 'dracula' | 'github'
vim.g.color_theme = 'github_dark'
vim.g.highlight_document = false
vim.g.diagnostics_hover_window = false

-- Core
require('plugins')
require('keymappings')
require('settings')
require('colorscheme')
require('autocommands')

-- Plugin config
require('lualine-config')
require('bufferline-config')
require('nvim-tree-config')
require('treesitter-config')
require('telescope-config')
require('nvim-comment-config')
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
require('symbols-outline-config')
require('nvim-colorizer-config')
require('pounce-config')
require('dap/dap-config')
require('focus-config')

-- LSP
require('nvim-cmp-config')
require('lsp')
