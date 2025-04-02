return {
	"epwalsh/obsidian.nvim",
	version = "*",
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = {
		"ObsidianSearch",
	},
	keys = {
		{ "<leader>'s", "<cmd>ObsidianSearch<CR>", desc = "Search (Obsidian)" },
		{ "<leader>''", "<cmd>ObsidianQuickSwitch<CR>", desc = "QuickSwitch (Obsidian)" },
		{ "<leader>'n", "<cmd>ObsidianNew<CR>", desc = "New (Obsidian)" },
		{ "<leader>'b", "<cmd>ObsidianBacklinks<CR>", desc = "BackLinks (Obsidian)" },
		{ "<leader>'l", "<cmd>ObsidianLinkNew<CR>", desc = "New Link (Obsidian)" },
		{
			"<leader>'t",
			"<cmd>ObsidianTags<CR>",
			desc = "Tags (Obsidian)",
		},
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "vault",
					path = "~/obsidian-vault",
				},
			},
			ui = {
				enable = false,
			},
			completion = {
				nvim_cmp = false,
				min_chars = 2,
			},
			preferred_link_style = "wiki",
			note_id_func = function(title)
				local suffix = ""
				if title ~= nil then
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(suffix .. "-" .. os.time())
			end,
		})
	end,
}
