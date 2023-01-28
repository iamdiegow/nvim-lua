return {
	"numToStr/Comment.nvim",
	keys = {
		{ "gcc" },
		{ "gbc" },
		{ "gc", mode = "v" },
		{ "gb", mode = "v" },
	},
	opts = {
		padding = true,
		sticky = true,
		ignore = nil,
		toggler = {
			line = "gcc",
			block = "gcb",
		},
		opleader = {
			line = "gc",
			block = "gb",
		},
		extra = {
			above = "gcO",
			below = "gco",
			eol = "gcA",
		},
		mappings = {
			---Operator-pending mapping
			---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
			---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
			basic = true,
			---Extra mapping
			---Includes `gco`, `gcO`, `gcA`
			extra = true,
			---Extended mapping
			---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
			extended = false,
		},
		pre_hook = function(ctx)
			-- Only calculate commentstring for tsx filetypes
			if vim.bo.filetype == "typescriptreact" then
				local U = require("Comment.utils")

				-- Determine whether to use linewise or blockwise commentstring
				local type = ctx.ctype == U.ctype.linewise and "__default" or "__multiline"

				-- Determine the location where to calculate commentstring from
				local location = nil
				if ctx.ctype == U.ctype.blockwise then
					location = require("ts_context_commentstring.utils").get_cursor_location()
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = require("ts_context_commentstring.utils").get_visual_start_location()
				end

				return require("ts_context_commentstring.internal").calculate_commentstring({
					key = type,
					location = location,
				})
			end
		end,
		post_hook = nil,
	},
}
