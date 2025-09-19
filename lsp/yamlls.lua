local opts = {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/docker/cli/master/cli/compose/schema/data/config_schema_v3.13.json"] = "docker-compose.yml",
			},
		},
	},
}

return opts
