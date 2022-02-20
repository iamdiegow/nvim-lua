local g = vim.g
--
-- default keymappings
local nvim_tree_bindings = {
    { key = {"<CR>", "l", "o"}, 						action = "edit" },
	  { key = {"O"},                          action = "edit_no_picker" },
		{ key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
		{ key = "<C-v>",                        action = "vsplit" },
		{ key = "<C-x>",                        action = "split" },
		{ key = "<C-t>",                        action = "tabnew" },
		{ key = "<",                            action = "prev_sibling" },
		{ key = ">",                            action = "next_sibling" },
		{ key = "P",                            action = "parent_node" },
		{ key = { "<BS>", "h" },                action = "close_node" },
	  --keeps the cursor in the tree
		{ key = "<Tab>",                        action = "preview" },
		{ key = "K",                            action = "first_sibling" },
		{ key = "J",                            action = "last_sibling" },
		{ key = "I",                            action = "toggle_ignored" },
		{ key = "H",                            action = "toggle_dotfiles" },
		{ key = "R",                            action = "refresh" },
		{ key = "a",                            action = "create" },
		{ key = "d",                            action = "remove" },
		{ key = "D",                            action = "trash" },
		{ key = "r",                            action = "rename" },
		{ key = "<C-r>",                        action = "full_rename" },
		{ key = "x",                            action = "cut" },
		{ key = "c",                            action = "copy" },
		{ key = "p",                            action = "paste" },
		{ key = "y",                            action = "copy_name" },
		{ key = "Y",                            action = "copy_path" },
		{ key = "gy",                           action = "copy_absolute_path" },
		{ key = "[c",                           action = "prev_git_item" },
		{ key = "]c",                           action = "next_git_item" },
		{ key = "-",                            action = "dir_up" },
		{ key = "s",                            action = "system_open" },
		{ key = "q",                            action = "close" },
		{ key = "g?",                           action = "toggle_help" },
}

-- options that are not migrated yet

g.nvim_tree_auto_ignore_ft = { "dashboard" }
g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
g.nvim_tree_indent_markers = 1
g.nvim_tree_icon_padding = " "
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat {":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??"}
g.nvim_tree_allow_resize = 1
g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows= 1
}
g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink_open = ""
    }
}

require('nvim-tree').setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = true,
  ignore_ft_on_setup  = {},
	auto_open = true,
  auto_close          = true,
  open_on_tab         = false,
  update_to_buf_dir   = {
		enable = true,
		auto_open = false
	},
  hijack_cursor       = true,
	hijack_unnamed_buffer_when_opening = true,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  update_cwd          = true,
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},
  view = {
		hide_root_folder = true,
    width = 25,
		height = 20,
    side = 'left',
    auto_resize = false,
		number = false,
    mappings = {
      custom_only = false,
      list = nvim_tree_bindings
    },
  },
	filters = {
		dotfiles = false,
		custom = {
			"node_modules",
			".git"
		}
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 1000
	},
	trash = {
		cmd = "trash",
		require_confirm = true
	}
}

-- hide statusline when nvim tree is opened
vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]
