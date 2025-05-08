local opts = {
	settings = {
		codeAction = {
			showDocumentation = false,
		},
		quiet = true,
		run = "onType",
		workingDirectory = {
			mode = "location",
		},
	},
}

return opts
