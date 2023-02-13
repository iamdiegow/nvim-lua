local M = {}

M.emmet_ls_react_filter = function(entry)
	local kinds = require("cmp.types").lsp.CompletionItemKind

	-- filter lsp snippets only
	if kinds[entry:get_kind()] ~= "Snippet" then
		return true
	end

	-- filter emmet_ls only
	local name = vim.split(entry.source:get_debug_name(), ":", {})[2]
	if name ~= "emmet_ls" then
		return true
	end

	local ts_utils = require("nvim-treesitter.ts_utils")
	local nodeType = ts_utils.get_node_at_cursor(0, true):type()

	if nodeType == "jsx_text" or nodeType == "jsx_expression" or nodeType == "parenthesized_expression" then
		return true
	else
		return false
	end
end

M.luasnip_react_filter = function()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local nodeType = ts_utils.get_node_at_cursor(0, true):type()
	if string.match(nodeType, "jsx") then
		return false
	end
	return true
end

return M
