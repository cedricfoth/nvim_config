--NVIM Keymaps

--Normal Mode
-- -- Navigation
--vim.keymap.set('n','<c-h>',':wincmd h<CR>',{}) --Move Left
--vim.keymap.set('n','<c-l>',':wincmd l<CR>',{}) -- Move Right
--vim.keymap.set('n','<c-j>',':wincmd j<CR>',{}) --Move Down
--vim.keymap.set('n','<c-k>',':wincmd k<CR>',{}) -- Move Up

-- -- Split
vim.keymap.set("n", "<Leader>sh", "<C-w>s", { desc = "Horizontal Split" }) -- Split Horizontal
vim.keymap.set("n", "<Leader>sv", "<C-w>v", { desc = "Vertical Split" })   -- Split Vertical
vim.keymap.set("n", "<Leader>sx", "<C-w>q", { desc = "Quit Split" })       -- Quit Split

-- -- Vimtext
vim.keymap.set("n", "<leader>qc", ":VimtexCompile<CR><CR>", { desc = "Compile Latex Document", silent = true })
vim.keymap.set(
  "n",
  "<leader>qs",
  ":!zathura --fork %:t:r.pdf<CR><CR>",
  { desc = "Open zathura for current document", silent = true }
)
vim.keymap.set("n", "<leader>tt", ":VimtexTocToggle<CR>", { desc = "Toggle TOC", silent = true })

--Normal Mode
vim.keymap.set("n", "<leader>kj", ":nohl<cr>", { desc = "Clear Hightlights", silent = true })

--Insert Mode
vim.keymap.set("i", "kj", "<Esc>", {})
--Visual Mode
vim.keymap.set("v", "kj", "<Esc>", {})
