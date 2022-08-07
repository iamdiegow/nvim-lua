local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	return
end

local status_ok, navic = pcall(require, 'nvim-navic')
if not status_ok then
	return
end

local window_width_limit = 60

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
	colored = true,
	icon_only = true,
	icon = {
		align = "left"
	}
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = {"error", "warn"},
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	cond = conditions.hide_in_width,
	always_visible = true
}

local diff = {
	"diff",
	source = diff_source,
	symbols = { added = " ", modified = "柳", removed = " " },
	colored = true,
	cond = hide_in_width,
}


local branch = {
	"branch",
	"b:gitsigns_head",
	icons_enabled = true,
	icon = "",
	color = { gui = "bold" }
}

local filename = {
	"filename",
	path = 0,
	file_status = true,
	shorting_target = 30,
	fmt = function(str)
		if(str == 'NvimTree_1[-]') then
			return ''
		else
			return " " .. str
		end
	end,
	component_separators = { left = '', right = '' },
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = vim.g.color_theme,
    -- component_separators = { left = "", right = "" },
    -- section_separators = { left = "", right = "" },
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		left_padding = 0,
		right_padding = 0,
		disabled_filetypes = {
			"Outline"
		},
		always_divide_middle = true,
		globalstatus = true
  },
  sections = {
    lualine_a = { { "mode" }, { "paste" } },
		lualine_b = { filename, filetype },
    lualine_c = {},
    lualine_x = {{ navic.get_location, cond = navic.is_available }, branch },
		lualine_y = { diff },
    lualine_z = { diagnostics }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

vim.cmd([[
 au BufEnter * :set laststatus=3
]])
