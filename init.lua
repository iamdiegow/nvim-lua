local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
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
	},
	diff = {
		cmd = "terminal_git"
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

-- Global variables
vim.g.transparent_window = false
vim.g.format_on_save = false
vim.g.diagnostics_hover_window = false

-- Core
require("keymappings")
require("settings")
require("autocommands")

vim.cmd([[ colorscheme tokyonight ]])
