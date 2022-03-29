local g = vim.g

-- options that are not migrated yet

g.nvim_tree_auto_ignore_ft = { "dashboard" }
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
	auto_reload_on_write = true,
  disable_netrw = true,
  hijack_netrw = false,
  open_on_setup = true, -- open the tree if no file is provided
  quit_on_open = true,
  ignore_ft_on_setup = {},
	auto_open = true,
  auto_close = true,
  open_on_tab = false,
  update_to_buf_dir = {
		enable = true,
		auto_open = false
	},
  hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_cwd = true,
  update_focused_file = {
    enable = false,
    update_cwd = false,
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
    auto_resize = true,
		number = false,
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
	},
	actions = {
		change_dir = {
			enable = true,
			global = false
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				}
			}
		}
	}
}

vim.o.splitright = true

-- hide statusline when nvim tree is opened
vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree_1" | set laststatus=0 | else | set laststatus=2 | endif]]
