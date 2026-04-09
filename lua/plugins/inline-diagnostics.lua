return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern",
			transparent_bg = false,
			transparent_cursorline = false,
			hi = {
				error = "DiagnosticError", -- Highlight for error diagnostics
				warn = "DiagnosticWarn", -- Highlight for warning diagnostics
				info = "DiagnosticInfo", -- Highlight for info diagnostics
				hint = "DiagnosticHint", -- Highlight for hint diagnostics
				arrow = "NonText", -- Highlight for the arrow pointing to diagnostic
				background = "None", -- Background highlight for diagnostics
				mixing_color = "None", -- Color to blend background with (or "None")
			},
			options = {
				show_source = {
					enabled = true, -- Enable showing source names
					if_many = false, -- Only show source if multiple sources exist for the same diagnostic
				},
				use_icons_from_diagnostic = true,
				multilines = {
					enabled = true,
				},
			},
		})
	end,
}
