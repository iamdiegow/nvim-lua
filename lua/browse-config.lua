local status_ok, browse = pcall(require, "browse")
if not status_ok then
	return
end

browse.setup {
	provider = "google",
}

local bookmarks = {
	"https://google.com",
	"https://udemy.com",
	"https://frontendmasters.com",
	"https://stackoverflow.com/",
	"https://you.com/code",
	"https://www.reddit.com/r/neovim/",
	"https://this-week-in-neovim.org/",
	"https://dev.to/",
	"https://docs.nestjs.com/",
	"https://github.com/kyazdani42/nvim-tree.lua",
	"https://github.com/hoob3rt/lualine.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/rockerBOO/awesome-neovim"
}

local function command(name, rhs, opts)
	opts = opts or {}
	vim.api.nvim_create_user_command(name, rhs, opts)
end

command("BrowseInputSearch", function()
	browse.input_search({
		provider = "google"
	})
end, {})

command("Browse", function()
	browse.browse { bookmarks = bookmarks }
end, {})

command("BrowseBookmarks", function()
	browse.open_bookmarks { bookmarks = bookmarks }
end, {})

command("BrowseDevdocsSearch", function()
	browse.devdocs.search()
end, {})

command("BrowseDevdocsFiletypeSearch", function()
	browse.devdocs.search_with_filetype()
end, {})

command("BrowseMdnSearch", function()
	browse.mdn.search()
end, {})
