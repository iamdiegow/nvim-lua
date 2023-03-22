return {
	"folke/lazy.nvim",
	-- Workflow
	{
		"famiu/bufdelete.nvim",
		keys = {
			{
				"<leader>c",
				"<cmd>Bwipeout<CR>",
				desc = "Close Buffer",
			},
		},
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		cmd = {
			"ObsidianNew",
			"ObsidianSearch",
			"ObsidianCheck",
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
	},
	-- UI
	{
		"luukvbaal/stabilize.nvim",
		event = "VeryLazy",
		config = function()
			require("stabilize").setup({
				force = true,
				forcemark = nil,
				ignore = {
					filetype = { "help", "list", "NvimTree" },
					buftype = { "terminal", "quickfix", "loclist" },
				},
				nested = nil,
			})
		end,
	},
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		keys = {
			{
				"<leader>z",
				"<cmd>ZenMode<CR>",
				desc = "Toggle Zen Mode",
			},
		},
		opts = {
			window = {
				backdrop = 1,
				width = 100,
				height = 1,
				options = {
					number = false,
					relativenumber = false,
					cursorline = true,
				},
			},
			plugins = {
				twilight = { enabled = false },
			},
		},
	},
	{
		"folke/twilight.nvim",
		cmd = "Twilight",
	},
	{
		"norcalli/nvim-colorizer.lua",
		cmd = { "ColorizerToggle" },
		opts = {
			filetypes = { "*", "!lazy" },
			buftype = { "*", "!prompt", "!nofile" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = true,
				AARRGGBB = false,
				rgb_fn = true,
				hsl_fn = true,
				css = false,
				css_fn = true,
				mode = "background",
				virtualtext = "■",
			},
		},
	},
	{
		"aaron-p1/virt-notes.nvim",
		event = "BufReadPost",
		pin = true,
		opts = {
			notes_path = vim.fn.stdpath("data") .. "/virt_notes",
			hl_group = "WildMenu",
			remove_schemes = { "oil" },
			mappings = {
				prefix = "<Leader>v",
				actions = {
					add = { keys = "<prefix>a", opts = { desc = "Add note" } },
					edit = { keys = "<prefix>e", opts = { desc = "Edit note" } },
					remove = { keys = "<prefix>dd", opts = { desc = "Delete note" } },
					remove_on_line = { keys = "<prefix>dl", opts = { desc = "Delete all notes on line" } },
					remove_in_file = { keys = "<prefix>da", opts = { desc = "Delete all notes in file" } },
					move = { keys = "<prefix>x", opts = { desc = "Move note" } },
					paste = { keys = "<prefix>p", opts = { desc = "Paste note" } },
				},
			},
		},
	},
}
