return {
	"kevinhwang91/nvim-ufo",
	event = "LspAttach",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		require("ufo").setup({
			open_fold_hl_timeout = 0,
			---@diagnostic disable-next-line: unused-local
			provider_selector = function(_bufnr, filetype, _buftype)
				print(filetype)
				if filetype == "NeogitStatus" then
					return ""
				end

				return { "treesitter", "indent" }
			end,
		})
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
		vim.keymap.set("n", "zK", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end)
	end,
}
