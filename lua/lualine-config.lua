local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	return
end

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

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > window_width_limit
  end
}

local filetype = {
 "filetype",
	condition = conditions.hide_in_width
}

local diagnostics = {
	{ "diagnostics",
		sources = { "nvim_diagnostic" },
		sections = {"error", "warn"},
		symbols = { error = " ", warn = " " },
		color = {},
		condition = conditions.hide_in_width,
		colored = false,
		always_visible = true
	},
}

local diff = {
	"diff",
	source = diff_source,
	symbols = { added = "  ", modified = "柳", removed = " " },
	color_added = "#a7c080",
	color_modified = "#ffdf1b",
	color_removed = "#ff6666",
	color = {},
	cond = hide_in_width,
}

local branch = {
	"branch",
	"b:gitsigns_head",
	icons_enabled = true,
	icon = "",
	color = {gui = "bold"}
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = vim.g.color_theme,
		section_separators = {' ', ' '},
		component_separators = {' ', ' '},
		left_padding = 1,
		right_padding = 1,
		disabled_filetypes = {
			"Outline"
		},
		always_divide_middle = false,
		globalstatus = true
  },
  sections = {
    lualine_a = { {"mode"}, "paste" },
    lualine_b = diagnostics,
		lualine_c = {
			filetype
		},
    lualine_x = {
			"filename"
		},
    lualine_y = {
 			branch,
      diff
  	},
			-- { "diff", color_added = "#a7c080", color_modified = "#ffdf1b", color_removed = "#ff6666" },
    lualine_z = {
      {
        "location",
        icon = "",
				cond = hide_in_width
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{ "filename", cond = hide_in_width }},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

vim.cmd([[
 au BufEnter * :set laststatus=3
]])
