return {
	"akinsho/nvim-toggleterm.lua",
	cmd = "ToggleTerm",
	keys = {
		{ "<C-x>", "<cmd>ToggleTerm<CR>", desc = "Open terminal" },
		{ "<leader>ts", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "(Terminal) Open horizontal terminal" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "(Terminal) Open vertical terminal" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "(Terminal) Open floating terminal" },
	},
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<c-x>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = false,
			shading_factor = 1,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "single",
				winblend = 0,
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
