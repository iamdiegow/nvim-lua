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
