local status_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
	return
end

nvim_autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
	check_ts = true,
	ts_config = {}
})
