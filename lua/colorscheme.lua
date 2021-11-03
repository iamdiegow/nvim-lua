-- VSCODE
local vscodeTheme = function()
	-- For dark theme
	vim.g.vscode_style = "dark"
	-- vim.g.vscode_style = "light"
	vim.cmd[[colorscheme vscode]]
end

local moonflyTheme = function()
	vim.g.moonflyCursorColor = 1
	vim.g.moonflyItalics = 1
	vim.g.moonflyUnderlineMatchingParen = 1
	vim.cmd([[
		colorscheme moonfly
	]])
end

-- vscodeTheme()
moonflyTheme()
