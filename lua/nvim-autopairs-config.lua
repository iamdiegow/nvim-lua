require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
	check_ts = true
})
require('nvim-autopairs.completion.cmp').setup({
	map_cr = true,
	map_complete = true,
	auto_select = true,
	insert = false,
	map_char = {
		all = '(',
		tex = '{'
	}
})
