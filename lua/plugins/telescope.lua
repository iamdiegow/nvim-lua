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

local fuzzy_find_file = function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		prompt_title = " Fuzzy Find Buffer",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
			height = 15,
		},
		previewer = false,
		winblen = 0,
		border = true,
	}))
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
	{ "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "Search String (Telescope)" },
	{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Help Tags (Telescope)" },
	{
		"<leader>fo",
		function()
			require("telescope.builtin").oldfiles({ cwd = vim.fn.getcwd() })
		end,
		desc = "Find Old files in CWD (Telescope)",
	},
	{ "<leader>fO", "<cmd>Telescope oldfiles<CR>", desc = "Find All Old Files (Telescope)" },
	{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find Symbols (Telescope)" },
	{ "<leader>fS", "<cmd>Telescope git_status<CR>", desc = "Git Status (Telescope)" },
	{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find Keymaps (Telescope)" },
	{ "<leader>fl", "<cmd>Telescope lsp_references<CR>", desc = "Find Lsp References (Telescope)" },
	{ "<leader>fd", "<cmd>Telescope lsp_definitions<CR>", desc = "Find Outgoing Calls (Telescope)" },
	{ "<leader>fi", "<cmd>Telescope lsp_implementations<CR>", desc = "Find Implementations (Telescope)" },
	{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find Keymaps (Telescope)" },
	{ "<leader>ft", "<cmd>Telescope diagnostics bufrn=0<CR>", desc = "Find Document Diagnostics (Telescope)" },
	{ "<leader>fr", "<cmd>Telescope lsp_references<CR>", desc = "Find Document Diagnostics (Telescope)" },
}

return {
	"nvim-telescope/telescope.nvim",
	keys = keys,
	cmd = "Telescope",
	dependencies = {
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "folke/trouble.nvim" },
		{ "tomasky/bookmarks.nvim" },
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
						["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-c>"] = require("telescope.actions").close,
						["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
						-- M is the Alt key
						["<M-p>"] = require("telescope.actions.layout").toggle_preview,
					},
					n = {
						["q"] = require("telescope.actions").close,
						["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
						["<M-p>"] = require("telescope.actions.layout").toggle_preview,
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
					only_cwd = true,
					sort_lastused = false,
					ignore_current_buffer = false,
					bufnr_width = 0,
				},
				oldfiles = verticalConfig,
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				bookmarks = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("bookmarks")
	end,
}
