return {
	"smoka7/hop.nvim",
	keys = {
		{
			"f",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = false,
				})
			end,
			desc = "Hop f",
		},
		{
			"F",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = false,
				})
			end,
			desc = "Hop F",
		},
		{
			"t",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = false,
					hint_offset = -1,
				})
			end,
			desc = "Hop t",
		},
		{
			"T",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = false,
					hint_offset = -1,
				})
			end,
			desc = "Hop T",
		},
		{
			"<C-p>",
			function()
				require("hop").hint_lines({
					uppercase_labels = true,
				})
			end,
			desc = "Hop Hint Lines",
		},
	},
	config = function()
		require("hop").setup()
	end,
}
