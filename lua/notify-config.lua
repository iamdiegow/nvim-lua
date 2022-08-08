local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

local icons = require "user.icons"

notify.setup {
  stages = "static",
  on_open = nil,
  on_close = nil,
  render = "minimal",
  timeout = 150,
  background_colour = "Normal",
  minimum_width = 10,
}

vim.notify = notify
