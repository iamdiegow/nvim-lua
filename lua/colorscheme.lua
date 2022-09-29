local tokyonightTheme = function()
	vim.g.tokyonight_style = "storm"
	require("tokyonight").setup({
		style = "moon", -- 'night' | 'storm' | 'day' | 'moon'
		transparent = true,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { bold = false },
			variables = { bold = false },
			sidebars = "transparent", -- style for sidebars, see below
			floats = "transparent", -- style for floating windows
		},
		sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
		dim_inactive = false, -- dims inactive windows
		lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
	})
	vim.cmd([[ colorscheme tokyonight ]])
end

local darkplusTheme = function()
	vim.cmd([[ colorscheme darkplus ]])
end

local draculaTheme = function()
	vim.cmd([[ colorscheme dracula ]])
end

local githubTheme = function()
	require("github-theme").setup({
		comment_style = "italic",
		keyword_style = "none",
		function_style = "none",
		variable_style = "none",
		msg_area_style = "italic,bold",
		transparent = true,
		dark_sidebar = false,
		dark_float = false,
		theme_style = "dimmed",
	})
end

local materialTheme = function()
	require("material").setup({
		contrast = {
			sidebars = false,
			floating_windows = true,
			cursor_line = false,
			non_current_window = false,
		},
		italics = {
			comments = true,
			variables = false,
			keywords = true,
			functions = false,
			strings = false,
		},
		high_visibility = {
			darker = true,
		},
		disable = {
			colored_cursor = true,
			borders = true,
			background = true,
			term_colors = true,
		},
		plugins = {
			telescope = false
		},
		lualine_style = "default",
	})
	-- 'darker' | 'oceanic' | 'palenight' | 'deep ocean'
	vim.g.material_style = "darker"
	vim.cmd([[ colorscheme material ]])
end

local cobalt2Theme = function()
	require("colorbuddy").colorscheme("cobalt2")
end

local catppuccinTheme = function()
	vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
	local colors = require("catppuccin.palettes").get_palette()
	colors.nono = "NONE"
	require("catppuccin").setup({
		transparent_background = true,
		styles = {
			comments = { "italic" },
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = { "bold" },
			booleans = { "bold" },
			properties = {},
			types = { "bold" },
			operators = {},
		},
		integrations = {
			nvimtree = {
				enabled = true,
				show_root = true,
				transparent_panel = true,
			},
			gitsigns = true,
			lsp_trouble = true,
			lsp_saga = true,
			which_key = true,
			neogit = true,
			hop = true,
			navic = true,
			bufferline = false,
		},
		custom_highlights = {
			Comment = { fg = colors.overlay1 },
			LineNr = { fg = colors.overlay1 },
			CursorLine = { bg = colors.none },
			CursorLineNr = { fg = colors.lavender },
			DiagnosticVirtualTextError = { bg = colors.none },
			DiagnosticVirtualTextWarn = { bg = colors.none },
			DiagnosticVirtualTextInfo = { bg = colors.none },
			DiagnosticVirtualTextHint = { bg = colors.none },
		},
	})
	vim.cmd([[colorscheme catppuccin]])
end

local selectTheme = {
	tokyonight = tokyonightTheme,
	darkplus = darkplusTheme,
	dracula = draculaTheme,
	github_dark = githubTheme,
	cobalt2 = cobalt2Theme,
	material = materialTheme,
	catppuccin = catppuccinTheme,
}

selectTheme[vim.g.color_theme]()
