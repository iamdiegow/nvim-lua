return {
	"folke/trouble.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	cmd = { "TroubleToggle", "Trouble" },
	keys = {
		{
			"<leader>tt",
			"<cmd>TroubleToggle document_diagnostics<CR>",
			desc = "(Trouble) Document Diagnostics",
		},
		{
			"<leader>tw",
			"<cmd>TroubleToggle workspace_diagnostics<CR>",
			desc = "(Trouble) Workspace Diagnostics",
		},
		{
			"<leader>tr",
			"<cmd>TroubleToggle lsp_references<CR>",
			desc = "(Trouble) Lsp References",
		},
		{
			"<leader>ts",
			"<cmd>TroubleToggle lsp_type_definitions<CR>",
			desc = "(Trouble) Lsp Type Definitions",
		},
		{
			"<leader>ti",
			"<cmd>TroubleToggle lsp_implementations<CR>",
			desc = "(Trouble) Lsp Implementations",
		},
		{
			"<leader>td",
			"<cmd>TroubleToggle lsp_definitions<CR>",
			desc = "(Trouble) Lsp Definitions",
		},
		{
			"<leader>tq",
			"<cmd>TroubleToggle quickfix<CR>",
			desc = "(Trouble) Open Quickfix List",
		},
	},
	opts = {
		position = "right", -- position of the list can be: bottom, top, left, right
		height = 10, -- height of the trouble list when position is top or bottom
		icons = true, -- use devicons for filenames
		fold_open = "", -- icon used for open folds
		fold_closed = "", -- icon used for closed folds
		action_keys = {
			close = "q", -- close the list
			cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
			refresh = "r", -- manually refresh
			jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
			open_split = { "<c-x>" }, -- open buffer in new split
			open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
			open_tab = { "<c-t>" }, -- open buffer in new tab
			jump_close = { "o" }, -- jump to the diagnostic and close the list
			toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
			toggle_preview = "P", -- toggle auto_preview
			hover = "K", -- opens a small popup with the full multiline message
			preview = "p", -- preview the diagnostic location
			close_folds = { "zM", "zm" }, -- close all folds
			open_folds = { "zR", "zr" }, -- open all folds
			toggle_fold = { "zA", "za" }, -- toggle fold of current file
			previous = "k", -- preview item
			next = "j", -- next item
		},
		indent_lines = false, -- add an indent guide below the fold icons
		auto_open = false, -- automatically open the list when you have diagnostics
		auto_close = true, -- automatically close the list when you have no diagnostics
		auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
		auto_fold = false, -- automatically fold a file trouble list at creation
		signs = {
			error = "",
			warning = "",
			hint = "",
			information = "",
			other = "﫠",
		},
		use_diagnostic_signs = true,
	},
}
