return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			ansible = { "ansible-lint" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			json = { "jsonlint" },
			lua = { "luacheck" },
			markdown = { "markdownlint" },
			python = { "ruff" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			yaml = { "yamllint" },
			terraform = { "tflint" },
			cpp = { "cpplint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Run linter" })
	end,
}
