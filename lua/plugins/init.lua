return {
	"folke/lazy.nvim",
	-- Colorschemes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm",
		},
	},

	-- Workflow
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
	},
	"theHamsta/nvim-dap-virtual-text",
	"famiu/bufdelete.nvim",
	"tpope/vim-surround",
	"MaxMEllon/vim-jsx-pretty",

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
	"p00f/nvim-ts-rainbow",
	"norcalli/nvim-colorizer.lua",
}
