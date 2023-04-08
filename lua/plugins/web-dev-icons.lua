local colors = {
	white = "#abb2bf",
	red = "#d47d85",
	baby_pink = "#DE8C92",
	pink = "#ff75a0",
	vibrant_green = "#7eca9c",
	blue = "#61afef",
	yellow = "#e7c787",
	sun = "#EBCB8B",
	dark_purple = "#c882e7",
	teal = "#519ABA",
	orange = "#fca2aa",
	cyan = "#a3b8ef",
}

return {
	"kyazdani42/nvim-web-devicons",
	lazy = false,
	config = function()
		local set_icon = require("nvim-web-devicons").set_icon
		local icons = {
			html = {
				icon = "",
				color = colors.baby_pink,
				name = "html",
			},
			css = {
				icon = "",
				color = colors.blue,
				name = "css",
			},
			js = {
				icon = "",
				color = colors.sun,
				name = "js",
			},
			ts = {
				icon = "ﯤ",
				color = colors.teal,
				name = "ts",
			},
			png = {
				icon = "",
				color = colors.dark_purple,
				name = "png",
			},
			jpg = {
				icon = "",
				color = colors.dark_purple,
				name = "jpg",
			},
			jpeg = {
				icon = "",
				color = colors.dark_purple,
				name = "jpeg",
			},
			mp3 = {
				icon = "",
				color = colors.white,
				name = "mp3",
			},
			mp4 = {
				icon = "",
				color = colors.white,
				name = "mp4",
			},
			out = {
				icon = "",
				color = colors.white,
				name = "out",
			},
			Dockerfile = {
				icon = "",
				color = colors.cyan,
				name = "Dockerfile",
			},
			rb = {
				icon = "",
				color = colors.pink,
				name = "rb",
			},
			vue = {
				icon = "﵂",
				color = colors.vibrant_green,
				name = "vue",
			},
			py = {
				icon = "",
				color = colors.cyan,
				name = "py",
			},
			toml = {
				icon = "",
				color = colors.blue,
				name = "toml",
			},
			lock = {
				icon = "",
				color = colors.red,
				name = "lock",
			},
			zip = {
				icon = "",
				color = colors.sun,
				name = "zip",
			},
			xz = {
				icon = "",
				color = colors.sun,
				name = "xz",
			},
			lua = {
				icon = "",
				color = colors.blue,
				name = "lua",
			},
			sh = {
				icon = "",
				color = "#1DC123",
				cterm_color = "59",
				name = "Sh",
			},
			[".gitattributes"] = {
				icon = "",
				color = "#e24329",
				cterm_color = "59",
				name = "GitAttributes",
			},
			[".gitconfig"] = {
				icon = "",
				color = "#e24329",
				cterm_color = "59",
				name = "GitConfig",
			},
			[".gitignore"] = {
				icon = "",
				color = "#e24329",
				cterm_color = "59",
				name = "GitIgnore",
			},
		}

		for key, value in pairs(icons) do
			set_icon({
				[key] = value,
			})
		end
	end,
}
