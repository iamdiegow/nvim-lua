require('zen-mode').setup({
	window = {
		backdrop = 0.80,
		width = 100,
		height = 0.85,
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
