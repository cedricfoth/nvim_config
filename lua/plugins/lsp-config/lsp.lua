return {
	-- Installation of Mason and Lspsaga
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- {
	-- 	"nvimdev/lspsaga.nvim",
	-- 	config = function()
	-- 		require("lspsaga").setup({
	-- 		})
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- },
	-- Ensure lsp servers are installed
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"yamlls",
					"pyright",
					"cmake",
					"ltex",
					"texlab",
					"matlab_ls",
					"jsonls",
					"html",
					"cssls",
					"eslint",
				},
				-- automatic_enable = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local config = {
				virtual_lines = false,
				virtual_text = false,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "true",
					header = "",
					prefix = "",
				},
			}

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.diagnostic.config(config)
			if vim.g.border_enabled then
				require("lspconfig.ui.windows").default_options.border = "rounded"

				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					border = "rounded",
				})
				vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
					border = "rounded",
				})
			end

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("yamlls", {
				capabilities = capabilities,
			})
			vim.lsp.config("ccls", {
				capabilities = capabilities,

				init_options = {
					cache = {
						directory = ".ccls-cache",
					},
					compilationDatabaseDirectory = ".",
				},
				root_markers = { "compile_commands.json", ".ccls", ".git" },
			})
			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})
			vim.lsp.config("cmake", {
				capabilities = capabilities,
			})
			vim.lsp.config("jsonls", {
				capabilities = capabilities,
			})

			vim.lsp.config("texlab", {
				filetypes = { "tex", "latex" },
				cmd = { "texlab", "-vvvv", "--log-file", "/tmp/texlab.log" },
				capabilities = capabilities,
				flags = {
					allow_incremental_sync = false,
				},
				log_level = vim.lsp.protocol.MessageType.Log,
				message_level = vim.lsp.protocol.MessageType.Log,
				settings = {
					texlab = {
						-- auxDirectory = "build",
						diagnosticsDelay = 50,
						-- build = {
						-- 	executable = "latexmk",
						-- 	onSave = true,
						-- 	args = {
						-- 		"-pdf",
						-- 		"-pdflua",
						-- 		"-quiet",
						-- 		"-interaction=nonstopmode",
						-- 		"-synctex=1",
						-- 		"-shell-escape",
						-- 		"-f",
						-- 		"-outdir=build",
						-- 		"%f",
						-- 	},
						-- },
						-- forwardSearch = {
						-- 	args = { "--synctex-forward", "%l:1:%f", "%p" },
						-- 	executable = "zathura",
						-- },
						chktex = { onOpenAndSave = true, onEdit = false },
						formatterLineLength = 120,
					},
				},
			})
			vim.lsp.config("ltex", {
				on_attach = on_attach,
				capabilities = capabilities,
				use_spellfile = false,
				filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
				settings = {
					ltex = {
						enabled = { "latex", "tex", "bib", "markdown" },
						language = "de-DE",
						checkFrequency = "save",
					},
				},
			})
			vim.lsp.config("matlab_ls", {
				filetypes = { "matlab","ocatave" },
				settings = {
					MATLAB = {
						indexWorkspace = true,
						installPath = "/Applications/MATLAB_R2025b.app",
						matlabConnectionTiming = "onStart",
						telemetry = false,
					},
				},
			})

			vim.lsp.config("sourcekit", {
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			})
		end,
	},
}
