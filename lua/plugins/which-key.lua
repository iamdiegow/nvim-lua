return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			plugins = {
				marks = false,
				registers = true,
				spelling = {
					enabled = false,
					suggestions = 20,
				},
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
					g = false,
				},
			},
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
			operators = { gc = "Comments" },
			motions = {
				count = false,
			},
			key_labels = {
				["<space>"] = "SPC",
				["<cr>"] = "RET",
				["<tab>"] = "TAB",
				["<leader>"] = "LEADER",
			},
			window = {
				border = "single",
				position = "bottom",
				margin = { 1, 2, 0, 4 },
				padding = { 2, 2, 2, 2 },
				winblend = 0,
			},
			layout = {
				height = { min = 4, max = 25 },
				width = { min = 20, max = 50 },
				spacing = 3,
				align = "center",
			},
			ignore_missing = false,
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
			show_help = false,
			triggers = "auto",
			triggers_blacklist = {
				i = { "j", "k" },
				v = { "j", "k" },
			},
		})

		local normal_mode_options = {
			mode = "n",
			prefix = "<leader>",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = true,
		}

		local normal_mappings = {
			["q"] = { "<cmd>q!<CR>", "Quit" },
			["="] = { "<cmd>:ColorizerToggle<CR>", "Toggle Colorizer" },
			-- BUFFERS
			["b"] = {
				name = "Buffers",
				c = { "<cmd>BufferLinePickClose<cr>", "Pick and close" },
				p = { "<cmd>BufferLinePick<cr>", "Jump to buffer" },
				w = { "<cmd>Bwipeout<cr>", "Wipeout buffer" },
				h = { "<cmd>BufferLineCloseLeft<cr>", "Close all buffers left" },
				l = { "<cmd>BufferLineCloseRight<CR>", "close all buffers right" },
				s = { "<cmd>BufferLineSortByExtension<cr>", "sort BufferLines automatically by language" },
				d = { "<cmd>BufferLineSortByDirectory<cr>", "sort BufferLines automatically by directory" },
				t = { "<cmd>BufferLineTogglePin<cr>", "toggle Buffer pin" },
				o = { "<cmd>BufferLineCloseOthers<cr>", "close all other buffers" },
				["["] = { "<cmd>BufferLineMovePrev<cr>", "Move Buffer Left" },
				["]"] = { "<cmd>BufferLineMoveNext<cr>", "Move Buffer Right" },
			},
			-- GITSIGNS
			["g"] = {
				name = "Git, (gitsigns, diffview, neogit)",
				j = { "<cmd>lua require 'gitsigns'.next_hunk({preview = true, foldopen = true})<cr>", "Next Hunk" },
				k = { "<cmd>lua require 'gitsigns'.prev_hunk({preview = true, foldopen = true})<cr>", "Prev Hunk" },
				l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
				p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
				i = { "<cmd>lua require 'gitsigns'.preview_hunk_inline()<cr>", "Preview Hunk Inline" },
				r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
				R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
				s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
				u = {
					"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
					"Undo Stage Hunk",
				},
				w = { "<cmd>Gitsigns toggle_word_diff<cr>", "Toggle Word Diff" },
				e = { "<cmd>Gitsigns toggle_linehl<cr>", "Toggle Line Highlight" },
				n = { "<cmd>Gitsigns toggle_numhl<cr>", "Toggle Number Highlight" },
				b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Line Blame" },
				q = { "<cmd>Gitsigns setqflist<cr>", "Set QuickFix List" },
			},
			-- LSP
			["l"] = {
				name = "LSP",
				g = { name = "Glance" },
				a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
				l = {
					"<cmd>lua vim.diagnostic.open_float(0, {scope = 'cursor', border = 'single', source = true })<CR>",
					"Show Line Diagnostics",
				},
				t = { "<cmd>lua require'lsp.handlers'.toggle_diagnostics()<CR>", "Toggle Diagnostics (Show/Hide)" },
				i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Show Implementation" },
				j = {
					"<cmd>lua vim.diagnostic.goto_next({ float = { border = 'single' }})<cr>",
					"Next Diagnostic",
				},
				k = {
					"<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'single' }})<cr>",
					"Prev Diagnostic",
				},
				e = {
					"<cmd>ErrorLensToggle<cr>",
					"Toggle ErrorLens",
				},
				E = {
					"<cmd>ErrorLensTelescope<cr>",
					"ErrorLens Telescope",
				},
				r = { "<cmd>Telescope lsp_references <cr>", "Show References" },
				d = { "<cmd>Telescope diagnostics bufrn=0<cr>", "Show Diagnostics" },
				s = { "<cmd>Telescope lsp_document_symbols <cr>", "Show Document Symbols" },
			},
			["h"] = {
				name = "Cursor lines & Highlight",
				h = { '<cmd>let @/=""<CR>', "No Highlight" },
				t = { '<cmd>lua require("utils").toggleCursorHighlight()<CR>', "Toggle Cursor Highlight" },
				c = { '<cmd>lua require("utils").toggleCursorLine()<CR>', "Toggle Cursor Line" },
				v = { '<cmd>lua require("utils").toggleCursorColumn()<CR>', "Toggle Cursor Column" },
			},
			-- Char rendering
			["i"] = {
				name = "Chars & indent guides",
				i = { "<cmd>set invlist<CR>", "Toggle white space and tabs" },
			},
			["n"] = {
				name = "Numbers",
				r = { "<cmd>set relativenumber!<CR>", "Toogle relative number" },
				n = { "<cmd>set number!<CR>", "Toogle relative number" },
			},
			f = {
				name = "Telescope",
			},
			t = {
				name = "Trouble Diagnostics & Terminal",
			},
			s = {
				name = "Spectre",
				s = "Init selection (Treesitter)",
				i = "Increment selection (Treesitter)",
				d = "Decrement selection (Treesitter)",
				c = "Scope incremental (Treesitter)",
			},
			p = {
				name = "Sessions",
			},
		}

		-- NORMAL MODE KEYBINDINGS
		wk.register(normal_mappings, normal_mode_options)
	end,
}
