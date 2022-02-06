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
    border = "shadow",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
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
	-- ["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
	-- ["c"] = { "<cmd>BufferLinePickClose<CR>", "Close Buffer Pick" },
	["c"] = { "<cmd>lua require('bufferline-config').closeBuffer()<CR>", "Close Buffer Pick" },
	["s"] = { "<cmd>luafile %<CR>", "Source File" },
	["o"] = { "<cmd>SymbolsOutline<CR>", "Toggle Symbols Outline" },
	["j"] = { "5j", "Move 5 down" },
	["k"] = { "5k", "Move 5 up" },
	-- NVIM Tree
	e = {"<cmd>:NvimTreeToggle<CR>", "Open Explorer"},
	-- TELESCOPE
	f = {
		name = "Telescope",
		a = { "<cmd>Telescope file_browser<CR>", "Browse Files" }, --fa
		f = { "<cmd>Telescope find_files<CR>", "Find Files" }, --ff
		r = { "<cmd>Telescope live_grep<CR>", "Live Grep"}, --fr
		b = { "<cmd>Telescope buffers<CR>", "Buffers"}, --fb
		c = { "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<CR>", "Colorschemes"}, --fc
		h = { "<cmd>Telescope help_tags<CR>", "Help Tags"}, --fh
		o = { "<cmd>Telescope oldfiles<CR>", "Open Recent Files"}, --fo
		R = { "<cmd>Telescope registers<CR>", "Open Registers"}, --fR
		s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols"}, --fs
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps"}, --fk
		n = { "<cmd>lua require('telescope-config').nvim_config()<CR>", "Search Nvim Config Folder"}, --fn
		p = { "<cmd>lua require('telescope-config').grep_prompt()<CR>", "Grep Propmpt"}, --fp
		g = {
			name = "Telescope Git",
			s = { "<cmd>Telescope git_status<CR>", "Git Status"}, --fgs
			c = { "<cmd>Telescope git_commits<CR>", "Git Commits"}, --fgc
			f = { "<cmd>Telescope git_files<CR>", "Git Files"}, --fgc
			b = { "<cmd>Telescope git_branches<CR>", "Git Branches"}, --fgb
		}
	},
	-- BUFFERS
	b = {
		name = "Buffers",
		j = { "<cmd>BufferLinePick<cr>", "Jump to buffer" }, --bj
		f = { "<cmd>Telescope buffers<cr>", "Find buffer" }, --bf
		w = { "<cmd>Bwipeout<cr>", "Wipeout buffer" }, --bw
		h = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" }, --bh
		l = {
			"<cmd>BufferLineCycleNext<cr>", "Next Buffer"}, --bl
		H = { "<cmd>BufferLineCloseRight<cr>", "Close all buffers left" }, --bH
		L = {
			"<cmd>BufferLineCloseLeft<cr>", "close all BufferLines right"}, --bL
		S = {
			"<cmd>BufferLineSortByExtension<cr>",
			"sort BufferLines automatically by language",
		}, --bS
		["["] = { "<cmd>BufferLineMovePrev<cr>", "Move Buffer Left" }, --b[
		["]"] = { "<cmd>BufferLineMoveNext<cr>", "Move Buffer Right" }, --b]
	},
	-- PACKER
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" }, --pc
		i = { "<cmd>PackerInstall<cr>", "Install" }, --pi
		r = { "<cmd>lua require('utils').reload_lv_config()<cr>", "Reload" }, --pr
		s = { "<cmd>PackerSync<cr>", "Sync" }, --ps
		S = { "<cmd>PackerStatus<cr>", "Status" }, --pS
		u = { "<cmd>PackerUpdate<cr>", "Update" }, --pu
	},
	-- GITSIGNS
	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" }, --g
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" }, --gk
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" }, --gl
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" }, --gp
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" }, --gr
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" }, --gR
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" }, --gs
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
		s = { '<cmd>HopChar2<CR>', "Hop Char 2" },
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
		s = { '<cmd>2ToggleTerm size=10 direction=horizontal<CR>', "Toggle Horizontal 2" },
		f = { '<cmd>3ToggleTerm direction=float<CR>', "Toggle Terminal 3" },
		a = { '<cmd>ToggleTermOpenAll<CR>', "Open All Terminals" },
		q = { '<cmd>ToggleTermCloseAll<CR>', "Close All Terminals" },
		x = { '<cmd>exec "!node %"<CR>', "Execute file with node" }
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
	-- NVIM DAP (DEBUGGER)
	-- d = {
	-- 	name = "Debugger (nvim-dap)",
	--     d = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
	--     b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
	--     c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
	--     C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
	--     t = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
	--     g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
	--     l = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
	--     j = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
	--     k = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
	--     p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
	--     r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
	--     s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
	--     q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
	--     L = { "<cmd>lua require'nvim-dap-config'.launch()<CR>", "Launch" },
	-- }
}

-- NORMAL MODE KEYBINDINGS
wk.register(normal_mappings, normal_mode_options)
