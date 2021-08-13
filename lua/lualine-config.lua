require("lualine").setup({
  options = {
    icons_enabled = true,
		-- "vscode" | "everforest" | "material" | "neon"
    theme = "neon",
		-- component_separators = {'', ''},
		-- section_separators = {'', ''},
		component_separators = {' ', ' '},
		section_separators = {'', ''},
    --section_separators = { "", "" },
		--component_separators = { " ", " " },
    disabled_filetypes = {},
		left_padding = 1,
		right_padding = 1
  },
  sections = {
    lualine_a = { "mode", "paste" },
    lualine_b = {
      { "diagnostics", sources = { "nvim_lsp" } },
      function()
        return "%="
      end,
      "filename",
    },
		lualine_c = {},
    lualine_x = { "filetype" },
    -- lualine_b = {
    --   {
    --     "progress",
    --   },
    -- },
    lualine_y = {
      { "branch", icon = "" },
      { "diff", color_added = "#a7c080", color_modified = "#ffdf1b", color_removed = "#ff6666" },
    },
    lualine_z = {
      {
        "location",
        icon = "",
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
