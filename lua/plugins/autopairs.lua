return {
	{
		"windwp/nvim-autopairs",
		config = function()
			local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
			if not status_ok then
				return
			end

			nvim_autopairs.setup({
				check_ts = true,
				disable_filetype = { "TelescopePrompt", "vim" },
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					java = false,
				},
				map_char = {
					all = "(",
					tex = "{",
				},
				ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
				enable_bracket_in_quote = false
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
				return
			end
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({ enable = true })
		end,
	},
}
