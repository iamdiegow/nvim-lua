return {
	{
		"b0o/incline.nvim",
		config = function()
			require("incline").setup({
				window = {
					margin = {
						horizontal = 0,
						vertical = 0,
					},
					placement = {
						horizontal = "right",
						vertical = "top",
					},
					overlap = {
						winbar = false,
					},
				},
				ignore = {
					filetypes = { "sql" },
					buftypes = "special",
					wintypes = "special",
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":.")
					local modified = vim.bo[props.buf].modified

					return {
						" ",
						filename,
						modified and { " [+]", guifg = "#888888", gui = "bold" } or "",
						" ",
						guibg = "#111111",
						guifg = "#eeeeee",
					}
				end,
			})
		end,
		event = "VeryLazy",
	},
}
