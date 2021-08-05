local ts = require('nvim-treesitter.configs')
ts.setup({
  ensure_installed = "maintained",
	highlight = {
    enable = true
  },
	indent = {
    enable = true,
		disable = { "yaml" }
	},
	matchup = {
    enable = false
  },
	select = {
    enable = false,
  },
  rainbow = {
    enable = false,
    extended_mode = true,
    max_file_lines = 1000,
  },
	autopairs = {
		enable = true
	},
	autotag = {
     enable = true
  }
})
