return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "classic",
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = false,
				},
				presets = {
					operator = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
					g = false,
				},
			},
			icons = {
				mappings = false,
			},
		})

		wk.add({
			{
				group = "Buffers",
				"<leader>b",
			},
			{
				group = "Git",
				"<leader>g",
				icon = "",
			},
			{
				group = "Telescope",
				"<leader>f",
			},
			{
				group = "Indent",
				"<leader>i",
				icon = "",
			},
			{
				group = "Lsp",
				"<leader>l",
				icon = "",
			},
			{
				group = "Session",
				"<leader>p",
				icon = "",
			},
			{
				group = "Spectre",
				"<leader>s",
				icon = "",
			},
			{
				group = "Trouble",
				"<leader>x",
				icon = "",
			},
		})

		wk.add({
			{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
			{
				"<leader>ll",
				"<cmd>lua vim.diagnostic.open_float(0, {scope = 'cursor', border = 'single', source = true })<CR>",
				desc = "Show Line Diagnostics",
			},
		}, {
			"<leader>lt",
			"<cmd>lua require'lsp.handlers'.toggle_diagnostics()<CR>",
			desc = "Toggle Diagnostics (Show/Hide)",
		}, {
			"<leader>lj",
			"<cmd>lua vim.diagnostic.goto_next({ float = { border = 'single' }})<cr>",
			desc = "Next Diagnostic",
		}, {
			"<leader>lk",
			"<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'single' }})<cr>",
			desc = "Prev Diagnostic",
		})
	end,
}
