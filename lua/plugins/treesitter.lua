return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
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
			},
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = {
				enable = true,
				disable = {},
			},
			matchup = {
				enable = false,
			},
			select = {
				enable = false,
			},
			rainbow = {
				enable = true,
				extended_mode = false,
				max_file_lines = 1000,
				colors = {
					"orchid",
					"lightskyblue",
					"gold",
				},
			},
			autopairs = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
				config = {
					javascript = {
						__default = "// %s",
						jsx_element = "{/* %s */}",
						jsx_fragment = "{/* %s */}",
						jsx_attribute = "// %s",
						comment = "// %s",
					},
					typescriptreact = {
						__default = "// %s",
						jsx_element = "{/* %s */}",
						jsx_fragment = "{/* %s */}",
						jsx_attribute = "// %s",
						comment = "// %s",
					},
				},
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<BS>",
					node_decremental = "<BS>",
				},
			},
		},
	},
}
