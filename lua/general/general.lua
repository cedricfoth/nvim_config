vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("autocmd FileType markdown set conceallevel=2")
vim.g.mapleader = " "
vim.g.mpalocalleader = " "
-- Search
vim.cmd("set ignorecase")
--Vimtex
vim.cmd("let g:vimtex_view_method = 'zathura'")
vim.cmd("let g:vimtex_compiler_method = 'latexrun'")
--Spell
vim.cmd("setglobal spell spelllang=de")
