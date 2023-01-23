return {
	"folke/lazy.nvim",

	-- Colorschemes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "moon",
		},
	},

	-- Workflow
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
	},
	"theHamsta/nvim-dap-virtual-text",
	"norcalli/nvim-colorizer.lua",
	"famiu/bufdelete.nvim",
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

	-- Completion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/nvim-cmp",

	-- UI
	{
		"luukvbaal/stabilize.nvim",
		event = "VeryLazy",
		config = function()
			require("stabilize").setup({
				force = true,
				forcemark = nil,
				ignore = {
					filetype = { "help", "list", "NvimTree" },
					buftype = { "terminal", "quickfix", "loclist" },
				},
				nested = nil,
			})
		end,
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
}
