local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	}
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

packer.init {
	display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
	}
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
	use 'marko-cerovac/material.nvim'
	-- Colorschemes
	use 'Mofiqul/vscode.nvim'
	use 'Mofiqul/dracula.nvim'
	use 'bluz71/vim-moonfly-colors'
	use 'folke/tokyonight.nvim'
  use 'lunarvim/darkplus.nvim'
	use 'projekt0n/github-nvim-theme'
	use { 'lalitmee/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' }
  use {'stevearc/dressing.nvim'}

	-- Lsp
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim"
	}
	use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
	}
  use 'neovim/nvim-lspconfig'
	use "jose-elias-alvarez/typescript.nvim"
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'onsails/lspkind-nvim'
	use({
    "glepnir/lspsaga.nvim",
    branch = "main",
	})
  use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }
	-- Workflow
	use 'rcarriga/nvim-notify'
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	use 'lewis6991/impatient.nvim'
	use({
		'lalitmee/browse.nvim',
		requires = { 'nvim-telescope/telescope.nvim' },
	})
	use 'ghillb/cybu.nvim'
	use 'mfussenegger/nvim-dap'
	use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
	use 'theHamsta/nvim-dap-virtual-text'
	use 'norcalli/nvim-colorizer.lua'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/nvim-cmp'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
	use 'luukvbaal/stabilize.nvim'
	use 'hoob3rt/lualine.nvim'
	use { 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }
	use {
	  	'nvim-telescope/telescope.nvim',
	  	requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use 'famiu/bufdelete.nvim'
	use 'terrortylor/nvim-comment'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'windwp/nvim-autopairs'
	use {
		'windwp/nvim-ts-autotag',
		config = function()
			require('nvim-ts-autotag').setup({ enable = true })
		end
	}
	use 'tpope/vim-surround'
	use { 'phaazon/hop.nvim', as = 'hop' }
	use 'rlane/pounce.nvim'
	use 'p00f/nvim-ts-rainbow'
	use 'akinsho/nvim-toggleterm.lua'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'vim-test/vim-test'
	use {
		"NTBBloodbath/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}
	use {
  	'lewis6991/gitsigns.nvim',
  	requires = {
			'nvim-lua/plenary.nvim'
  	}
	}
	use 'folke/which-key.nvim'
	use 'folke/zen-mode.nvim'
	use 'folke/twilight.nvim'
	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
	}
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
