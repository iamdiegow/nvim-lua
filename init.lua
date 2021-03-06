require('impatient').enable_profile()

-- Global variables
vim.g.transparent_window = false
vim.g.format_on_save = false
vim.g.autocomplete = false
vim.g.rainbow = true
vim.g.current_context = false

-- 'vscode' | 'moonfly' | 'tokyonight' | 'darkplus' | 'dracula' | 'github_dark' | 'cobalt2'
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
require('nvim-colorizer-config')
require('pounce-config')
require('cybu-config')
require('neoscroll-config')
require('browse-config')
require('dressing-config')

-- LSP
require('dap-config')
require('nvim-cmp-config')
require('lsp')
