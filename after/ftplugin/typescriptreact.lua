require("cmp").setup.buffer({
	sources = {
		{
			name = "nvim_lsp",
			max_item_count = 15,
			keyword_length = 3,
			entry_filter = require("utils.cmp").emmet_ls_react_filter
		},
		{
			name = "luasnip",
			max_item_count = 5,
			entry_filter = require("utils.cmp").luasnip_react_filter
		},
	},
})
