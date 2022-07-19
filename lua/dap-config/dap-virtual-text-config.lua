local dap_ui_status_ok, dapVirtualText = pcall(require, "nvim-dap-virtual-text")
if not dap_ui_status_ok then
  return
end

-- Enable virtual text
vim.g.dap_virtual_text = true

-- Virtual Text
dapVirtualText.setup({
	enabled = true,
	enabled_commands = true, -- creates DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle
	highlight_changed_variables = true,
	highlight_new_as_changed = false,
	show_stop_reason = true,
	commented = true,
	only_first_definition = true,
	all_references = false,
	filter_references_pattern = '<module',
	virt_text_pos = 'eol',
	all_frames = false,
	virt_lines = false,
	virt_text_win_col = nil
})
