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
			sidebars = false,
			floating_windows = true,
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
			darker = false
		},
		disable = {
			colored_cursor = true,
			borders = true
		},
		lualine_style = "default"
	})
	-- 'darker' | 'oceanic' | 'palenight' | 'deep ocean'
	vim.g.material_style = 'darker'
	vim.cmd([[ colorscheme material ]])
end

local cobalt2Theme = function()
	require('colorbuddy').colorscheme('cobalt2')
end

local catppuccinTheme = function()
	vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
	require('catppuccin').setup({
		transparent_background = false,
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = { "bold" },
			keywords = { "bold" },
			strings = {},
			variables = {},
			numbers = { "bold" },
			booleans = { "bold" },
			properties = {},
			types = { "bold" },
			operators = {}
		},
		integrations = {
			nvimtree = {
				enabled = true,
				show_root = true,
				transparent_panel = true
			},
			gitsigns = true,
			lsp_trouble = true,
			lsp_saga = true,
			which_key = true,
			neogit = true,
			hop = true,
			navic = true,
			bufferline = false
		}
	})
	vim.cmd([[colorscheme catppuccin]])
end

local selectTheme = {
	moonfly = moonflyTheme,
	vscode = vscodeTheme,
	tokyonight = tokyonightTheme,
	darkplus = darkplusTheme,
	dracula = draculaTheme,
	github_dark = githubTheme,
	cobalt2 = cobalt2Theme,
	material = materialTheme,
	catppuccin = catppuccinTheme
}

selectTheme[vim.g.color_theme]()
