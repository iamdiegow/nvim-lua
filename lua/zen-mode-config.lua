require('zen-mode').setup({
	window = {
		backdrop = 0.60,
		width = 80,
		height = 1,
		options = {
			number = false,
			cursorline = true,
			cursorcolumn = true
		}
	},
	plugins = {
		twilight = { enabled = false },
		gitsigns = { enabled = false }
	}
})

require('twilight').setup({})
