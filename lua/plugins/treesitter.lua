return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = {
			ensure_installed = {
				"javascript",
				"typescript",
				"css",
				"scss",
				"html",
				"json",
				"lua",
				"dockerfile",
				"graphql",
				"hjson",
				"http",
				"markdown",
				"tsx",
				"regex",
				"yaml",
				"fish",
				"jsdoc",
			},
			highlight = {
				enable = true,
				extended_mode = true,
				use_languagetree = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
			indent = {
				enable = true,
				disable = {},
			},
			matchup = {
				enable = true,
			},
			select = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			incremental_selection = {
				enable = false,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		-- event = "BufReadPost",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close_on_slash = false,
					enable_rename = true,
					enable_close = true,
				},
			})
		end,
	},
	{
		{
			"Wansmer/treesj",
			keys = {
				{
					"J",
					function()
						require("treesj").toggle({ recursive = true })
					end,
					desc = "Toggle join/split",
				},
			},
			dependencies = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("treesj").setup({
					use_default_keymaps = false,
				})
			end,
		},
	},
}
