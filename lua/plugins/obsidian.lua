local function zettelkastenId(title)
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
end

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
			function()
				vim.ui.input({ prompt = "Enter the new note name..." }, function(input)
					vim.cmd("ObsidianNew " .. input)
				end)
			end,
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
			mode = "v",
			desc = "Create new note from link (Obsidian)",
		},
		{
			"<leader>ok",
			"<CMD>ObsidianLink<CR>",
			mode = "v",
			desc = "Link visual selection to existing note (Obsidian)",
		},
		{
			"<leader>of",
			"<CMD>ObsidianFollowLink<CR>",
			desc = "Follow link (Obsidian)",
		},
		{
			"<leader>oe",
			"<CMD>NvimTreeToggle ~/obsidian-vault<CR>",
			desc = "Open vault with NvimTree (Obsidian)",
		},
		{
			"<leader>og",
			function()
				require("neogit").open({ cwd = "~/obsidian-vault" })
			end,
			desc = "Open Vault with Neogit (Obsidian)",
		},
	},
	opts = {
		dir = "~/obsidian-vault",
		completion = {
			nvim_cmp = true,
		},
		note_id_func = function(title)
			return title
		end,
	},
}
