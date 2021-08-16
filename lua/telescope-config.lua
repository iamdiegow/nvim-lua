local actions = require('telescope.actions')

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
		-- border = {},
    -- borderchars = { "─", "│", "─", "│", "+", "+", "+", "+" },
    -- prompt_prefix = "❯ ",
    -- selection_caret = "❯ ",
		prompt_prefix = " ",
		selection_caret = " ",
		initial_mode = "insert",
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" },
		selection_strategy = "reset",
    sorting_strategy = "descending",
    color_devicons = true,
		winblend = 0,
		layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
      horizontal = {
				preview_cutoff = 0.20,
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.5,
    		mirror = false
      },
      vertical = {
				preview_cutoff = 0.20,
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.4,
    		miror = false
      },
    },
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
			}
    },
  },
}

require'telescope'.load_extension('gh')

local M = {}

function M.nvim_config()
  require("telescope.builtin").file_browser {
    prompt_title = " NVim Config Browse",
    cwd = "~/.config/nvim/",
    layout_strategy = "vertical",
  }
end

function M.file_explorer()
  require("telescope.builtin").file_browser {
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

