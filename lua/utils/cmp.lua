local M = {}

-- filter emmet lsp snippets in jsx code context
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

-- filter luasnip suggestions in jsx code
M.luasnip_react_filter = function()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local nodeType = ts_utils.get_node_at_cursor(0, true):type()
	if string.match(nodeType, "jsx") then
		return false
	end
	return true
end

M.order_by_kind_sorter = function(entry1, entry2)
	local score = {
		Variable = 1,
		Constant = 2,
		Method = 3,
		Field = 4,
		Value = 5,
		Keyword = 6,
		Class = 7,
		Function = 8,
		Property = 9,
		Snippet = 10,
	}
	local itemKind = require("cmp.types").lsp.CompletionItemKind
	local kind1 = score[itemKind[entry1:get_kind()]] or 100
	local kind2 = score[itemKind[entry2:get_kind()]] or 100
	if kind1 < kind2 then
		return true
	end
end

-- cmp icons
M.kind_icons = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

M.vscode_icons = {
	Text = "   ",
	Method = "   ",
	Function = "   ",
	Constructor = "   ",
	Field = "   ",
	Variable = "   ",
	Class = "   ",
	Interface = "   ",
	Module = "   ",
	Property = "   ",
	Unit = "   ",
	Value = "   ",
	Enum = "   ",
	Keyword = "   ",
	Snippet = "   ",
	Color = "   ",
	File = "   ",
	Reference = "   ",
	Folder = "   ",
	EnumMember = "   ",
	Constant = "   ",
	Struct = "   ",
	Event = "   ",
	Operator = "   ",
	TypeParameter = "   ",
}

local function trim(text)
	local max = 40
	if text and text:len() > max then
		text = text:sub(1, max) .. "..."
	end
	return text
end

-- format cmp suggestions
M.format = function(entry, vim_item)
	local kind = vim_item.kind
	local source = entry.source.name
	local lsp_name = vim.split(entry.source:get_debug_name(), ":", {})[2] or ""

	vim_item.abbr = trim(vim_item.abbr):match("[^(]+")
	vim_item.kind = (M.vscode_icons[kind] or "") .. string.upper(kind)
	vim_item.menu = ({
		nvim_lsp = "[LSP:" .. string.upper(lsp_name) .. "]",
		luasnip = "[LUASNIP]",
		buffer = "[BUFFER]",
		path = "[PATH]",
	})[source]
	return vim_item
end

M.has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return M
