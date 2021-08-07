local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'dracula/vim', as = 'dracula'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'neovim/nvim-lspconfig'
	use 'glepnir/lspsaga.nvim'
	use 'onsails/lspkind-nvim'
	use 'kabouzeid/nvim-lspinstall'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'
	-- use 'nvim-lua/completion-nvim'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
	use 'hoob3rt/lualine.nvim'
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }
	use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
	use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use 'marko-cerovac/material.nvim'
	use 'sainnhe/everforest'
	use 'famiu/bufdelete.nvim'
	use 'terrortylor/nvim-comment'
	use 'karb94/neoscroll.nvim'
	use 'mhartington/formatter.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use 'tpope/vim-surround'
	use { 'phaazon/hop.nvim', as = 'hop' }
	use 'p00f/nvim-ts-rainbow'
end)

