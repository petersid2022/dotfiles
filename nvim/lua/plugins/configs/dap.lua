local dap = require('dap')
local dapui = require('dapui')

vim.keymap.set("n", "<leader>dtb", dap.toggle_breakpoint, { noremap = true, desc = "Dap: Toggle breakpoint" })
vim.keymap.set("n", "<leader>dce", dap.continue, { noremap = true, desc = "Dap: Continue execution" })
vim.keymap.set("n", "<leader>dsi", dap.step_into, { noremap = true, desc = "Dap: Step into" })
vim.keymap.set("n", "<leader>dso", dap.step_over, { noremap = true, desc = "Dap: Step over" })
vim.keymap.set("n", "<leader>dsu", dap.step_out, { noremap = true, desc = "Dap: Step out" })
vim.keymap.set("n", "<leader>dui", dapui.toggle, { noremap = true, desc = "DapUI: Toggle window" })

dap.adapters.codelldb = {
	type = 'server',
	port = "${port}",
	executable = {
		command = '/home/petrside/.local/share/nvim/mason/bin/codelldb',
		args = { "--port", "${port}" },
	}
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.delve = {
	type = 'server',
	port = '${port}',
	executable = {
		command = 'dlv',
		args = { 'dap', '-l', '127.0.0.1:${port}' },
	}
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}"
	},
	{
		type = "delve",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}"
	},
	-- works with go.mod packages and sub packages
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}"
	}
}
