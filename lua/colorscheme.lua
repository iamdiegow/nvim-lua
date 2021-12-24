-- VSCODE
local vscodeTheme = function()
	-- 'light' | 'dark'
	vim.g.vscode_style = "dark"
	vim.cmd([[
		colorscheme vscode
	]])
end

local moonflyTheme = function()
	vim.g.moonflyCursorColor = 1
	vim.g.moonflyItalics = 1
	vim.g.moonflyUnderlineMatchingParen = 1
	vim.cmd([[
		colorscheme moonfly
	]])
end

local tokyonightTheme = function()
	-- 'night' | 'storm' | 'day'
	vim.g.tokyonight_style = "night"
	vim.g.tokyonight_terminal_colors = true
	vim.g.tokyonight_italic_comments = true
	vim.g.tokyonight_italic_keywords = false
	vim.g.tokyonight_italic_variables = false
	vim.g.tokyonight_italic_variables = false
	vim.g.tokyonight_dark_sidebar = true
	vim.g.tokyonight_lualine_bold = true
	vim.cmd([[
		colorscheme tokyonight
	]])
end

local darkplusTheme = function()
	vim.cmd([[ colorscheme darkplus ]])
end

local selectTheme = {
	moonfly = moonflyTheme,
	vscode = vscodeTheme,
	tokyonight = tokyonightTheme,
	darkplus = darkplusTheme
}

selectTheme[vim.g.color_theme]()
