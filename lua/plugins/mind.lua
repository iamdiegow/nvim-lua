local isOpen = false

return {
	"phaazon/mind.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>oo",
			function()
				if isOpen == true then
					vim.cmd("MindClose")
				else
					vim.cmd("MindOpenMain")
				end
				isOpen = not isOpen
			end,
			desc = "Mind Open Main Vault",
		},
		{
			"<leader>or",
			"<cmd>:MindReloadState<cr>",
			desc = "Mind Reload State",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("mind").setup({
			keymaps = {
				normal = {
					["<leader>os"] = "open_data_index",
				},
			},
		})
	end,
}
