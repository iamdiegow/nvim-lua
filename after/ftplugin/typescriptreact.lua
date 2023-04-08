require("cmp").setup.buffer({
	sources = {
		{
			name = "nvim_lsp",
			max_item_count = 10,
			keyword_length = 3,
		},
		{
			name = "cmp_tabnine",
		},
		{
			name = "luasnip",
			max_item_count = 5,
		},
	},
})
