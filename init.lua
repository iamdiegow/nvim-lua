local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
	defaults = {
		lazy = true,
	},
	install = { colorscheme = { "tokyonight" } },
	checker = {
		enabled = true,
		notify = false,
	},
	diff = {
		cmd = "terminal_git",
	},
	ui = {
		border = "single",
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

vim.keymap.set("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Open Lazy", silent = true, noremap = true })

require("keymappings")
require("settings")
require("autocommands")

vim.cmd([[ colorscheme onedark ]])
