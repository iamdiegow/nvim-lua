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
	use "kabouzeid/nvim-lspinstall"
	use 'nvim-lua/completion-nvim'
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
	use 'famiu/bufdelete.nvim'
	use 'terrortylor/nvim-comment'
	use 'karb94/neoscroll.nvim'
	use 'mhartington/formatter.nvim'
end)

