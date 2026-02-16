return {
	"3rd/diagram.nvim",
	dependencies = {
		{ "3rd/image.nvim", opts = {} }, -- Wichtig für die Anzeige der generierten Bilder
	},
	opts = { -- Hier werden die Standard-Optionen übergeben
		renderer_options = {
			mermaid = {
				background = "transparent", -- oder "transparent"
				theme = "dark",
			},
			plantuml = {
				charset = "utf-8",
			},
		},
	},
	config = function(_, opts)
		require("diagram").setup(opts)
	end,
}
