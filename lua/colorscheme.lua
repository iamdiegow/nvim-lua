-- VSCODE
local vscodeTheme = function()
	-- For dark theme
	vim.g.vscode_style = "dark"
	-- vim.g.vscode_style = "light"
	vim.cmd[[colorscheme vscode]]
end

vscodeTheme()
