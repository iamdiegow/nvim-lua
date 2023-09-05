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

			require("luasnip/loaders/from_vscode").lazy_load({
				exclude = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			})

			cmp.setup({
				preselect = cmp.PreselectMode.None,
				completion = {
					completeopt = "menu,menuone,noselect,noinsert",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered({
						scrollbar = true,
						side_padding = 0,
						col_offset = 1,
						winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:CursorLine,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						scrollbar = true,
					}),
				},
				duplicates = {
					nvim_lsp = 1,
					luasnip = 1,
					buffer = 1,
					path = 1,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-2),
					["<C-f>"] = cmp.mapping.scroll_docs(2),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-c>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({ behaviour = cmp.ConfirmBehavior.Insert }),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif require("utils.cmp").has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sorting = {
					comparators = {
						require("utils.cmp").order_by_kind_sorter,
					},
				},
				sources = cmp.config.sources({
					{ name = "nvim_lua", keyword_length = 3 },
					{
						name = "nvim_lsp",
						entry_filter = function(entry) -- (entry, ctx)
							local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
							if kind == "Text" then
								return false
							end
							return true
						end,
					},
					{ name = "luasnip" },
					{ name = "path", max_item_count = 3 },
					{ name = "buffer", keyword_length = 5, max_item_count = 3 },
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = require("utils.cmp").format,
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
			local handlers = require("nvim-autopairs.completion.handlers")
			cmp.event:on(
				"confirm_done",
				cmp_autopairs.on_confirm_done({
					filetypes = {
						javascriptreact = {
							["("] = {
								kind = {},
								handler = handlers["*"],
							},
						},
						typescriptreact = {
							["("] = {
								kind = {},
								handler = handlers["*"],
							},
						},
					},
				})
			)

			-- unlink current snippet
			vim.api.nvim_create_autocmd("ModeChanged", {
				pattern = "*",
				callback = function()
					if
						((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
						and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
						and not require("luasnip").session.jump_active
					then
						require("luasnip").unlink_current()
					end
				end,
			})
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"nvim-lua/plenary.nvim",
			{
				"L3MON4D3/LuaSnip",
				event = "InsertEnter",
				verson = "1.*",
				dependencies = {
					"rafamadriz/friendly-snippets",
				},
				opts = {
					history = false,
				},
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				opts = {
					check_ts = true,
					disable_filetype = { "TelescopePrompt", "vim" },
					ts_config = {
						lua = { "string", "source" },
						javascript = { "string", "template_string" },
						java = false,
					},
					map_char = {
						all = "(",
						tex = "{",
					},
					ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
					enable_bracket_in_quote = false,
				},
			},
		},
	},
}
