local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	-- Colorschemes
	use 'Mofiqul/vscode.nvim'
	-- Lsp
  use 'neovim/nvim-lspconfig'
	use 'kabouzeid/nvim-lspinstall'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'
	use 'onsails/lspkind-nvim'
	use {
  "ray-x/lsp_signature.nvim",
	}
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }
	-- Workflow
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
	use 'hoob3rt/lualine.nvim'
	use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
	use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use 'famiu/bufdelete.nvim'
	use 'terrortylor/nvim-comment'
	use 'mhartington/formatter.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use 'tpope/vim-surround'
	use { 'phaazon/hop.nvim', as = 'hop' }
	use 'p00f/nvim-ts-rainbow'
	use {"akinsho/nvim-toggleterm.lua"}
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'vim-test/vim-test'
	use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  	}
	}
	use 'moll/vim-node'
	use 'folke/which-key.nvim'
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	}
	use 'glepnir/dashboard-nvim'
	use 'vimwiki/vimwiki'
end)

