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
	require("barbecue").setup()
end

return spec
