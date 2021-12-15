-- Setup nvim-cmp.
vim.g.completeopt = "menu,menuone,noselect,noinsert"

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
	return
end

local lspkind = require'lspkind'

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		-- normal mode
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		-- insert mode
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
		['<C-J>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
		['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp', max_item_count = 15 },
		{ name = 'vsnip', max_item_count = 5 },
		{ name = 'buffer', keyword_length = 5, max_item_count = 3 }
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			maxwidth = 500,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				vsnip = "[snip]"
			}
		})
	},
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
	experimental = {
		native_menu = false,
		ghost_text = true
	}
})
