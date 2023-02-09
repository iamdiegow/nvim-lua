return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = {
		input = {
			enabled = true,
			default_prompt = "Input:",
			prompt_align = "center",
			insert_only = true,
			start_in_insert = true,
			border = "single",
			relative = "editor",
			prefer_width = 40
		},
		select = {
			enabled = true,
			trim_prompt = true
		}
	}
}
