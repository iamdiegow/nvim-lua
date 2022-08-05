local vscodeTheme = function()
	-- 'light' | 'dark'
	vim.o.background = 'dark'
	require('vscode').setup({
		transparent = false,
		italic_comments = true
	})
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
		comment_style = "italic",
		keyword_style = "bold",
		function_style = "bold",
		variable_style = "none",
		msg_area_style = "italic,bold",
	 	transparent = true,
		dark_sidebar = true,
		dark_float = true,
		theme_style = "dimmed"
	})
end

local materialTheme = function()
	require('material').setup({
		contrast = {
			sidebars = true,
			floating_windows = false,
			cursor_line = false,
			non_current_window = false
		},
		italics = {
			comments = true,
			variables = false,
			keywords = true,
			functions = false,
			strings = false
		},
		high_visibility = {
			darker = true
		},
		disable = {
			colored_cursor = true,
			borders = false
		},
		lualine_style = "stealth"
	})
	-- 'darker' | 'oceanic' | 'palenight' | 'deep ocean'
	vim.g.material_style = 'oceanic'
	vim.cmd([[ colorscheme material ]])
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
	cobalt2 = cobalt2Theme,
	material = materialTheme
}

selectTheme[vim.g.color_theme]()
