return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>'s", "<cmd>Obsidian search<CR>", desc = "Search (Obsidian)" },
		{ "<leader>''", "<cmd>Obsidian quick_switch<CR>", desc = "QuickSwitch (Obsidian)" },
		{ "<leader>'n", "<cmd>Obsidian new<CR>", desc = "New (Obsidian)" },
		{ "<leader>'b", "<cmd>Obsidian backlinks<CR>", desc = "BackLinks (Obsidian)" },
		{ "<leader>'l", "<cmd>Obsidian link_new<CR>", desc = "New Link (Obsidian)" },
		{ "<leader>'l", "<cmd>Obsidian follow_link<CR>", desc = "Follow Link (Obsidian)" },
		{
			"<leader>'t",
			"<cmd>Obsidian tags<CR>",
			desc = "Tags (Obsidian)",
		},
	},
	config = function()
		require("obsidian").setup({
			legacy_commands = false,
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
				blink = true,
				min_chars = 2,
			},
			preferred_link_style = "wiki",
			picker = {
				name = "fzf-lua",
			},
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
