local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

-- ADAPTERS
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/dap/vscode-node-debug2/out/src/nodeDebug.js'}
}

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/dap/vscode-chrome-debug/out/src/chromeDebug.js"}
}

-- OPTIONS
vim.fn.sign_define('DapBreakpoint', {text='', texthl='LspDiagnosticsError', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='LspDiagnosticsInformation', linehl='', numhl=''})
dap.defaults.fallback.focus_terminal = true

-- DAP CONFIGURATIONS

-- NODE
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
		skipFiles = {
			'<node_internals>/**',
			'node_modules/**',
			'<node_internals>/**/*.js',
			'node_modules/**/*.js',
			'<eval>/**/*.js'
		},
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
		protocol = 'inspector',
		sourceMaps = true,
    -- processId = require'dap.utils'.pick_process,
		skipFiles = {
			'<node_internals>/**',
			'node_modules/**',
			'<node_internals>/**/*.js',
			'node_modules/**/*.js',
			'<eval>/**/*.js'
		},
		port = 9229,
		console = 'integratedTerminal'
  }
}

dap.configurations.typescript = {
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Launch Typescript Program (ts-node)',
    type = 'node2',
    request = 'launch',
		cwd = vim.loop.cwd(),
		protocol = 'inspector',
		sourceMaps = true,
		runtimeArgs = { "-r", "ts-node/register" },
		runtimeExecutable = "node",
		args = { "--inspect", "${file}" },
		skipFiles = {
			'<node_internals>/**',
			'node_modules/**',
			'<node_internals>/**/*.js',
			'node_modules/**/*.js',
			'<eval>/**/*.js'
		},
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
		protocol = 'inspector',
		sourceMaps = true,
		skipFiles = {
			'<node_internals>/**',
			'node_modules/**',
			'<node_internals>/**/*.js',
			'node_modules/**/*.js',
			'<eval>/**/*.js'
		},
		port = 9229,
		console = 'integratedTerminal'
  },
	{
		name = "Jest (Node2 with ts-node)",
		type = "node2",
		request = "launch",
		cwd = vim.loop.cwd(),
		runtimeArgs = {"--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest"},
		runtimeExecutable = "node",
		args = {"${file}", "--runInBand", "--coverage", "false"},
		sourceMaps = true,
		port = 9229,
		skipFiles = {
			'<node_internals>/**',
			'node_modules/**',
			'<node_internals>/**/*.js',
			'node_modules/**/*.js',
			'<eval>/**/*.js'
		},
	},
}

-- CHROME
dap.configurations.javascriptreact = { -- change this to javascript if needed
	{
		name = "Chrome Attach JavascriptReact",
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
		skipFiles = {
			"<node_internals>/**",
			"${workSpaceFolder}/node_modules/**",
			"<node_internals>/**/*.js",
			"${workSpaceFolder}/node_modules/**/*.js",
			"<eval>/**/*.js"
		}
	},
}

dap.configurations.typescriptreact = { -- change to typescript if needed
	{
		name = "Chrome Attach TypescriptReact",
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
		skipFiles = {
			"<node_internals>/**",
			"${workSpaceFolder}/node_modules/**",
			"<node_internals>/**/*.js",
			"${workSpaceFolder}/node_modules/**/*.js",
			"<eval>/**/*.js"
		}
	},
}

-- MAPPINGS

local M = {}

function M.reload_continue()
  package.loaded['dap/dap-config'] = nil
 	require('dap/dap-config')
  dap.continue()
end

-- reload and then continue
vim.keymap.set('n', '<Leader>dh',
    '<cmd>lua require"dap/dap-config".reload_continue()<CR>', {noremap = false, silent = true})

return M
