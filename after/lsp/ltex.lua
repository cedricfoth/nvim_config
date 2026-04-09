return {
	use_spellfile = false,
	filetypes = { "tex", "bib", "markdown", "gitcommit", "text" },
	settings = {
		ltex = {
			enabled = { "latex", "tex", "bib", "markdown" },
			language = "de-DE",
			checkFrequency = "save",
			additionalRules = {
				enablePickyRules = true,
			},
		},
	},
}
