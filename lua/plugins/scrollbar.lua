return {
	"petertriho/nvim-scrollbar",
	event = "BufReadPost",
	config = function()
		require("scrollbar").setup({
			excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify" },
		})
	end,
}
