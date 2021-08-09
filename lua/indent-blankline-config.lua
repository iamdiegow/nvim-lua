require("indent_blankline").setup {
    char = "¦",
    		buftype_exclude = {"terminal"}
}

vim.cmd([[
	let g:indent_blankline_char = ''
	"let g:indent_blankline_char = '▎'
	let g:indent_blankline_use_treesitter = v:true
]])

