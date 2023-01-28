return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		config = function()
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
				return
			end

			local snip_status_ok, luasnip = pcall(require, "luasnip")
			if not snip_status_ok then
				return
			end

			require("luasnip/loaders/from_vscode").lazy_load({ paths = "./lua/snippets" })

			require("luasnip/loaders/from_vscode").lazy_load()

			local check_backspace = function()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
			end

			local kind_icons = {
				Text = "",
				Method = "m",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "",
				Event = "",
				Operator = "",
				TypeParameter = "",
			}

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noselect,noinsert",
					keyword_length = 2,
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered({
						scrollbar = true,
						side_padding = 1,
						col_offset = 1,
					}),
					documentation = cmp.config.window.bordered(),
				},
				view = {
					entries = {
						name = "custom",
						selection_order = "near_cursor",
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-2),
					["<C-f>"] = cmp.mapping.scroll_docs(2),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm()
						elseif luasnip.jumpable(1) then
							luasnip.jump(1)
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif luasnip.expandable() then
							luasnip.expand()
						elseif check_backspace() then
							fallback()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", keyword_length = 2 },
					{ name = "luasnip" },
					{ name = "path", max_item_count = 3 },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					fields = { "menu", "kind", "abbr" },
					format = function(entry, vim_item)
						vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
						vim_item.menu = ({
							nvim_lsp = "[lsp]",
							luasnip = "[luasnip]",
							buffer = "[buffer]",
							path = "[path]",
						})[entry.source.name]
						return vim_item
					end,
				},
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				experimental = {
					ghost_text = false,
				},
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			vim.cmd([[
				" gray
				highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
				" blue
				highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
				highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
				" light blue
				highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
				highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
				highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
				" pink
				highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
				highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
				" front
				highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
				highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
				highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
			]])
		end,
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
}
