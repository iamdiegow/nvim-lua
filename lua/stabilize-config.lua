require("stabilize").setup({
	force = true,
	forcemark = nil,
	ignore = {
		filetype = { "help", "list", "NvimTree" },
		buftype = { "terminal", "quickfix", "loclist"}
	},
	nested = nil
})
