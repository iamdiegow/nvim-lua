return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"vim-test/vim-test",
			"nvim-neotest/neotest-vim-test",
			"haydenmeade/neotest-jest",
		},
		keys = {
			{
				"<leader>;o",
				function()
					require("neotest").output.open()
				end,
				desc = "Open Test Output (NEOTEST)",
			},
			{
				"<leader>;;",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Open Summary Toggle (NEOTEST)",
			},
			{
				"<leader>;f",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run Test File (NEOTEST)",
			},
			{
				"<leader>;n",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Nearest Test (NEOTEST)",
			},
			{
				"<leader>;k",
				function()
					require("neotest").jump.prev()
				end,
				desc = "Jump Previous (NEOTEST)",
			},
			{
				"<leader>;j",
				function()
					require("neotest").jump.next()
				end,
				desc = "Jump Next (NEOTEST)",
			},
			{
				"<leader>;o",
				function()
					require("neotest").output.open()
				end,
				desc = "Open Output (NEOTEST)",
			},
			{
				"<leader>;p",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Open Output Panel (NEOTEST)",
			},
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vim-test")({
						allow_file_types = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
					}),
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),
				},
				diagnostic = {
					enabled = true,
				},
				floating = {
					border = "single",
					max_height = 0.6,
					max_width = 0.6,
					options = {},
				},
				quickfix = {
					enabled = false,
					open = false,
				},
				icons = {
					child_indent = "│",
					child_prefix = "├",
					collapsed = "─",
					expanded = "╮",
					failed = "✖",
					final_child_indent = " ",
					final_child_prefix = "╰",
					non_collapsible = "─",
					passed = "✔",
					running = "🗘",
					running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
					skipped = "ﰸ",
					unknown = "?",
				},
				status = {
					enabled = true,
					signs = true,
					virtual_text = true,
				},
				summary = {
					animated = true,
					enabled = true,
					expand_errors = false,
					follow = false,
					mappings = {
						attach = "a",
						clear_marked = "M",
						clear_target = "T",
						expand = { "<CR>", "<2-LeftMouse>" },
						expand_all = "e",
						jumpto = "i",
						mark = "m",
						next_failed = "J",
						output = "o",
						prev_failed = "K",
						run = "r",
						run_marked = "R",
						short = "O",
						stop = "u",
						target = "t",
					},
				},
			})
		end,
	},
}
