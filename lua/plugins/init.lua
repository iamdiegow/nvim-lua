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
				width = 120,
				height = 1,
				options = {
					number = true,
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
		event = "VeryLazy",
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
	{
		"axieax/urlview.nvim",
		cmd = { "UrlView " },
		keys = {
			{
				"<leader>lv",
				"<cmd>UrlView<cr>",
				desc = "View Links",
			},
		},
		config = function()
			require("urlview").setup({})
		end,
	},
	{
		"arnamak/stay-centered.nvim",
		event = "VeryLazy",
		config = function()
			require("stay-centered")
		end,
	},
}
