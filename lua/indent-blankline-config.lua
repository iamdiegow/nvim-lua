local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
	return
end

vim.opt.termguicolors = true
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=gold blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=orchid blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=lightskyblue blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=lightgreen blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=pink blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=dodgerblue blend=nocombine]]

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
}

indent_blankline.setup {
	space_char_blankline = " ",
	buftype_exclude = {"terminal"},
	filetype_exclude = {"help", "dashboard", "terminal", "NvimTree"},
	show_current_context = false,
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	show_char_blankline = " ",
	-- char_highlight_list = {
	-- 		"IndentBlanklineIndent1",
	-- 		"IndentBlanklineIndent2",
	-- 		"IndentBlanklineIndent3",
	-- 		"IndentBlanklineIndent4",
	-- 		"IndentBlanklineIndent5",
	-- 		"IndentBlanklineIndent6",
	-- },
}
