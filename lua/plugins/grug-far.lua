return {
	"MagicDuck/grug-far.nvim",
	keys = {
		{
			"<leader>sg",
			function()
				require("grug-far").open({ transient = true })
			end,
			mode = { "n", "v", "x" },
			desc = "Open GrugFar",
		},
	},
	cmd = "GrugFar",
	config = function()
		require("grug-far").setup({
			keymaps = {
				replace = { n = "<localleader>r" },
				qflist = { n = "<localleader>q" },
				syncLocations = { n = "<localleader>s" },
				syncLine = { n = "<localleader>l" },
				close = { n = "<localleader>c" },
				historyOpen = { n = "<localleader>t" },
				historyAdd = { n = "<localleader>a" },
				refresh = { n = "<localleader>f" },
				openLocation = { n = "<localleader>o" },
				openNextLocation = { n = "<down>" },
				openPrevLocation = { n = "<up>" },
				gotoLocation = { n = "<enter>" },
				pickHistoryEntry = { n = "<enter>" },
				abort = { n = "<localleader>b" },
				help = { n = "g?" },
				toggleShowCommand = { n = "<localleader>p" },
				swapEngine = { n = "<localleader>e" },
				previewLocation = { n = "<localleader>i" },
				swapReplacementInterpreter = { n = "<localleader>x" },
				applyNext = { n = "<localleader>j" },
				applyPrev = { n = "<localleader>k" },
			},
		})
	end,
}
