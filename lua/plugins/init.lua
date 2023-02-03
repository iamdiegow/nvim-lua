return {
	"folke/lazy.nvim",
	-- Colorschemes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			styles = {
				comments = { italic = false },
				keywords = { italic = false, bold = false },
				sidebars = "normal",
				floats = "normal",
			},
			on_highlights = function(hl, c)
				hl.CursorLineNr = { fg = c.orange, bold = false }
				hl.LineNr = { fg = c.orange, bold = true }
				hl.LineNrAbove = { fg = c.fg_gutter }
				hl.LineNrBelow = { fg = c.fg_gutter }
			end,
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
