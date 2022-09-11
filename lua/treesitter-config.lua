require("nvim-treesitter.configs").setup({
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
		enable = vim.g.rainbow,
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
			init_selection = "<CR>",
			node_incremental = "<CR>",
			scope_incremental = "<BS>",
			node_decremental = "<BS>",
		},
	},
})

require("treesitter-context").setup({
	enable = true,
	max_lines = 0,
	trim_scope = "outer",
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		-- For all filetypes
		-- Note that setting an entry here replaces all other patterns for this entry.
		-- By setting the 'default' entry below, you can control which nodes you want to
		-- appear in the context window.
		default = {
			"class",
			"function",
			"method",
			"for",
			"while",
			"if",
			"switch",
			"case",
		},
		-- Patterns for specific filetypes
		-- If a pattern is missing, *open a PR* so everyone can benefit.
		tex = {
			"chapter",
			"section",
			"subsection",
			"subsubsection",
		},
		rust = {
			"impl_item",
			"struct",
			"enum",
		},
		scala = {
			"object_definition",
		},
		vhdl = {
			"process_statement",
			"architecture_body",
			"entity_declaration",
		},
		markdown = {
			"section",
		},
		elixir = {
			"anonymous_function",
			"arguments",
			"block",
			"do_block",
			"list",
			"map",
			"tuple",
			"quoted_content",
		},
		json = {
			"pair",
		},
		yaml = {
			"block_mapping_pair",
		},
	},
	exact_patterns = {
		-- Example for a specific filetype with Lua patterns
		-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
		-- exactly match "impl_item" only)
		-- rust = true,
	},

	-- [!] The options below are exposed but shouldn't require your attention,
	--     you can safely ignore them.

	zindex = 20, -- The Z-index of the context window
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
})
