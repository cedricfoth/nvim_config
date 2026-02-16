return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "modern",
			transparent_bg = true,
			transparent_cursorline = false,
			options = {
				show_source = {
					enabled = false, -- Enable showing source names
					if_many = false, -- Only show source if multiple sources exist for the same diagnostic
				},
				use_icons_from_diagnostic = true,
			},
		})
	end,
}
