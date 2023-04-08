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
			prefer_width = 60,
			win_options = {
				winblend = 0,
				wrap = false,
				list = true,
				listchars = "precedes:…,extends:…",
				sidescrolloff = 0,
			},
		},
		select = {
			enabled = true,
			trim_prompt = true,
		},
	},
}
