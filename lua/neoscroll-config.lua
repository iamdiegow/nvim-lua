local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
	return
end

neoscroll.setup({
	easing_function = "circular",
	mappings = {},
	hide_cursor = false,
	stop_eof = true,
	respect_scrolloff = true,
})

vim.keymap.set("n", "<C-u>", function()
	neoscroll.scroll(-5, true, 100, "sine")
end, { desc = "Neoscroll move down" })

vim.keymap.set("n", "<C-d>", function()
	neoscroll.scroll(5, true, 100, "sine")
end, { desc = "Neoscroll move down" })
