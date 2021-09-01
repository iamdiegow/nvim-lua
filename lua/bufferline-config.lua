require("bufferline").setup{
 options = {
		-- numbers = function(opts)
		--     return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
		-- end,
    -- number_style = "superscript",
    -- mappings = false,
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
		buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
		view = "default",
		offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left", padding = 0}},
    diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thick",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'id',
		-- for vscode theme
		highlights = {
			fill = {
				guifg = {attribute = "fg", highlight = "Normal"},
				guibg = {attribute = "bg", highlight = "StatusLineNC"},
			},
			background = {
				guifg = {attribute = "fg", highlight = "Normal"},
				guibg = {attribute = "bg", highlight = "StatusLine"}
			},
			buffer_visible = {
				gui = "",
							guifg = {attribute = "fg", highlight="Normal"},
							guibg = {attribute = "bg", highlight = "Normal"}
			},
			buffer_selected = {
				gui = "",
							guifg = {attribute = "fg", highlight="Normal"},
							guibg = {attribute = "bg", highlight = "Normal"}
			},
			separator = {
				guifg = {attribute = "bg", highlight = "Normal"},
				guibg = {attribute = "bg", highlight = "StatusLine"},
			},
			separator_selected = {
							guifg = {attribute = "fg", highlight="Special"},
							guibg = {attribute = "bg", highlight = "Normal"}
			},
			separator_visible = {
				guifg = {attribute = "fg", highlight = "Normal"},
				guibg = {attribute = "bg", highlight = "StatusLineNC"},
			},
			close_button = {
				guifg = {attribute = "fg", highlight = "Normal"},
				guibg = {attribute = "bg", highlight = "StatusLine"}
			},
			close_button_selected = {
							guifg = {attribute = "fg", highlight="normal"},
							guibg = {attribute = "bg", highlight = "normal"}
			},
			close_button_visible = {
							guifg = {attribute = "fg", highlight="normal"},
							guibg = {attribute = "bg", highlight = "normal"}
			},
		}
		-- for vscode theme end
  }
}

vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true})

local M = {}

M.closeBuffer = function()
	 local treeView = require('nvim-tree.view')
  local bufferline = require('bufferline')

  -- check if NvimTree window was open
  local explorerWindow = treeView.get_winnr()
  local wasExplorerOpen = vim.api.nvim_win_is_valid(explorerWindow)

  local bufferToDelete = vim.api.nvim_get_current_buf()

  -- TODO: handle modified buffers
  -- local isModified = vim.api.nvim_eval('getbufvar(' .. bufferToDelete .. ', "&mod")')

  if (wasExplorerOpen) then
    -- switch to previous buffer (tracked by bufferline)
    bufferline.cycle(-1)
  end

  -- delete initially open buffer
  vim.cmd('bdelete! ' .. bufferToDelete)
end

return M
