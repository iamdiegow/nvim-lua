local status_ok, rest_nvim = pcall(require, "rest-nvim")
if not status_ok then
	return
end

rest_nvim.setup({
	result_split_horizontal = true,
	result_split_in_place = false,
	skip_ssl_verification = false,
	highlight = {
		enabled = true,
		timeout = 150
	},
	result = {
		show_url = true,
		show_http_info = true,
		show_headers = true
	},
	jump_to_request = false,
	env_file = '.env',
	custom_dynamic_variables = {},
	yank_dry_run = true,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "http",
	callback = function()
		local buff = tonumber(vim.fn.expand("<abuf>"), 10)
		vim.keymap.set("n", "<leader>l", rest_nvim.run, { noremap = true, buffer = buff })
		vim.keymap.set("n", "<leader>h", rest_nvim.last, { noremap = true, buffer = buff })
		vim.keymap.set("n", "<leader>p", function() rest_nvim.run(true) end, { noremap = true, buffer = buff })
	end
})
