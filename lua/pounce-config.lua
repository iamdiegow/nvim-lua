local status_ok, pounce = pcall(require, 'lualine')
if not status_ok then
	return
end

pounce.setup({
	accept_keys = "ASDFHJKLQWERYUIO",
	accept_best_key = "<enter>",
	multi_window = false
})
