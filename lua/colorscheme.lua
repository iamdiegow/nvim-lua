vim.cmd([[colo material]])

-- Material Config
-- variants = 'darker' | 'lighter' | 'oceanic' | 'palenight' | 'deep ocean'
-- lualine -> theme = 'material-nvim'
vim.g.material_style = 'oceanic'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = true
vim.g.material_disable_background = true

require('material').set()

