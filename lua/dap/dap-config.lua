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
