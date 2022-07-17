local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end

vim.go.scrolloff = 5

neoscroll.setup {
  mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  hide_cursor = false,
  stop_eof = true,
  use_local_scrolloff = false,
  respect_scrolloff = false,
  cursor_scrolls_alone = true,
  easing_function = nil,
  pre_hook = nil,
  post_hook = nil,
}

local t = {}

t['<C-u>'] = {'scroll', {'-5', 'true', '50'}}
t['<C-d>'] = {'scroll', {'5', 'true', '50'}}

require('neoscroll.config').set_mappings(t)
