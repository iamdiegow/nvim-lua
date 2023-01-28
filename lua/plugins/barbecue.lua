local spec = {
	"utilyre/barbecue.nvim",
	event = "VeryLazy",
	version = "*",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
	},
}

function spec.config()
	require("barbecue").setup({
		symbols = {
			modified = "●",
			ellipsis = "…",
			separator = "",
		},
	})

	vim.keymap.set("n", "<leader>w", function()
		require("barbecue.ui").toggle()
	end, { silent = true, desc = "Toggle barbecue (WINBAR)" })
end

return spec
