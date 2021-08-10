local wk = require'which-key'

wk.setup {
	plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
		-- icons = {
		-- 	breadcrumb = "»",
		-- 	separator = "➜",
		-- 	group = "+",
		-- },
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
  operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
		["<leader>"] = "LEADER"
  },
  window = {
    border = "none",
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
	-- TELESCOPE
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<CR>", "Find Files" }, --ff
		r = { "<cmd>Telescope live_grep<CR>", "Live Grep"}, --fr
		b = { "<cmd>Telescope buffers<CR>", "Buffers"}, --fb
		c = { "<cmd>Telescope colorscheme<CR>", "Colorschemes"}, --fc
		h = { "<cmd>Telescope help_tags<CR>", "Help Tags"}, --fh
		s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols"}, --fs
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps"}, --fk
		n = { "<cmd>Telescope nvim_config<CR>", "Search Nvim Config Folder"}, --fn
		p = { "<cmd>lua require('telescope-config').grep_prompt()<CR>", "Grep Propmpt"}, --fp
		g = {
			name = "Telescope Git",
			s = { "<cmd>Telescope git_status<CR>", "Git Status"}, --fgs
			c = { "<cmd>Telescope git_commits<CR>", "Git Commits"}, --fgc
			f = { "<cmd>Telescope git_files<CR>", "Git Files"}, --fgc
			b = { "<cmd>Telescope git_branches<CR>", "Git Branches"}, --fgb
			r = { "<cmd>lua require('telescope').extensions.gh.run({wincmd = 'new'})<CR>", "GH List Workflow Runs"}, --fgr
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
		}, --gu
	},
}

-- NORMAL MODE KEYBINDINGS
wk.register(normal_mappings, normal_mode_options)