-- Material Config
local materialTheme = function ()
	-- variants = 'darker' | 'lighter' | 'oceanic' | 'palenight' | 'deep ocean'
	-- lualine -> theme = 'material-nvim'
	vim.g.material_style = 'lighter'
	vim.g.material_italic_comments = true
	vim.g.material_italic_keywords = true
	vim.g.material_italic_functions = true
	vim.g.material_italic_variables = false
	vim.g.material_contrast = true
	vim.g.material_borders = true
	vim.g.material_disable_background = true
	require('material').set()
end

-- Everforest
local everforestTheme = function()
	vim.cmd([[
		if has('termguicolors')
      set termguicolors
    endif
    set background=dark
    let g:everforest_background = 'hard'
    let g:everforest_enable_italic = 1
    let g:everforest_disable_italic_comment = 1
    let g:everforest_transparent_background = 0
    let g:everforest_diagnostic_text_highlight = 1
    let g:everforest_diagnostic_line_highlight = 1
    let g:everforest_better_performance = 1
    colorscheme everforest
	]])
end

-- VN NIGHT
local vnnightTheme = function()
	vim.cmd([[
		set background=dark
	]])
	require('vn-night').setup()
end

-- VSCODE
local vscodeTheme = function()
	-- For dark theme
	vim.g.vscode_style = "dark"
	-- vim.g.vscode_style = "light"
	vim.cmd[[colorscheme vscode]]
end

-- NEON
local neonTheme = function()
	-- "default" | "doom" | "dark"
	vim.g.neon_style = "dark"
	vim.g.neon_italic_keyword = true
	vim.g.neon_italic_function = true
	vim.g.neon_transparent = false
	vim.cmd[[colorscheme neon]]
end

-- materialTheme()
-- everforestTheme()
-- vnnightTheme()
vscodeTheme()
-- neonTheme()
