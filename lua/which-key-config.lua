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
	["o"] = { "<cmd>SymbolsOutline<CR>", "Toggle Symbols Outline" },
	["="] = { "<cmd>:ColorizerToggle<CR>", "Toggle Colorizer" },
	-- NVIM Tree
	e = { "<cmd>:NvimTreeToggle<CR>", "Open Explorer" },
	-- TELESCOPE
	f = {
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
	b = {
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
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		r = { "<cmd>lua require('utils').reload_lv_config()<cr>", "Reload" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
	-- GITSIGNS
	g = {
		name = "Git",
		g = { "<cmd>G<CR>", "Open Vim Fugitive"},
		c = { "<cmd>Gdiffsplit<CR>", "Open Diff Split"},
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
		q = { "<cmd>Gitsigns toggle_numhl<cr>", "Toggle Number Highlight" },
		b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Line Blame" },
	},
	-- LSP
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope diagnostics bufrn=0<CR>",
			"Document Diagnostics",
		},
		l = { "<cmd>lua vim.diagnostic.open_float(0, {scope = 'line', border = 'double'})<CR>", "Show Line Diagnostics"},
		h = { "<cmd>lua vim.diagnostic.hide()<CR>", "Hide Diagnostics"},
		t = { "<cmd>lua vim.diagnostic.show()<CR>", "Show Diagnostics"},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
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
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	h = {
		name = "Hop & Highlight",
		h = { '<cmd>let @/=""<CR>', "No Highlight" },
		w = { '<cmd>HopWord<CR>', "Hop Word" },
		l = { '<cmd>HopLineStart<CR>', "Hop Line Start" },
		d = { '<cmd>HopLine<CR>', "Hop Line" },
		p = { '<cmd>HopPattern<CR>', "Hop Pattern" },
		a = { '<cmd>HopChar1<CR>', "Hop Char 1" },
		s = { '<cmd>Pounce<CR>', "Hop Char 2" },
		t = { '<cmd>lua require("utils").toggleCursorHighlight()<CR>', 'Toggle Cursor Highlight'},
		c = { '<cmd>lua require("utils").toggleCursorLine()<CR>', 'Toggle Cursor Line'},
		v = { '<cmd>lua require("utils").toggleCursorColumn()<CR>', 'Toggle Cursor Column'}
	},
	-- TROUBLE
	t = {
		name = "Trouble quickfix list",
		t = { '<cmd>TroubleToggle<CR>', "Open Trouble" },
		w = { '<cmd>Trouble lsp_workspace_diagnostics<CR>', "Workspace diagnostics" },
		d = { '<cmd>Trouble lsp_document_diagnostics<CR>', "Document diagnostics" },
		q = { '<cmd>Trouble quickfix<CR>', "Open quickfix list" },
		r = { '<cmd>Trouble lsp_references<CR>', "Open Reference list" },
	},
	-- TERMINAL
	x = {
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
		name = "Numbers and nvim-tree",
		r = { "<cmd>set relativenumber!<CR>", "Toogle relative number"},
		n = { "<cmd>set number!<CR>", "Toogle relative number"},
		l = { "<cmd>NvimTreeResize +5<CR>", "Increase size of nvim-tree"},
		h = { "<cmd>NvimTreeResize -5<CR>", "Increase size of nvim-tree"},
	}
}

-- NORMAL MODE KEYBINDINGS
wk.register(normal_mappings, normal_mode_options)
