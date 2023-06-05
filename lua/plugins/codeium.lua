return {
	"Exafunction/codeium.vim",
	event = "InsertEnter",
	config = function()
		vim.g.codeium_enabled = true
		vim.g.codeium_manual = true

		vim.keymap.set("i", "<A-i>", function()
			return vim.fn["codeium#Complete"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<A-CR>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<M-]>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<M-[>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<A-BS>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })
	end,
}
