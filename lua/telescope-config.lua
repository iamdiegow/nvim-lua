vim.cmd([[
	nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
	nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
	nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
	nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]])

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
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    sorting_strategy = "ascending",
    color_devicons = true,
    layout_config = {
      prompt_position = "top",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.7,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },
    mappings = {},
  },
}

local M = {}


function M.find_files()
  require("telescope.builtin").find_files {
    prompt_title = "Search .config",
    path_display = { "shorten" },
    search_dirs = {
      "~/.config",
    },
    cwd = "~/.config/nvim/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

function M.nvim_config()
  require("telescope.builtin").file_browser {
    prompt_title = " NVim Config Browse",
    cwd = "~/.config/nvim/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
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

return M

