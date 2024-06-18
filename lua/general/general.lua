vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set clipboard=unnamedplus")
vim.g.mapleader = " "
vim.g.mpalocalleader = " "

--Vimtex
vim.cmd("let g:vimtex_view_method = 'zathura'")
vim.cmd("let g:vimtex_compiler_method = 'latexrun'")
