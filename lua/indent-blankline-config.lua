local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
	return
end

vim.opt.termguicolors = true

indent_blankline.setup {
	char = "┆",
	context_char = "┆",
	buftype_exclude = {"terminal", "nofile"},
	filetype_exclude = {
		"help",
		"dashboard",
		"packer",
		"NvimTree",
		"Trouble",
	},
	show_current_context = true,
	show_current_context_start = true,
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	space_char_blankline = " ",
	show_end_of_line = true,
	use_treesitter = true
}
