require('plugins')
require('keymappings')
require('settings')
require('compe-config')
require('lsp.lua-ls')

require'lspconfig'.tsserver.setup{}
