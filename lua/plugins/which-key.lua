return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,

	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>b", group = "Buffer" },
			{ "<leader>j", group = " Jupyter" },
			{ "<leader>l", group = " LSP" },
			{ "<leader>f", group = "Finder" },
			{ "<leader>w", group = "Window" },
			{ "<leader>e", group = "Filebrowser" },
			{ "<leader>r", group = "Refactor" },
			{ "<leader>g", group = "Git" },
			{ "<leader>o", group = " Obsidian" },
			{ "<leader>q", group = " Quickfixlist" },
			{ "<leader>T", group = "󰓩 Tabs" },
			{ "<leader>v", group = " VimTeX" },
		})
	end,
}
