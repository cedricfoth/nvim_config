return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				markdown = { "prettier" },
				yaml = { "prettier" },
				toml = { "taplo" },
				terraform = { "terraform" },
				cpp = { "clang_format" },
				latex = { "latexindent" },
				bibtex = { "latexindent" },
			},
		})

		vim.keymap.set("n", "<leader>lf", function()
			conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
		end, { desc = "Format file" })
	end,
}
