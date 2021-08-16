require("indent_blankline").setup {
    char = "¦",
		buftype_exclude = {"terminal"},
		filetype_exclude = {"help", "dashboard", "terminal", "NvimTree"}

}

-- vim.g.indent_blankline_char = ''
vim.g.indent_blankline_char = "▏"
--vim.g.indent_blankline_char = '▎'
vim.g.indent_blankline_show_current_context = false
vim.g.indent_blankline_use_treesitter = false
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false


