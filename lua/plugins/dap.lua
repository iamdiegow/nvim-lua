return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
			"mxsdev/nvim-dap-vscode-js",
		},
		keys = {
			{
				"<leader>db",
				"<cmd>lua require'dap'.toggle_breakpoint()<CR>",
				desc = "Toggle breakpoint",
			},
			{
				"<leader>dB",
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
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.25 },
							{ id = "breakpoints", size = 0.25 },
						},
						size = 40,
						position = "right",
					},
					{
						elements = {
							"repl",
							"console",
						},
						size = 0.25,
						position = "bottom",
					},
				},
				floating = {
					max_height = nil, -- These can be integers or a float between 0 and 1.
					max_width = nil, -- Floats will be treated as percentage of your screen.
					border = "single", -- Border style. Can be "single", "double" or "rounded"
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				windows = { indent = 1 },
				render = {
					max_type_length = nil, -- Can be integer or nil.
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
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
	{
		"mxsdev/nvim-dap-vscode-js",
		config = function()
			require("dap-vscode-js").setup({
				debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
				debugger_cmd = { "js-debug-adapter" },
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			for _, language in ipairs({ "typescript", "javascript" }) do
				require("dap").configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Debug Jest Tests",
						-- trace = true, -- include debugger info
						runtimeExecutable = "node",
						runtimeArgs = {
							"./node_modules/jest/bin/jest.js",
							"--runInBand",
						},
						rootPath = "${workspaceFolder}",
						cwd = "${workspaceFolder}",
						console = "integratedTerminal",
						internalConsoleOptions = "neverOpen",
					},
					{
						type = "pwa-chrome",
						name = "Attach - Remote Debugging",
						request = "attach",
						program = "${file}",
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
						protocol = "inspector",
						port = 9222,
						webRoot = "${workspaceFolder}",
					},
					{
						type = "pwa-chrome",
						name = "Launch Chrome",
						request = "launch",
						url = "http://localhost:3000",
					},
				}
			end
		end,
	},
}
