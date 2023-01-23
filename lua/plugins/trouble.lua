return {
	"folke/trouble.nvim",
	dependencies = "kyazdani42/nvim-web-devicons",
	keys = {
		{
			"<leader>tt",
			"<cmd>TroubleToggle<CR>",
			desc = "Open Trouble"
		},
		{
			"<leader>tw",
			"<cmd>Trouble lsp_workspace_diagnostics<CR>",
			desc = "Workspace diagnostics"
		},
		{
			"<leader>td",
			"<cmd>Trouble lsp_document_diagnostics<CR>",
			desc = "Document diagnostics"
		},
		{
			"<leader>tq",
			"<cmd>Trouble quickfix<CR>",
			desc = "Open quickfix list"
		},
		{
			"<leader>tr",
			"<cmd>Trouble lsp_reference<CR>",
			desc = "Open reference list"
		}
	},
	opts = {
		position = "bottom", -- position of the list can be: bottom, top, left, right
		height = 15, -- height of the trouble list when position is top or bottom
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
