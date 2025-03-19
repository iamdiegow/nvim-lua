local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
vim.g.maplocalleader = ","

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
				"shada",
				"spellfile",
			},
		},
	},
})

require("keymappings")
require("settings")
require("autocommands")

vim.cmd("colorscheme tokyonight")
vim.g.lualine_theme = "tokyonight"
