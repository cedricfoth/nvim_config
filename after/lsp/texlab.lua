return {

	filetypes = { "tex", "latex" },
	cmd = { "texlab", "-vvvv", "--log-file", "/tmp/texlab.log" },
	capabilities = capabilities,
	flags = {
		allow_incremental_sync = false,
	},
	log_level = vim.lsp.protocol.MessageType.Log,
	message_level = vim.lsp.protocol.MessageType.Log,
	settings = {
		texlab = {
			-- auxDirectory = "build",
			diagnosticsDelay = 50,
			-- build = {
			-- 	executable = "latexmk",
			-- 	onSave = true,
			-- 	args = {
			-- 		"-pdf",
			-- 		"-pdflua",
			-- 		"-quiet",
			-- 		"-interaction=nonstopmode",
			-- 		"-synctex=1",
			-- 		"-shell-escape",
			-- 		"-f",
			-- 		"-outdir=build",
			-- 		"%f",
			-- 	},
			-- },
			-- forwardSearch = {
			-- 	args = { "--synctex-forward", "%l:1:%f", "%p" },
			-- 	executable = "zathura",
			-- },
			chktex = { onOpenAndSave = true, onEdit = false },
			formatterLineLength = 120,
		},
	},
}
