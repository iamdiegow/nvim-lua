
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
