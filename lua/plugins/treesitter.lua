return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
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
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]]"] = "@function.outer",
						["]c"] = { query = "@class.outer", desc = "Next class start" },
						["]o"] = "@loop.*",
						["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
						["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
					goto_next_end = {
						["]["] = "@function.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[]"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = {
						["[["] = "@function.outer",
						["[C"] = "@class.outer",
					},
					goto_next = {
						["]d"] = "@conditional.outer",
					},
					goto_previous = {
						["[d"] = "@conditional.outer",
					},
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
				enable_close_on_slash = false,
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
