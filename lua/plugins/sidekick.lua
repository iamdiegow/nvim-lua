return {
	"folke/sidekick.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		cli = {
			mux = {
				backend = "tmux",
				enabled = true,
				create = "window",
			},
			win = {
				layout = "right",
			},
			picker = "telescope",
			prompts = {
				english = "Please review the grammar and syntax (English) of this {file}",
			},
		},
		nes = {
			enabled = false,
		},
	},
	keys = {
		{
			"<leader>aa",
			function()
				require("sidekick.cli").toggle({
					filter = {
						installed = true,
					},
				})
			end,
			desc = "Sidekick Toggle CLI",
		},
		{
			"<leader>as",
			function()
				require("sidekick.cli").select({
					filter = {
						installed = true,
					},
				})
			end,
			desc = "Select CLI",
		},
		{
			"<leader>af",
			function()
				require("sidekick.cli").send({ msg = "{file}" })
			end,
			mode = { "x", "n" },
			desc = "Sidekick Send File",
		},
		{
			"<leader>at",
			function()
				require("sidekick.cli").send({ msg = "{this}" })
			end,
			mode = { "x", "n" },
			desc = "Sidekick Send This",
		},
		{
			"<leader>av",
			function()
				require("sidekick.cli").send({ msg = "{selection}" })
			end,
			mode = { "x" },
			desc = "Sidekick Send Visual Selection",
		},
		{
			"<leader>ap",
			function()
				require("sidekick.cli").prompt()
			end,
			mode = { "n", "x" },
			desc = "Sidekick Select Prompt",
		},
		{
			"<leader>ac",
			function()
				require("sidekick.cli").toggle({ name = "opencode", focus = true })
			end,
			desc = "Sidekick Toggle Opencode",
		},
	},
}
