require 'hop'.setup({
	keys = 'asdfhjklqweryuio'
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- VISUAL MODE
keymap('n', 'f',
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
	, opts)
keymap('n', 'F',
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>"
	, opts)
keymap("n", "t",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })<CR>"
	, opts)
keymap("n", "T",
	":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })<CR>"
	, opts)
