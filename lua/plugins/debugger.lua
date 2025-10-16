return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- UI Setup
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Python Debugger (debugpy)
			dap.adapters.python = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
				args = { "-m", "debugpy.adapter" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					pythonPath = function()
						return "python3"
					end,
				},
			}

			-- C++ Debugger (codelldb oder lldb-vscode)
			dap.adapters.lldb = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb", -- mason installiert codelldb
				name = "lldb",
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}
			-- C und Rust nutzen dieselbe Config wie C++
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			-- Swift Debugger
			dap.adapters.swift = dap.adapters.lldb
			dap.configurations.swift = {
				{
					name = "Debug Swift executable",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to Swift executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}

			-- Keymaps (Leader + d + key)
			local map = function(lhs, rhs, desc)
				vim.keymap.set("n", "<leader>d" .. lhs, rhs, { desc = "DAP " .. desc })
			end

			map("c", dap.continue, "Continue")
			map("o", dap.step_over, "Step Over")
			map("i", dap.step_into, "Step Into")
			map("u", dap.step_out, "Step Out")
			map("b", dap.toggle_breakpoint, "Toggle Breakpoint")
			map("B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, "Conditional Breakpoint")
			map("r", dap.repl.open, "Open REPL")
			map("l", dap.run_last, "Run Last")
			map("t", dap.terminate, "Terminate")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "williamboman/mason.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "python", "codelldb" }, -- Swift nutzt denselben Adapter wie C++
				automatic_installation = true,
			})
		end,
	},
}
