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
				gitsigns = true,
				neotree = true,
				telescope = true,
				treesitter = true,
				which_key = true,
                notify = true,
                snacks = true,
			},
		})
		-- Colorscheme erst nach setup aktivieren
		vim.cmd.colorscheme("catppuccin")

		function LineNumberColors()
			local palette = require("catppuccin.palettes").get_palette()
			vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#b4befe", bold = false })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#fab387", bold = true })
			vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#b4befe", bold = false })
			vim.api.nvim_set_hl(0, "Pmenu", { bg = none })

			vim.api.nvim_set_hl(0, "BlinkCmpMenu", {
				bg = palette.base,
				fg = palette.text,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {
				bg = palette.surface0,
				fg = palette.text,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", {
				fg = palette.blue,
				bg = palette.base,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpDoc", {
				bg = palette.base,
				fg = palette.text,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", {
				fg = palette.blue,
				bg = palette.base,
			})
		end
		LineNumberColors()
	end,
}
