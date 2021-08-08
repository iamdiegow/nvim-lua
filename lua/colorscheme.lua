-- Material Config
local materialTheme = function ()
	-- variants = 'darker' | 'lighter' | 'oceanic' | 'palenight' | 'deep ocean'
	-- lualine -> theme = 'material-nvim'
	vim.g.material_style = 'oceanic'
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

local nvnightTheme = function()
	require('vn-night').setup()
end

-- materialTheme()
everforestTheme()
-- nvnightTheme()
