local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- General Settings
require("general/general")
--Keyboard Mappings
require("general/keymaps")
require("lsp")

-- Plugin Management
require("lazy").setup({{import ="plugins"},{import="plugins.lsp-config"}})


