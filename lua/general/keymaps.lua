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
vim.keymap.set("n", "<leader>tc", ":VimtexCompile<CR><CR>", { desc = "Compile Latex Document", silent = true })
vim.keymap.set(
  "n",
  "<leader>tz",
  ":!zathura --fork %:t:r.pdf<CR><CR>",
  { desc = "Open zathura for current document", silent = true }
)
vim.keymap.set("n", "<leader>tt", ":VimtexTocToggle<CR>", { desc = "Toggle TOC", silent = true })
vim.keymap.set("n", "<leader>ts", ":VimtexView<CR>", { desc = "Show in PDF", silent = true })


-- Obisidian commands
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<cr>", { desc = "Open current File in Obsidian", silent = true })
vim.keymap.set("n", "<leader>os", ":ObsidianFollowLink vsplit<cr>", { desc = "Open Link in vsplit", silent = true })
vim.keymap.set("n", "<leader>oh", ":ObsidianFollowLink hsplit<cr>", { desc = "Open Link in hsplit", silent = true })
vim.keymap.set("n", "<leader>ot", ":ObsidianTOC<cr>", { desc = "Open Link in hsplit", silent = true })



--Normal Mode
vim.keymap.set("n", "<leader>kj", ":nohl<cr>", { desc = "Clear Hightlights", silent = true })

--Insert Mode
vim.keymap.set("i", "kj", "<Esc>", {})
--Visual Mode
vim.keymap.set("v", "kj", "<Esc>", {})
