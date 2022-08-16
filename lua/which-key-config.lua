local wk = require'which-key'

wk.setup {
	plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
  operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
		["<leader>"] = "LEADER"
  },
  window = {
    border = "single",
    position = "top",
    margin = { 1, 2, 0, 4 },
    padding = { 2, 2, 2, 2 },
		winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "center",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local normal_mode_options= {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local normal_mappings = {
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
	["c"] = { "<cmd>Bwipeout<CR>", "Close Buffer" },
	["s"] = { "<cmd>luafile %<CR>", "Source File" },
	["="] = { "<cmd>:ColorizerToggle<CR>", "Toggle Colorizer" },
	["e"] = { "<cmd>:NvimTreeToggle<CR>", "Open Explorer" },
	-- TELESCOPE
	["f"] = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<CR>", "Find Files" },
		r = { "<cmd>Telescope live_grep<CR>", "Live Grep"},
		b = { "<cmd>Telescope buffers<CR>", "Live Grep"},
		c = { "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<CR>", "Colorschemes"},
		h = { "<cmd>Telescope help_tags<CR>", "Help Tags"},
		o = { "<cmd>Telescope oldfiles<CR>", "Open Recent Files"},
		R = { "<cmd>Telescope registers<CR>", "Open Registers"},
		s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols"},
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps"},
		n = { "<cmd>lua require('telescope-config').nvim_config()<CR>", "Search Nvim Config Folder"}, --fn
		p = { "<cmd>lua require('telescope-config').grep_prompt()<CR>", "Grep Propmpt"},
		S = { "<cmd>lua require('telescope-config').snippets()<CR>", "Browse snippets"},
		g = {
			name = "Telescope Git",
			s = { "<cmd>Telescope git_status<CR>", "Git Status"},
			c = { "<cmd>Telescope git_commits<CR>", "Git Commits"},
			f = { "<cmd>Telescope git_files<CR>", "Git Files"},
			b = { "<cmd>Telescope git_branches<CR>", "Git Branches"}
		}
	},
	-- BUFFERS
	["b"] = {
		name = "Buffers",
		c = { "<cmd>BufferLinePickClose<cr>", "Pick and close" },
		j = { "<cmd>BufferLinePick<cr>", "Jump to buffer" },
		b = { "<cmd>Telescope buffers<CR>", "Buffers"},
		w = { "<cmd>Bwipeout<cr>", "Wipeout buffer" },
		h = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
		l = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
		H = { "<cmd>BufferLineCloseLeft<cr>", "Close all buffers left" },
		L = { "<cmd>BufferLineCloseRight<CR>", "close all buffers right" },
		S = { "<cmd>BufferLineSortByExtension<cr>", "sort BufferLines automatically by language" },
		d = { "<cmd>BufferLineSortByDirectory<cr>", "sort BufferLines automatically by directory" },
		["["] = { "<cmd>BufferLineMovePrev<cr>", "Move Buffer Left" },
		["]"] = { "<cmd>BufferLineMoveNext<cr>", "Move Buffer Right" },
	},
	-- PACKER
	["p"] = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		r = { "<cmd>lua require('utils').reload_lv_config()<cr>", "Reload" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
	-- GITSIGNS
	["g"] = {
		name = "Git, (gitsigns, diffview, neogit)",
		g = { "<cmd>Neogit<CR>", "Open Neogit"},
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
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
		d = { "<cmd>DiffviewOpen<CR>", "Open Diffview" },
		q = { "<cmd>DiffviewClose<CR>", "Close Diffview" },
		h = { "<cmd>DiffviewFileHistory<CR>", "View File History" },
	},
	-- LSP
	["l"] = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope diagnostics bufrn=0<CR>",
			"Document Diagnostics",
		},
		l = { "<cmd>lua vim.diagnostic.open_float(0, {scope = 'line', border = 'double'})<CR>", "Show Line Diagnostics"},
		t = { "<cmd>lua require'lsp.handlers'.toggle_diagnostics()<CR>", "Toggle Diagnostics (Show/Hide)"},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next()<cr>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		p = { "<cmd>lua vim.lsp.buf.references()<cr>", "Show References" },
		q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>Telescope lsp_references<cr>", "Lsp References(Telescope)" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols(Telescope)" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		-- Saga mappings
		K = { "<cmd>Lspsaga hover_doc<CR>", "Lspsaga Hover_doc"},
		R = { "<cmd>Lspsaga rename<cr>", "Lspsaga Rename" },
		A = { "<cmd>Lspsaga code_action<cr>", "Lspsaga Code_action" },
		H = { "<cmd>Lspsaga signature_help<cr>", "Lspsaga Signature_help" },
		P = { "<cmd>Lspsaga preview_definition<cr>", "Lspsaga Preview_definition" },
		O = { "<cmd>LSoutlineToggle<cr>", "Lspsaga Toggle Outline" },
		F = { "<cmd>Lspsaga lsp_finder<cr>", "Lspsaga Lsp_finder" },
		I = { "<cmd>Lspsaga implement<cr>", "Lspsaga implement" },
	},
	["h"] = {
		name = "Hop & Highlight",
		h = { '<cmd>let @/=""<CR>', "No Highlight" },
		t = { '<cmd>lua require("utils").toggleCursorHighlight()<CR>', 'Toggle Cursor Highlight'},
		c = { '<cmd>lua require("utils").toggleCursorLine()<CR>', 'Toggle Cursor Line'},
		v = { '<cmd>lua require("utils").toggleCursorColumn()<CR>', 'Toggle Cursor Column'}
	},
	-- HOP
	["w"] = {
		name = "Hop",
		w = { '<cmd>HopWord<CR>', "Hop Word" },
		e = { '<cmd>HopLineStart<CR>', "Hop Line Start" },
		l = { '<cmd>HopWordCurrentLine<CR>', "Hop Word Line" },
		d = { '<cmd>HopLine<CR>', "Hop Line" },
		p = { '<cmd>HopPattern<CR>', "Hop Pattern" },
		a = { '<cmd>HopChar1<CR>', "Hop Char 1" },
		s = { '<cmd>Pounce<CR>', "Hop Char 2" },
	},
	-- TROUBLE
	["t"] = {
		name = "Trouble quickfix list",
		t = { '<cmd>TroubleToggle<CR>', "Open Trouble" },
		w = { '<cmd>Trouble lsp_workspace_diagnostics<CR>', "Workspace diagnostics" },
		d = { '<cmd>Trouble lsp_document_diagnostics<CR>', "Document diagnostics" },
		q = { '<cmd>Trouble quickfix<CR>', "Open quickfix list" },
		r = { '<cmd>Trouble lsp_references<CR>', "Open Reference list" },
	},
	-- TERMINAL
	["x"] = {
		name = "Terminal",
		v = { '<cmd>1ToggleTerm size=40 direction=vertical<CR>', "Toggle Vertical 1" },
		s = { '<cmd>2ToggleTerm size=15 direction=horizontal<CR>', "Toggle Horizontal 2" },
		f = { '<cmd>3ToggleTerm direction=float<CR>', "Toggle Float 3" },
		t = { '<cmd>4ToggleTerm direction=tab<CR>', "Toggle Tab 4" },
		x = { '<cmd>exec "!node %"<CR>', "Execute file with node" },
		g = { '<cmd>exec "!go run %"<CR>', "Execute file with go compiler" }
	},
	-- VIM TEST
	[";"] = {
		name = "Vim Test",
		n = { '<cmd>TestNearest -strategy=neovim<CR>', "Test Nearest" },
		f = { '<cmd>TestFile -strategy=neovim<CR>', "Test File" },
		s = { '<cmd>TestSuite -strategy=neovim<CR>', "Test Suite" },
		l = { '<cmd>TestLast -strategy=neovim<CR>', "Test Last" },
		v = { '<cmd>TestVisit -strategy=neovim<CR>', "Test Visit" },
	},
	-- Indent Blankline and char rendering
	["i"] = {
		name = "Chars & indent guides",
		i = { "<cmd>set invlist<CR>", "Toggle white space and tabs" },
		g = { "<cmd>IndentBlanklineToggle<CR>", "Toggle Indent Blanklie" },
		d = { "<cmd>IndentBlanklineDisable<CR><cmd>set nolist<CR>", "Disable all" },
		e = { "<cmd>IndentBlanklineEnable<CR><cmd>set list<CR>", "Enable all" }
	},
	["n"] = {
		name = "Numbers, nvim-tree and browse ",
		r = { "<cmd>set relativenumber!<CR>", "Toogle relative number"},
		n = { "<cmd>set number!<CR>", "Toogle relative number"},
		l = { "<cmd>NvimTreeResize +5<CR>", "Increase size of nvim-tree"},
		h = { "<cmd>NvimTreeResize -5<CR>", "Increase size of nvim-tree"},
		b = { "<cmd>Browse<CR>", "Browse"},
		i = { "<cmd>BrowseInputSearch<CR>", "Browse"},
	},
	["d"] = {
		name = "Debugger",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
		B = { "<cmd>lua require'dap'.clear_breakpoints()<CR>", "Clear breakpoints" },
		l = { "<cmd>lua require'dap'.step_out()<CR>", "Step out" },
		k = { "<cmd>lua require'dap'.step_into()<CR>", "Step into" },
		j = { "<cmd>lua require'dap'.step_over()<CR>", "Step over" },
		c = { "<cmd>lua require'dap'.run_to_cursor()<CR>", "Run into cursor" },
		t = { "<cmd>lua require'dap'.terminate()<CR>", "Terminate" },
		i = { "<cmd>lua require'dap.ui.widgets'.hover()<CR>", "Hover" },
		["?"] = { "<cmd>lua require'dap.ui.widgets'.centered_float(require'dap.ui.widgets'.scopes)<CR>", "Open centered float" },
		K = { "<cmd>lua require'dap'.up()<CR>", "Go up" },
		J = { "<cmd>lua require'dap'.down()<CR>", "Go down" },
		r = { "<cmd>lua require'dap'.repl.open()<CR>", "Open REPL" },
		h = { "<cmd>lua require'dap'.continue()<CR>", "Continue"},
		d = { "<cmd>lua require'dap-config.dap-adapters-configurations'.reload_continue()<CR>", "Continue and reload configurations"},
		S = { "<cmd>lua require'dapui'.toggle('sidebar')<CR>", "Toggle Dapui Sidebar"},
		T = { "<cmd>lua require'dapui'.toggle('tray')<CR>", "Toggle Dapui Tray"}
	}
}

-- NORMAL MODE KEYBINDINGS
wk.register(normal_mappings, normal_mode_options)
