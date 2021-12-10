local window_width_limit = 80

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > window_width_limit
  end,
  -- check_git_workspace = function()
  --   local filepath = vim.fn.expand "%:p:h"
  --   local gitdir = vim.fn.finddir(".git", filepath .. ";")
  --   return gitdir and #gitdir > 0 and #gitdir < #filepath
  -- end,
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = vim.g.color_theme,
		-- component_separators = {'', ''},
		-- section_separators = {'', ''},
		section_separators = {' ', ' '},
		component_separators = {' ', ' '},
		-- section_separators = {'', ''},
    --section_separators = { "", "" },
		--component_separators = { " ", " " },
    disabled_filetypes = {
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dapui_watches",
			"dap-repl"
		},
		left_padding = 1,
		right_padding = 1
  },
  sections = {
    lualine_a = {{"mode"}, "paste" },
    lualine_b = {
      { "diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				color = {},
				condition = conditions.hide_in_width
			},
			-- {
			-- 	"filename",
			-- 	function()
			-- 		return "%="
			-- 	end,
			-- }
    },
		lualine_c = {},
    lualine_x = {
			{ "filetype",
				condition = conditions.hide_in_width
			}
		},
    -- lualine_b = {
    --   {
    --     "progress",
    --   },
    -- },
    lualine_y = {
      { "branch", "b:gitsigns_head", icon = "", color = {gui = "bold"} },
      {
				"diff",
				source = diff_source,
				symbols = { added = "  ", modified = "柳", removed = " " },
				color_added = "#a7c080",
				color_modified = "#ffdf1b",
				color_removed = "#ff6666",
				color = {},
				condition = nil,
			},
  	},
			-- { "diff", color_added = "#a7c080", color_modified = "#ffdf1b", color_removed = "#ff6666" },
    lualine_z = {
      {
        "location",
        icon = "",
				condition = conditions.hide_in_width
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
