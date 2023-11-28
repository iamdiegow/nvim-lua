return {
	"ThePrimeagen/harpoon",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	keys = {
		{
			"<leader>hh",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
			desc = "(Harpoon) Toggle Quick Menu",
		},
		{
			"<leader>ha",
			"<cmd>lua require('harpoon.mark').add_file()<CR>",
			desc = "(Harpoon) Add file",
		},
		{
			"<leader>j",
			"<cmd>lua require('harpoon.ui').nav_prev()<CR>",
			desc = "(Harpoon) Navigate Previous File ",
		},
		{
			"<leader>k",
			"<cmd>lua require('harpoon.ui').nav_next()<CR>",
			desc = "(Harpoon) Navigate Next File",
		},
	},
	config = function()
		require("harpoon").setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
				excluded_filetypes = {
					"harpoon",
					"NvimTree",
					"lazy",
					"TelescopePrompt",
				},
			},
		})
	end,
}
