return {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		event = "BufReadPost",
		keys = {
			{
				"<leader>ig",
				"<cmd>IndentBlanklineToggle<CR>",
				{ desc = "Toggle indent line" },
			},
		},
		config = function()
			local status_ok, indent_blankline = pcall(require, "indent_blankline")
			if not status_ok then
				return
			end

			vim.opt.termguicolors = true

			vim.cmd([[
	highlight IndentBlanklineContextStart guisp=#FFFFFF gui=bold
	highlight IndentBlanklineContextChar guifg=#FFFFFF gui=bold
]])

			indent_blankline.setup({
				enabled = false,
				char = "│",
				buftype_exclude = { "terminal", "nofile" },
				filetype_exclude = {
					"help",
					"dashboard",
					"packer",
					"NvimTree",
					"Trouble",
				},
				show_first_indent_level = true,
				space_char_blankline = " ",
				show_end_of_line = true,
				use_treesitter = true,
			})
		end,
	},
	{
		"echasnovski/mini.indentscope",
		enabled = false,
		event = "VeryLazy",
		version = "*",
		config = function()
			require("mini.indentscope").setup({
				draw = {
					delay = 1000,
				},
				--"⎟ ⎜ ⎢ ⎜ ▏ ▊ ▋ ▉ ▎ ▍ ▋ ▍ ▎╎"
				symbol = "▍",
				options = {
					border = "top",
				},
			})
		end,
	},
}
