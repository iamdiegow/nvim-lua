local M = {}

M.toggleCursorColumn = function ()
	if vim.o.cursorcolumn then
		vim.o.cursorcolumn = false
	else
		vim.o.cursorcolumn = true
	end
end

M.toggleCursorLine = function ()
	if vim.o.cursorline then
		vim.o.cursorline = false
	else
		vim.o.cursorline = true
	end
end

M.toggleCursorHighlight = function()
	if vim.o.cursorline then
		vim.o.cursorline = false
	else
		vim.o.cursorline = true
	end

	if vim.o.cursorcolumn then
		vim.o.cursorcolumn = false
	else
		vim.o.cursorcolumn = true
	end
end

return M
