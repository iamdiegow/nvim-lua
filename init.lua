require('plugins')
require('keymappings')
require('settings')
require('compe-config')
require('lualine-config')
require('bufferline-config')
require('nvim-tree-config')
require('treesitter-config')
require('lsp.lua-ls')

require'lspconfig'.tsserver.setup{}
require('lspkind').init({})
