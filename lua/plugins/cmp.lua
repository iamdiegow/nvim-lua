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
					completeopt = "menu,menuone,noinsert",
					autocomplete = false,
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
					["<C-c>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lua" },
					{
						name = "nvim_lsp",
						max_item_count = 10,
						entry_filter = function(entry)
							local kinds = require("cmp.types").lsp.CompletionItemKind

							-- filter lsp snippets only
							if kinds[entry:get_kind()] ~= "Snippet" then
								return true
							end

							-- filter emmet_ls only
							local name = vim.split(entry.source:get_debug_name(), ":")[2]
							if name ~= "emmet_ls" then
								return true
							end

							local filetype = vim.bo.filetype

							if filetype == "javascriptreact" or filetype == "typescriptreact" then
								local ts_utils = require("nvim-treesitter.ts_utils")
								local node = ts_utils.get_node_at_cursor(0, true)
								local nodeType = node:type()

								if
									nodeType == "jsx_text"
									or nodeType == "jsx_expression"
									or nodeType == "parenthesized_expression"
								then
									return true
								else
									return false
								end
							end
						end,
					},
					{
						name = "luasnip",
						max_item_count = 5,
						entry_filter = function()
							local filetype = vim.bo.filetype

							if filetype ~= "javascriptreact" and filetype ~= "typescriptreact" then
								return true
							end

							local ts_utils = require("nvim-treesitter.ts_utils")
							local node = ts_utils.get_node_at_cursor(0, true)
							local nodeType = node:type()

							if string.match(nodeType, "jsx") then
								return false
							end

							return true
						end,
					},
					{
						name = "nvim_lsp_signature_help",
						max_item_count = 3,
						keyword_length = 3,
					},
					{ name = "path", max_item_count = 2 },
					{ name = "buffer", keyword_length = 5 },
				}),
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = function(entry, vim_item)
						local kind = vim_item.kind
						local source = entry.source.name

						vim_item.kind = (kind_icons[kind] or "?") .. " " .. kind
						vim_item.menu = ({
							nvim_lsp = "[lsp]",
							luasnip = "[luasnip]",
							buffer = "[buffer]",
							path = "[path]",
						})[source]

						if source == "luasnip" or source == "nvim_lsp" then
							vim_item.dup = 0
						end

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
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"rafamadriz/friendly-snippets",
				},
				opts = {
					history = true,
					delete_check_events = "TextChanged",
				},
				keys = {
					{
						"<tab>",
						function()
							return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
						end,
						expr = true,
						silent = true,
						mode = "i",
					},
					{
						"<tab>",
						function()
							require("luasnip").jump(1)
						end,
						mode = "s",
					},
					{
						"<s-tab>",
						function()
							require("luasnip").jump(-1)
						end,
						mode = { "i", "s" },
					},
				},
			},
			{
				"windwp/nvim-autopairs",
				config = function()
					local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
					if not status_ok then
						return
					end

					nvim_autopairs.setup({
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
					})

					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					local cmp_status_ok, cmp = pcall(require, "cmp")
					if not cmp_status_ok then
						return
					end
					cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
				end,
			},
		},
	},
}
