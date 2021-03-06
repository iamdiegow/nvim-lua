require'nvim-treesitter.configs'.setup({
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
		"yaml"
	},
	highlight = {
		enable = true,
		use_languagetree = true
  },
	indent = {
    enable = true,
		disable = {}
	},
	matchup = {
    enable = false
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
			"gold"
		}
  },
	autopairs = {
		enable = true
	},
	context_commentstring = {
		enable = true,
		config = {
			javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      },
			typescriptreact = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
			}
		}
	}
})
