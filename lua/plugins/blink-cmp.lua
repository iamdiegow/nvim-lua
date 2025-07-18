local default_window = {
	border = "single",
	scrollbar = true,
}

return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "super-tab",
			["<C-j>"] = { "select_next", "fallback_to_mappings" },
			["<C-k>"] = { "select_prev", "fallback_to_mappings" },
			["<CR>"] = { "select_and_accept", "fallback" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			trigger = {
				show_on_keyword = true,
				show_on_trigger_character = false,
				show_on_insert_on_trigger_character = false,
				show_on_accept_on_trigger_character = false,
				show_on_x_blocked_trigger_characters = {
					"'",
					'"',
					"(",
					"{",
					"[",
				},
				show_on_blocked_trigger_characters = { " ", "\n", "\t", "{" },
			},
			menu = {
				auto_show = true,
			},
			ghost_text = {
				enabled = false,
				show_with_menu = false,
			},
			documentation = {
				auto_show = true,
				treesitter_highlighting = true,
				window = default_window,
			},
		},
		signature = {
			enabled = false,
			window = default_window,
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		cmdline = {
			enabled = true,
			keymap = {
				preset = "cmdline",
				["<C-j>"] = { "select_next", "fallback_to_mappings" },
				["<C-k>"] = { "select_prev", "fallback_to_mappings" },
				["<CR>"] = { "select_and_accept", "fallback" },
			},
		},
	},
	opts_extend = { "sources.default" },
}
