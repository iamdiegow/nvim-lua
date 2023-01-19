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
		notify = false
	}
})

-- Global variables
vim.g.transparent_window = false
vim.g.format_on_save = false
vim.g.autocomplete = false
vim.g.rainbow = true
vim.g.current_context = false
vim.g.diagnostics_hover_window = false

-- Core
require("keymappings")
require("settings")
require("autocommands")

-- Plugin config
require("lualine-config")
require("bufferline-config")
require("treesitter-config")
require("telescope-config")
require("indent-blankline-config")
require("nvim-autopairs-config")
require("nvim-ts-autotag-config")
require("nvim-toggleterm-config")
require("gitsigns-config")
require("which-key-config")
require("trouble-config")
require("nvim-web-devicons-config")
require("zen-mode-config")
require("stabilize-config")
require("nvim-colorizer-config")
require("browse-config")
require("diffview-config")
require("neogit-config")
require("neotest-config")
require("autosession-config")

-- LSP
require("dap-config")
require("nvim-cmp-config")
require("lsp")

vim.cmd([[ colorscheme tokyonight ]])
