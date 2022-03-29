local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
	return
end

bufferline.setup {
 options = {
	 	numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator_icon = '▎',
		buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 20,
    max_prefix_length = 13,
    tab_size = 20,
		offsets = {{
			filetype = "NvimTree",
			text = "File Explorer",
			text_align = "left",
			padding = 0
		}},
		diagnostics = false,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = true,
    separator_style = {"", ""},
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'id',
		-- for vscode theme
		-- highlights = {
		-- 	fill = {
		-- 		guifg = {attribute = "fg", highlight = "Normal"},
		-- 		guibg = {attribute = "bg", highlight = "StatusLineNC"},
		-- 	},
		-- 	background = {
		-- 		guifg = {attribute = "fg", highlight = "Normal"},
		-- 		guibg = {attribute = "bg", highlight = "StatusLine"}
		-- 	},
		-- 	buffer_visible = {
		-- 		gui = "",
		-- 					guifg = {attribute = "fg", highlight="Normal"},
		-- 					guibg = {attribute = "bg", highlight = "Normal"}
		-- 	},
		-- 	buffer_selected = {
		-- 		gui = "",
		-- 					guifg = {attribute = "fg", highlight="Normal"},
		-- 					guibg = {attribute = "bg", highlight = "Normal"}
		-- 	},
		-- 	separator = {
		-- 		guifg = {attribute = "bg", highlight = "Normal"},
		-- 		guibg = {attribute = "bg", highlight = "StatusLine"},
		-- 	},
		-- 	separator_selected = {
		-- 					guifg = {attribute = "fg", highlight="Special"},
		-- 					guibg = {attribute = "bg", highlight = "Normal"}
		-- 	},
		-- 	separator_visible = {
		-- 		guifg = {attribute = "fg", highlight = "Normal"},
		-- 		guibg = {attribute = "bg", highlight = "StatusLineNC"},
		-- 	},
		-- 	close_button = {
		-- 		guifg = {attribute = "fg", highlight = "Normal"},
		-- 		guibg = {attribute = "bg", highlight = "StatusLine"}
		-- 	},
		-- 	close_button_selected = {
		-- 					guifg = {attribute = "fg", highlight="normal"},
		-- 					guibg = {attribute = "bg", highlight = "normal"}
		-- 	},
		-- 	close_button_visible = {
		-- 					guifg = {attribute = "fg", highlight="normal"},
		-- 					guibg = {attribute = "bg", highlight = "normal"}
		-- 	},
		-- }
		-- for vscode theme end
  }
}

vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true})

local M = {}

M.closeBuffer = function()
	local treeView = require('nvim-tree.view')
  local bufferline_config = require('bufferline')

  -- check if NvimTree window was open
  local explorerWindow = treeView.get_winnr()
  local wasExplorerOpen = vim.api.nvim_win_is_valid(explorerWindow)

  local bufferToDelete = vim.api.nvim_get_current_buf()

  if (wasExplorerOpen) then
    -- switch to previous buffer (tracked by bufferline)
    bufferline_config.cycle(-1)
  end

  -- delete initially open buffer
  vim.cmd('bdelete! ' .. bufferToDelete)
end

return M
