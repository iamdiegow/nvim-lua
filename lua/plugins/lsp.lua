return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		config = function()
			require("lsp.mason")
			require("lsp.handlers").setup()
		end,
	},
	"jose-elias-alvarez/typescript.nvim",
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		config = function()
			local null_ls_status_ok, null_ls = pcall(require, "null-ls")
			if not null_ls_status_ok then
				return
			end

			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			local formatting = null_ls.builtins.formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			local diagnostics = null_ls.builtins.diagnostics
			local code_actions = null_ls.builtins.code_actions

			null_ls.setup({
				debounce = 1000,
				debug = false,
				diagnostics_format = "[#{c}] #{m} (#{s})",
				sources = {
					require("typescript.extensions.null-ls.code-actions"),
					diagnostics.eslint_d.with({
						condition = function(utils)
							return utils.root_has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" })
						end,
					}),
					code_actions.eslint_d,
					formatting.black.with({ extra_args = { "--fast" } }),
					formatting.prettierd.with({
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"css",
							"scss",
							"html",
							"json",
							"yaml",
							"graphql",
						},
						prefer_local = "node_modules/.bin",
					}),
					formatting.stylua,
				},
				update_in_insert = true,
			})
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			local status_ok, saga = pcall(require, "lspsaga")
			if not status_ok then
				return
			end

			saga.setup({
				preview = {
					lines_above = 0,
					lines_below = 10,
				},
				scroll_preview = {
					scroll_down = "<C-j>",
					scroll_up = "<C-k>",
				},
				request_timeout = 2000,
				move_in_saga = { prev = "<C-k>", next = "<C-j>" },
				diagnostic_header = { " ", " ", " ", "ﴞ " },
				finder = {
					edit = { "o", "<CR>" },
					vsplit = "v",
					split = "s",
					tabe = "t",
					quit = { "q", "<ESC>" },
				},
				code_action = {
					num_shortcut = true,
					keys = {
						quit = "q",
						exec = "<CR>",
					},
				},
				lightbulb = {
					enable = false,
					virtual_text = false,
					sign = false,
					enable_in_insert = false,
				},
				diagnostic = {
					show_code_action = true,
					show_source = true,
					jump_num_shorcut = true,
					keys = {
						exec_action = "<CR>",
						quit = "q",
						go_action = "g",
					},
				},
				rename = {
					quit = "<C-c>",
					exec = "<CR>",
					mark = "x",
					confirm = "<CR>",
					in_select = true,
					whole_project = false,
				},
				outline = {
					win_position = "right",
					show_detail = false,
					auto_preview = false,
					auto_refresh = true,
					auto_close = true,
					keys = {
						jump = "<CR>",
						expand_collapse = "u",
						quit = "q",
					},
				},
				symbol_in_winbar = {
					enable = false,
					separator = "  ",
					hide_keyword = true,
					show_file = false,
					respect_root = false,
					color_mode = false,
				},
			})
		end,
	},
}
