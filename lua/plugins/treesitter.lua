return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = "BufReadPost",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/playground",
			"HiPhish/nvim-ts-rainbow2",
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
				"help",
			},
			highlight = {
				enable = true,
				use_languagetree = true,
				additional_vim_regex_highlighting = true,
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
			autotag = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			rainbow = {
				enable = true,
				query = "rainbow-parens",
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
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufReadPre",
		config = function()
			require("treesitter-context").setup({
				enable = true,
			})
		end,
	},
	{
		"danymat/neogen",
		keys = {
			{
				"<leader>nc",
				function()
					require("neogen").generate()
				end,
				desc = "add function comment (NEOGEN)",
			},
		},
		config = true,
	},
}
