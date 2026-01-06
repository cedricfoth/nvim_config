return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {},
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = false, -- Hintergrund transparent
			float = {
				transparent = true, -- transparente Floating-Windows
				solid = false, -- kein solides Styling
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				neotree = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		})
		-- Colorscheme erst nach setup aktivieren
		vim.cmd.colorscheme("catppuccin")
		function LineNumberColors()
			vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#b4befe", bold = false })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#fab387", bold = true })
			vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#b4befe", bold = false })
		end
        LineNumberColors()
	end,
}
