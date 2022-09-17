local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-vim-test")({
			allow_file_types = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		}),
	},
	diagnostic = {
		enabled = false,
	},
	icons = {
		child_indent = "│",
		child_prefix = "├",
		collapsed = "─",
		expanded = "╮",
		failed = "✖",
		final_child_indent = " ",
		final_child_prefix = "╰",
		non_collapsible = "─",
		passed = "✔",
		running = "🗘",
		running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
		skipped = "ﰸ",
		unknown = "?",
	},
	status = {
		enabled = true,
		signs = true,
		virtual_text = false,
	},
	summary = {
		animated = false,
		enabled = true,
		expand_errors = true,
		follow = true,
		mappings = {
			attach = "a",
			clear_marked = "M",
			clear_target = "T",
			expand = { "<CR>", "<2-LeftMouse>" },
			expand_all = "e",
			jumpto = "i",
			mark = "m",
			next_failed = "J",
			output = "o",
			prev_failed = "K",
			run = "r",
			run_marked = "R",
			short = "O",
			stop = "u",
			target = "t",
		},
	},
})
