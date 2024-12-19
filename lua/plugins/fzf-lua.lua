return {
	{
		"ibhagwan/fzf-lua",
		keys = {
			{
				"<leader>sf",
				function()
					require("fzf-lua").files()
				end,
				desc = "Files (fzf-lua)",
			},
			{
				"<leader>ss",
				function()
					require("fzf-lua").lsp_document_symbols()
				end,
				desc = "Document Symbols (fzf-lua)",
			},
			{
				"<leader>sd",
				function()
					require("fzf-lua").lsp_document_diagnostics()
				end,
				desc = "Document Diagnostics (fzf-lua)",
			},
			{
				"<C-p>",
				function()
					require("fzf-lua").files({
						winopts = {
							preview = {
								hidden = "hidden",
							},
						},
						formatter = "path.filename_first",
					})
				end,
				desc = "Files (fzf-lua)",
			},
			{
				"<leader>sp",
				function()
					require("fzf-lua").resume()
				end,
				desc = "Resume (fzf-lua)",
			},
			{
				"<leader>sb",
				function()
					require("fzf-lua").buffers({
						winopts = {
							preview = {
								hidden = "hidden",
							},
						},
					})
				end,
				desc = "Buffers (fzf-lua)",
			},
			{
				"<leader>so",
				function()
					require("fzf-lua").oldfiles()
				end,
				desc = "Old Files (fzf-lua)",
			},
			{
				"<leader>sr",
				function()
					require("fzf-lua").grep()
				end,
				desc = "Grep (fzf-lua)",
			},
			{
				"<leader>sc",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Live Grep (fzf-lua)",
			},
			{
				"<leader>sl",
				function()
					require("fzf-lua").git_status({
						winopts = {
							preview = {
								hidden = "hidden",
							},
						},
					})
				end,
				desc = "Git Status (fzf-lua)",
			},
		},
		config = function()
			require("fzf-lua").setup({
				winopts = {
					preview = {
						default = "builtin",
					},
				},
				defaults = {
					file_icons = false,
					git_icons = false,
					color_icons = false,
					formatter = "path.filename_first",
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
