return {
	"epwalsh/obsidian.nvim",
	cmd = {
		"ObsidianNew",
		"ObsidianSearch",
		"ObsidianCheck",
	},
	keys = {
		{
			"<leader>ob",
			"<CMD>ObsidianBacklinks<CR>",
			desc = "Show backlinks list of current file (Obsidian)",
		},
		{
			"<leader>on",
			"<CMD>ObsidianNew<CR>",
			desc = "Open new note without title (Obsidian)",
		},
		{
			"<leader>os",
			"<CMD>ObsidianSearch<CR>",
			desc = "Search notes (Obsidian)",
		},
		{
			"<leader>ol",
			"<CMD>ObsidianLinkNew<CR>",
			desc = "Create new note from link (Obsidian)",
		},
		{
			"<leader>ok",
			"<CMD>ObsidianLink<CR>",
			desc = "Link visual selection (Obsidian)",
		},
		{
			"<leader>of",
			"<CMD>ObsidianFollowLink<CR>",
			desc = "Follow link (Obsidian)",
		},
	},
	opts = {
		dir = "~/obsidian-vault",
		completion = {
			nvim_cmp = true,
		},
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,
	},
}
