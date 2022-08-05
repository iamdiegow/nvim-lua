local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')

local ivyConfig = {
	theme = "ivy",
	layout_config = {
		prompt_position = "bottom",
		height = 15,
	},
	previewer = false,
	winblend = 5
}

local verticalConfig = {
	layout_strategy = 'vertical',
	layout_config = {
		vertical = {
			mirror = true,
			prompt_position = 'top',
			width = 90,
			height = 15
		},
	},
	previewer = false
}

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
		selection_strategy = "reset",
    sorting_strategy = "descending",
		scroll_strategy = "cycle",
		border = {},
		prompt_prefix = " ",
		selection_caret = " ",
		initial_mode = "insert",
		use_less = false,
		set_env = { ["COLORTERM"] = "truecolor" },
		file_ignore_patterns = {"node_modules", ".git/"},
    color_devicons = true,
		winblend = 0,
		-- 'flex' | 'horizontal' | 'vertical' | 'bottom_pane'
		layout_strategy = "flex",
    layout_config = {
      prompt_position = "top",
      horizontal = {
				prompt_position = "bottom",
				preview_cutoff = 0.20,
				preview_width = 0.6,
    		mirror = false
      },
      vertical = {
				prompt_position = "bottom",
				preview_cutoff = 0.20,
        preview_height = 0.5,
    		mirror = false
      },
			center = {
				preview_cutoff = 0.20,
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.8,
    		mirror = true
			}
    },
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
				-- M is the Alt key
				["<M-p>"] = actions_layout.toggle_preview
			}
    },
  },
	pickers = {
		find_files = vim.tbl_deep_extend("force", verticalConfig, {
			prompt_title = " Project files",
			layout_config = { vertical = { height = 15 }},
			hidden = true,
			find_command = {
				"rg",
				"--files",
				"--hidden"
			},
			file_ignore_patterns = {
				".git/",
				"node_modules/"
			}
		}),
		buffers = vim.tbl_deep_extend("force", verticalConfig, {
			show_all_buffers = true,
			sort_lastused = true,
			mappings = {
				i = {
					['<C-d>'] = 'delete_buffer'
				},
				n = {
					['d'] = 'delete_buffer'
				}
			}
		}),
		oldfiles = verticalConfig,
		lsp_document_symbols = ivyConfig
	}
}

local M = {}

function M.nvim_config()
  require("telescope.builtin").find_files {
    prompt_title = " NVim Config Browse",
    cwd = "~/.config/nvim/"
  }
end

function M.snippets()
  require("telescope.builtin").find_files {
    prompt_title = " Browse custom snippets",
    cwd = "~/.config/nvim/lua/snippets"
  }
end

function M.file_explorer()
  require("telescope.builtin").find_files {
    prompt_title = " File Browser",
    path_display = { "shorten" },
    cwd = "~",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

function M.grep_prompt()
	require('telescope.builtin').grep_string {
		path_display = true,
		search = vim.fn.input("Rg> "),
	}
end

function M.fuzzy_find_file()
	require('telescope.builtin').current_buffer_fuzzy_find {
    prompt_title = " Fuzzy Find Buffer",
		sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
		}
	}
end

return M

