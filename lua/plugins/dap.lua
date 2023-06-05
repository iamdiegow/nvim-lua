return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
			},
			"mxsdev/nvim-dap-vscode-js",
		},
		keys = {
			{
				"<leader>db",
				"<cmd>lua require'dap'.toggle_breakpoint()<CR>",
				desc = "Toggle breakpoint",
			},
			{
				"<Leader>dB",
				function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "Set conditional breakpoint",
			},
			{
				"<leader>dC",
				"<cmd>lua require'dap'.clear_breakpoints()<CR>",
				desc = "Clear breakpoints",
			},
			{
				"<leader>dl",
				"<cmd>lua require'dap'.step_out()<CR>",
				desc = "Step out",
			},
			{
				"<leader>dk",
				"<cmd>lua require'dap'.step_into()<CR>",
				desc = "Step into",
			},
			{
				"<leader>dj",
				"<cmd>lua require'dap'.step_over()<CR>",
				desc = "Step over",
			},
			{
				"<leader>dc",
				"<cmd>lua require'dap'.run_to_cursor()<CR>",
				desc = "Run to cursor",
			},
			{
				"<leader>dt",
				"<cmd>lua require'dap'.terminate()<CR>",
				desc = "Terminate",
			},
			{
				"<leader>di",
				"<cmd>lua require'dap.ui.widgets'.hover()<CR>",
				desc = "Hover",
			},
			{
				"<leader>dh",
				"<cmd>lua require'dap'.continue()<CR>",
				desc = "Continue",
			},
			{
				"<leader>dS",
				"<cmd>lua require'dapui'.toggle('sidebar')<CR>",
				desc = "Toggle sidebar",
			},
			{
				"<leader>dT",
				"<cmd>lua require'dapui'.toggle('tray')<CR>",
				desc = "Toggle tray",
			},
		},
		config = function()
			local dap_status_ok, dap = pcall(require, "dap")
			if not dap_status_ok then
				return
			end

			local dapui_status_ok, dapui = pcall(require, "dapui")
			if not dapui_status_ok then
				return
			end

			vim.fn.sign_define("DapBreakpoint", {
				text = "",
				texthl = "LspDiagnosticsError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapStopped", {
				text = "",
				texthl = "LspDiagnosticsInformation",
				linehl = "Visual",
				numhl = "LspDiagnosticsInformation",
			})

			require("dap-vscode-js").setup({
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			for _, language in ipairs({
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
			}) do
				require("dap").configurations[language] = {
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach debugger to existing 'node --inspect' process",
						processId = require("dap.utils").pick_process,
						sourceMaps = true,
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
						cwd = "${workspaceFolder}",
						skipFiles = {
							"${workspaceFolder}/node_modules/**/*.js",
						},
					},
					{
						type = "pwa-chrome",
						name = "Launch Chrome to debug client",
						request = "launch",
						sourceMaps = true,
						protocol = "inspector",
						port = 9222,
						webRoot = "${workspaceFolder}",
						skipFiles = {
							"**/node_modules/**",
						},
					},
				}
			end

			require("dapui").setup({
				icons = { expanded = "▾", collapsed = "▸" },
				mappings = {
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					edit = "e",
					repl = "r",
					toggle = "t",
				},
				floating = {
					max_height = nil,
					max_width = nil,
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({ reset = true })
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local dap_ui_status_ok, dapVirtualText = pcall(require, "nvim-dap-virtual-text")
			if not dap_ui_status_ok then
				return
			end

			-- Enable virtual text
			vim.g.dap_virtual_text = true

			-- Virtual Text
			dapVirtualText.setup({
				enabled = true,
				enabled_commands = true, -- creates DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle
				highlight_changed_variables = true,
				highlight_new_as_changed = false,
				show_stop_reason = true,
				commented = true,
				only_first_definition = true,
				all_references = false,
				filter_references_pattern = "<module",
				virt_text_pos = "eol",
				all_frames = false,
				virt_lines = false,
				virt_text_win_col = nil,
			})
		end,
	},
}
