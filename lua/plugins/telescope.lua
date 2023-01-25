local ivyConfig = {
	theme = "ivy",
	layout_config = {
		prompt_position = "top",
		height = 15,
	},
	previewer = false,
	winblen = 0,
	border = true,
}

local verticalConfig = {
	layout_strategy = "vertical",
	layout_config = {
		vertical = {
			mirror = true,
			prompt_position = "top",
			width = 90,
			height = 15,
		},
	},
	previewer = false,
	border = true,
}

local grep_prompt = function()
	require("telescope.builtin").grep_string({
		path_display = true,
		search = vim.fn.input("Rg> "),
	})
end

local fuzzy_find_file = function()
	require("telescope.builtin").current_buffer_fuzzy_find({
		prompt_title = " Fuzzy Find Buffer",
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			prompt_position = "top",
		},
	})
end

local keys = {
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers (Telescope)" },
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files (Telescope)" },
	{
		"<leader>f/",
		function()
			fuzzy_find_file()
		end,
		desc = "Fuzy find buffer (Telescope)",
	},
	{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep (Telescope)" },
	{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Help Tags (Telescope)" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find Old files (Telescope)" },
	{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find Symbols (Telescope)" },
	{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find Keymaps (Telescope)" },
	{
		"<leader>fk",
		function() grep_prompt() end,
		desc = "Find Keymaps (Telescope)"
	},
	{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find Keymaps (Telescope)" },
	{ "<leader>fd", "<cmd>Telescope diagnostics bufrn=0<CR>", desc = "Find Document Diagnostics (Telescope)" },
	{ "<leader>fr", "<cmd>Telescope lsp_references<CR>", desc = "Find Document Diagnostics (Telescope)" },
}

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = keys,
	dependencies = {
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
				},
				selection_strategy = "reset",
				sorting_strategy = "descending",
				scroll_strategy = "cycle",
				border = {},
				prompt_prefix = " ",
				selection_caret = " ",
				initial_mode = "insert",
				use_less = false,
				set_env = { ["COLORTERM"] = "truecolor" },
				file_ignore_patterns = { "node_modules", ".git/" },
				color_devicons = true,
				winblend = 0,
				-- 'flex' | 'horizontal' | 'vertical' | 'bottom_pane'
				layout_strategy = "flex",
				layout_config = {
					prompt_position = "top",
					horizontal = {
						prompt_position = "bottom",
						preview_cutoff = 0.20,
						preview_width = 0.6,
						mirror = false,
					},
					vertical = {
						prompt_position = "bottom",
						preview_cutoff = 0.20,
						preview_height = 0.5,
						mirror = false,
					},
					center = {
						preview_cutoff = 0.20,
						width_padding = 0.05,
						height_padding = 1,
						preview_height = 0.8,
						mirror = true,
					},
				},
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-c>"] = require("telescope.actions").close,
						-- M is the Alt key
						["<M-p>"] = require("telescope.actions.layout").toggle_preview,
					},
					n = {
						["q"] = require("telescope.actions").close,
					},
				},
			},
			pickers = {
				find_files = vim.tbl_deep_extend("force", verticalConfig, {
					prompt_title = " Project files",
					layout_config = { vertical = { height = 15 } },
					hidden = true,
					find_command = {
						"rg",
						"--files",
						"--hidden",
					},
					file_ignore_patterns = {
						".git/",
						"node_modules/",
					},
				}),
				buffers = {
					theme = "dropdown",
					previewer = false,
					initial_mode = "insert",
				},
				oldfiles = verticalConfig,
				lsp_document_symbols = ivyConfig,
				lsp_references = ivyConfig,
			},
		})
	end,
}
