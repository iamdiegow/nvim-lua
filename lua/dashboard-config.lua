vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_header = {
    "",
}
vim.g.dashboard_custom_section = {
    a = {description = {"  Find File                 SPC f f"}, command = "Telescope find_files"},
    b = {description = {"  Recents                   SPC f o"}, command = "Telescope oldfiles"},
}
vim.g.dashboard_custom_footer = {
	"Nvim loaded in " .. vim.fn.printf("%.3f", vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))) .. " seconds.",
}
