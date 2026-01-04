return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"bibtex",
				"cmake",
				"cpp",
				"html",
				"yaml",
				"python",
				"lua",
				"json",
				"javascript",
				"tsx",
				"css",
				"bash",
				"latex",
				"vim",
				"matlab",
				"markdown",
				"markdown_inline",
				"gitignore",
				"json",
				"terraform",
				"toml",
			},
			highlight = { enable = true, disable = { "latex" } },
			indent = { enable = false },
		})
	end,
}
