return {
	"petertriho/nvim-scrollbar",
	event = "VeryLazy",
	config = function()
		require("scrollbar").setup({
			show_in_active_only = true,
			hide_if_all_visible = false,
			marks = {
				Cursor = {
					text = "─",
					priority = 0,
				},
			},
			excluded_filetypes = {
				"prompt",
				"TelescopePrompt",
				"alpha",
				"NvimTree",
				"",
			},
			excluded_buftypes = {
				"terminal",
			},
		})
	end,
}
