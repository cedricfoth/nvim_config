--NVIM Keymaps

--Normal Mode
-- -- Navigation
--vim.keymap.set('n','<c-h>',':wincmd h<CR>',{}) --Move Left
--vim.keymap.set('n','<c-l>',':wincmd l<CR>',{}) -- Move Right
--vim.keymap.set('n','<c-j>',':wincmd j<CR>',{}) --Move Down
--vim.keymap.set('n','<c-k>',':wincmd k<CR>',{}) -- Move Up

-- -- Split
vim.keymap.set('n','<Leader>sh','<C-w>s',{}) -- Split Horizontal
vim.keymap.set('n','<Leader>sv','<C-w>v',{}) -- Split Vertical
vim.keymap.set('n','<Leader>sx','<C-w>q',{}) -- Quit Split

-- -- Vimtext
vim.keymap.set("n", "<leader>qc", ":VimtexCompile<CR><CR>")
vim.keymap.set("n", "<leader>qs", ":!zathura --fork %:t:r.pdf<CR><CR>")
vim.keymap.set("n","<leader>tt", ":VimtexTocToggle<CR>")


--Insert Mode
vim.keymap.set('i','kj','<Esc>',{})
--Visual Mode
vim.keymap.set('v','kj','<Esc>',{})
