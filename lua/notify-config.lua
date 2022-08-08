local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

notify.setup {
  stages = "static",
  on_open = nil,
  on_close = nil,
  render = "minimal",
  timeout = 4000,
  background_colour = "Normal",
  minimum_width = 10,
}

vim.notify = notify
