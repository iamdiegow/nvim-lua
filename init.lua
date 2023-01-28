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
})

-- Global variables
vim.g.transparent_window = false
vim.g.format_on_save = false
vim.g.diagnostics_hover_window = false

-- Core
require("keymappings")
require("settings")
require("autocommands")
-- LSP
require("dap-config")
require("lsp")

vim.cmd([[ colorscheme tokyonight ]])
