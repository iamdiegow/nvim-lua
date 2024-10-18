return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	cmd = { "RenderMarkdown " },
	keys = {
		{
			"<leader>=m",
			"<cmd>RenderMarkdown toggle<CR>",
			desc = "RenderMarkdown Toggle",
		},
	},
	ft = "markdown",
	opts = {
		enabled = false,
		preset = "obsidian",
	},
}
