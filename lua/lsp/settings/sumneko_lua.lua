return {
	settings = {
		Lua = {
			format = {
				enable = true
			},
			diagnostics = {
				globals = { "vim" },
			},
			completion = {
				callSnippet = "Replace"
			},
      hint = {
        enable = true,
        arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
        await = true,
        paramName = "Disable", -- "All", "Literal", "Disable"
        paramType = false,
        semicolon = "Disable", -- "All", "SameLine", "Disable"
        setType = true,
      },
      runtime = {
        version = "LuaJIT",
        special = {
          reload = "require",
        },
      },
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
      telemetry = {
        enable = false,
      }
		},
	},
}
