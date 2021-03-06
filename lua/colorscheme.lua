local vscodeTheme = function()
	-- 'light' | 'dark'
	vim.g.vscode_style = "dark"
	vim.cmd([[ colorscheme vscode ]])
end

local moonflyTheme = function()
	vim.g.moonflyCursorColor = 1
	vim.g.moonflyItalics = 1
	vim.g.moonflyUnderlineMatchingParen = 1
	vim.cmd([[ colorscheme moonfly ]])
end

local tokyonightTheme = function()
	-- 'night' | 'storm' | 'day'
	vim.g.tokyonight_style = "night"
	vim.g.tokyonight_terminal_colors = false
	vim.g.tokyonight_italic_comments = false
	vim.g.tokyonight_italic_keywords = false
	vim.g.tokyonight_italic_variables = false
	vim.g.tokyonight_dark_sidebar = false
	vim.g.tokyonight_dark_float = false
	vim.g.tokyonight_lualine_bold = false
	vim.cmd([[ colorscheme tokyonight ]])
end

local darkplusTheme = function()
	vim.cmd([[ colorscheme darkplus ]])
end

local draculaTheme = function()
	vim.cmd([[ colorscheme dracula ]])
end

local githubTheme = function()
	require('github-theme').setup({
		comment_style = "none",
		keyword_style = "none",
		function_style = "none",
		variable_style = "none",
	 	transparent = true,
		dark_sidebar = false,
		dark_float = false
	})
end

local cobalt2Theme = function()
	require('colorbuddy').colorscheme('cobalt2')
end

local selectTheme = {
	moonfly = moonflyTheme,
	vscode = vscodeTheme,
	tokyonight = tokyonightTheme,
	darkplus = darkplusTheme,
	dracula = draculaTheme,
	github_dark = githubTheme,
	cobalt2 = cobalt2Theme
}

selectTheme[vim.g.color_theme]()
