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
				transparent = false, -- transparente Floating-Windows
				solid = false,      -- kein solides Styling
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = false,
				telescope = false,
				treesitter = true,
				which_key = false,
			},
		})
		-- Colorscheme erst nach setup aktivieren
		vim.cmd.colorscheme("catppuccin")
	end,
}
