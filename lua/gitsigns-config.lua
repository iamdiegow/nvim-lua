local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
	return
end

gitsigns.setup {
  signs = {
		add = {
			hl = "GitSignsAdd",
			text = "▎",
			numhl = "GitSignsAddNr",
			linehl = "GitSignsAddLn",
		},
		change = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			text = "契",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		topdelete = {
			hl = "GitSignsDelete",
			text = "契",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
		buffer = true,
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol',
		delay = 500
	},
	preview_config = {
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  word_diff = false,
  --use_internal_diff = true,  -- If luajit is present
}
