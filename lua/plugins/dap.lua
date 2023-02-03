return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
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
			require("dap-config.dap-adapters-configurations")
			require("dap-config.dap-ui-config")
			require("dap-config.dap-virtual-text-config")
		end,
	},
}
