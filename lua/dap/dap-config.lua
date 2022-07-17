local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

local dap_ui_status_ok, dapVirtualText = pcall(require, "nvim-dap-virtual-text")
if not dap_ui_status_ok then
  return
end

-- DAP UI
dapui.setup {
	icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
				{ id = "breakpoints", size = 0.25}
      },
      size = 30,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.15, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
}

-- Enable virtual text
vim.g.dap_virtual_text = true

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- OPTIONS
vim.fn.sign_define('DapBreakpoint', {text='', texthl='LspDiagnosticsError', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='LspDiagnosticsInformation', linehl='', numhl=''})
dap.defaults.fallback.focus_terminal = true

-- ADAPTERS
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.config/nvim/vscode-node-debug2/out/src/nodeDebug.js'},
}

-- DAP CONFIGURATIONS
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
		skipFiles = {'<node_internals>/**', 'node_modules/**'},
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
		protocol = 'inspector',
		sourceMaps = true,
		skipFiles = {'<node_internals>/**', 'node_modules/**'},
    -- processId = require'dap.utils'.pick_process,
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
		skipFiles = {'<node_internals>/**', 'node_modules/**'},
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
		protocol = 'inspector',
		sourceMaps = true,
		skipFiles = {'<node_internals>/**', 'node_modules/**'},
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
		skipFiles = { "<node_internals>/**", "node_modules/**" },
	},
}

-- Virtual Text
dapVirtualText.setup({
	enabled = true,
	enabled_commands = true, -- creates DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle
	highlight_changed_variables = true,
	highlight_new_as_changed = false,
	show_stop_reason = true,
	commented = true,
	only_first_definition = true,
	all_references = false,
	filter_references_pattern = '<module',
	virt_text_pos = 'eol',
	all_frames = false,
	virt_lines = false,
	virt_text_win_col = nil
})

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
