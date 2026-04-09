vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("autocmd FileType markdown set conceallevel=2")
vim.g.mapleader = " "
vim.g.mpalocalleader = " "
--Vimtex
vim.cmd("let g:vimtex_view_method = 'zathura'")
vim.cmd("let g:vimtex_compiler_method = 'latexrun'")

vim.opt.fillchars:append({
	eob = " ", -- Entfernt die Tilden
	vert = "▕", -- Macht die vertikale Trennlinie dezenter
	fold = " ", -- Entfernt Zeichen in Fold-Linien
})
-- Spell
-- vim.cmd("setglobal spell spelllang=en_us,de_de")
-- Python
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
