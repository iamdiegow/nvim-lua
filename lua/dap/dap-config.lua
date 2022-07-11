local dap = require('dap')

dap.defaults.fallback.focus_terminal = true

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.config/nvim/vscode-node-debug2/out/src/nodeDebug.js'},
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
		protocol = 'inspector',
		sourceMaps = true,
		skipFiles = {'<node_internals>/**/*.js', '${workspaceFolder}/node_modules/**'},
    -- processId = require'dap.utils'.pick_process,
		port = 9229,
		console = 'integratedTerminal'
  }
}

dap.configurations.typescript = {
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
		protocol = 'inspector',
		sourceMaps = true,
		skipFiles = {'<node_internals>/**/*.js', '${workspaceFolder}/node_modules/**'},
    -- processId = require'dap.utils'.pick_process,
		port = 9229,
		console = 'integratedTerminal'
  }
}

vim.fn.sign_define('DapBreakpoint', {text='', texthl='LspDiagnosticsError', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='LspDiagnosticsInformation', linehl='', numhl=''})

vim.keymap.set('n', '<leader>db', function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dB', function() require"dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>dl', function() require"dap".step_out() end)
vim.keymap.set('n', "<leader>dk", function() require"dap".step_into() end)
vim.keymap.set('n', '<leader>dj', function() require"dap".step_over() end)
vim.keymap.set('n', '<leader>dc', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>dt', function() require"dap".terminate() end)
vim.keymap.set('n', '<leader>di', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>d?', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end)
vim.keymap.set('n', '<leader>dK', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>dJ', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>dr', function() require"dap".repl.open() end)

local M = {}

function M.reload_continue()
  package.loaded['dap/dap-config'] = nil
 	require('dap/dap-config')
  dap.continue()
end

local opts = { noremap=false, silent=true }
-- reload and then continue
vim.keymap.set('n', '<Leader>dh',
    '<cmd>lua require"dap/dap-config".reload_continue()<CR>', opts)

return M
