require('zen-mode').setup({
	window = {
		backdrop = 0.60,
		width = 80,
		height = 1,
		options = {
			number = false,
			cursorline = false,
			cursorcolumn = false
		}
	},
	plugins = {
		twilight = { enabled = false },
		gitsigns = { enabled = true }
	}
})

require('twilight').setup({})
