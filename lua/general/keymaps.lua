--NVIM Keymaps

--Normal Mode
-- -- Navigation
--vim.keymap.set('n','<c-h>',':wincmd h<CR>',{}) --Move Left
--vim.keymap.set('n','<c-l>',':wincmd l<CR>',{}) -- Move Right
--vim.keymap.set('n','<c-j>',':wincmd j<CR>',{}) --Move Down
--vim.keymap.set('n','<c-k>',':wincmd k<CR>',{}) -- Move Up


vim.keymap.set("n", "ä", "]", {remap = true}) -- Split Horizontal
vim.keymap.set("n", "ö", "[", {remap = true})   -- Split Vertical
vim.keymap.set("n", "ü", "'", {remap = true})   -- Split Vertical

-- -- Split
vim.keymap.set("n", "<Leader>sh", "<C-w>s", { desc = "Horizontal Split" }) -- Split Horizontal
vim.keymap.set("n", "<Leader>sv", "<C-w>v", { desc = "Vertical Split" })   -- Split Vertical
vim.keymap.set("n", "<Leader>sx", "<C-w>q", { desc = "Quit Split" })       -- Quit Split
vim.keymap.set("n", "<Leader>se", "<C-w>=", { desc = "Equal Size" })       -- Equal Size
vim.keymap.set("n", "<Leader>sm", "<C-w>T", { desc = "Open in Tab" })       -- Open in Tab


-- -- Tabs
vim.keymap.set("n", "<Leader>tn", ":tabnew<CR>", { desc = "New Tab",silent = true }) -- New Tab
vim.keymap.set("n", "<Leader>qt", ":tabc<CR>", { desc = "Close Tab", silent = true }) -- Close Tab


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
vim.keymap.set("n", "<leader>og", ":ObsidianFollowLink<cr>", { desc = "Follow Link", silent = true })
vim.keymap.set("n", "<leader>ot", ":ObsidianTOC<cr>", { desc = "Open TOC", silent = true })


-- Diffview
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<cr>", { desc = "Open Diffview", silent = true })
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<cr>", { desc = "Close Diffview", silent = true })

-- Copilot
vim.keymap.set("i","<C-l>","<Plug>(copilot-accept-word)",{silent = true})



-- Floating Terminal
vim.keymap.set("n", "<leader>Ft", ":FloatermNew<cr>", { desc = "New Terminal", silent = true })
vim.keymap.set("n", "<F4>", ":FloatermToggle<cr>", { desc = "Toggle Terminal", silent = true })
vim.keymap.set("n", "<F5>", ":FloattermKill<cr>", { desc = "Next Terminal", silent = true })

--Normal Mode
vim.keymap.set("n", "<leader>kj", ":nohl<cr>", { desc = "Clear Hightlights", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Clear Hightlights", silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Clear Hightlights", silent = true })
vim.keymap.set("n", "<C-s>", ":s/<C-r><C-w>/", { desc = "Replace word under Cursor"})

--Insert Mode
vim.keymap.set("i", "kj", "<Esc>", {})
--Visual Mode
vim.keymap.set("v", "kj", "<Esc>", {})
vim.keymap.set("v", "<leader>p", "\"_dP", { desc = "Paste without yanking" })
