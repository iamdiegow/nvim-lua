return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	keys = {
		{
			"<leader>ha",
			function()
				local harpoon = require("harpoon")
				harpoon:list():add()
			end,
			desc = "Add to list (Harpoon)",
		},
		{
			"<leader>hl",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Show list (Harpoon)",
		},
		{
			"<leader>h1",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(1)
			end,
			desc = "Go to 1 (Harpoon)",
		},
		{
			"<leader>h2",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(2)
			end,
			desc = "Go to 2 (Harpoon)",
		},
		{
			"<leader>h3",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(3)
			end,
			desc = "Go to 3 (Harpoon)",
		},
		{
			"<leader>h4",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(4)
			end,
			desc = "Go to 4 (Harpoon)",
		},
		{
			"<leader>hp",
			function()
				local harpoon = require("harpoon")
				harpoon:list():prev()
			end,
			desc = "Go to Previous (Harpoon)",
		},
		{
			"<leader>hn",
			function()
				local harpoon = require("harpoon")
				harpoon:list():next()
			end,
			desc = "Go to Next (Harpoon)",
		},
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local extensions = require("harpoon.extensions")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})
		harpoon:extend(extensions.builtins.navigate_with_number())
	end,
}
