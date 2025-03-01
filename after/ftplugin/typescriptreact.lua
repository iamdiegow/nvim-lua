local cmp = require("cmp")

cmp.setup.buffer({
	sources = cmp.config.sources({
		{
			name = "nvim_lsp",
			max_item_count = 20,
		},
		{
			name = "luasnip",
		},
	}),
})
