return {
	"petertriho/nvim-scrollbar",
	event = "VeryLazy",
	config = function()
		require("scrollbar").setup({
			show_in_active_only = true,
			hide_if_all_visible = false,
		})
	end,
}
