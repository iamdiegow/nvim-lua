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
				enable = true,
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>si",
					node_decremental = "<leader>sd",
					scope_incremental = "<leader>sc",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPost",
		config = function()
			require("nvim-ts-autotag").setup({
				enable = true,
				enable_close_on_slash = false,
				enable_rename = true,
				enable_close = true,
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
