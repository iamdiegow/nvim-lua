require'nvim-treesitter.configs'.setup({
  ensure_installed = "maintained",
	highlight = {
    enable = true
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
    enable = true,
		disable = { "tsx" },
    extended_mode = true,
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
	autotag = {
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
