return {
	-- Colorschemes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Performance
	"lewis6991/impatient.nvim",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/typescript.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"onsails/lspkind-nvim",
	"glepnir/lspsaga.nvim",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/nvim-treesitter-context",

	-- Workflow
	"folke/which-key.nvim",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},
	"nvim-neotest/neotest-vim-test",
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"TimUntersberger/neogit",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"lalitmee/browse.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
	},
	"theHamsta/nvim-dap-virtual-text",
	"norcalli/nvim-colorizer.lua",
	"famiu/bufdelete.nvim",
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({ enable = true })
		end,
	},
	"tpope/vim-surround",
	"p00f/nvim-ts-rainbow",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"vim-test/vim-test",
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Completion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/nvim-cmp",

	-- File explorer
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
	},

	-- UI
	"luukvbaal/stabilize.nvim",
	"hoob3rt/lualine.nvim",
	{
		"akinsho/nvim-bufferline.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	"akinsho/nvim-toggleterm.lua",
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
	"lukas-reineke/indent-blankline.nvim",
}
