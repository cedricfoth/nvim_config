--NVIM Keymaps

--Normal Mode
-- -- Navigation
--vim.keymap.set('n','<c-h>',':wincmd h<CR>',{}) --Move Left
--vim.keymap.set('n','<c-l>',':wincmd l<CR>',{}) -- Move Right
--vim.keymap.set('n','<c-j>',':wincmd j<CR>',{}) --Move Down
--vim.keymap.set('n','<c-k>',':wincmd k<CR>',{}) -- Move Up

local keymap = vim.keymap.set

keymap("n", "ä", "]", {remap = true})
keymap("n", "ö", "[", {remap = true })
keymap("n", "ü", "'", {remap = true})
keymap('n', '<C-f>', '<Nop>', { noremap = true, silent = true })

-- -- Split
keymap("n", "||", ":vsplit<cr>", { silent = true, desc = "Split window vertically" })
keymap("n", "--", ":split<cr>",  { silent = true, desc = "Split window horizontally" })
keymap("n", "<Leader>sx", "<C-w>q", { desc = "Quit Split" })       -- Quit Split
keymap("n", "=", "<C-w>=", { desc = "Equal Size" })       -- Equal Size
keymap("n", "<Leader>sm", "<C-w>T", { desc = "Open in Tab" })       -- Open in Tab
-- -- Window Resizing
keymap("n", "tl", ":vert res +15<cr>",      { silent = true, desc = "Increase window height" })
keymap("n", "th", ":vert res -15<cr>",      { silent = true, desc = "Decrease window height" })
keymap("n", "tk", ":res +15<cr>", { silent = true, desc = "Increase window width" })
keymap("n", "tj", ":res -15<cr>", { silent = true, desc = "Decrease window width" })

-- -- Tabs
keymap("n", "<Leader>tn", ":tabnew<CR>", { desc = "New Tab",silent = true }) -- New Tab
keymap("n", "<Leader>qt", ":tabc<CR>", { desc = "Close Tab", silent = true }) -- Close Tab
keymap("n", "ää", ":tabnext<CR>", { desc = "Next Tab", silent = true }) -- Next Tab
keymap("n", "öö", ":tabprevious<CR>", { desc = "Previous Tab", silent = true }) -- Previous Tab


-- -- Vimtext
keymap("n", "<leader>tc", ":VimtexCompile<CR><CR>", { desc = "Compile Latex Document", silent = true })
keymap(
  "n",
  "<leader>tz",
  ":!zathura --fork %:t:r.pdf<CR><CR>",
  { desc = "Open zathura for current document", silent = true }
)
keymap("n", "<leader>tt", ":VimtexTocToggle<CR>", { desc = "Toggle TOC", silent = true })
keymap("n", "<leader>ts", ":VimtexView<CR>", { desc = "Show in PDF", silent = true })


-- Obisidian commands
keymap("n", "<leader>oo", ":ObsidianOpen<cr>", { desc = "Open current File in Obsidian", silent = true })
keymap("n", "<leader>os", ":ObsidianFollowLink vsplit<cr>", { desc = "Open Link in vsplit", silent = true })
keymap("n", "<leader>oh", ":ObsidianFollowLink hsplit<cr>", { desc = "Open Link in hsplit", silent = true })
keymap("n", "<leader>og", ":ObsidianFollowLink<cr>", { desc = "Follow Link", silent = true })
keymap("n", "<leader>ot", ":ObsidianTOC<cr>", { desc = "Open TOC", silent = true })



-- Diffview
keymap("n", "<leader>gd", ":DiffviewOpen<cr>", { desc = "Open Diffview", silent = true })
keymap("n", "<leader>gc", ":DiffviewClose<cr>", { desc = "Close Diffview", silent = true })

-- Copilot
keymap("i","<C-l>","<Plug>(copilot-accept-word)",{silent = true})

vim.g.copilot_no_tab_map = true
keymap('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

-- Refactoring
keymap("x", "<leader>re", ":Refactor extract ",{desc = "Extract Function"})
keymap("x", "<leader>rf", ":Refactor extract_to_file ", {desc = "Extract Function to File"})

keymap("x", "<leader>rv", ":Refactor extract_var ", {desc = "Extract Variable"})

keymap({ "n", "x" }, "<leader>ri", ":Refactor inline_var", {desc = "Inline Variable"})

keymap( "n", "<leader>rI", ":Refactor inline_func", {desc = "Inline Function"})

keymap("n", "<leader>rb", ":Refactor extract_block", {desc = "Extract Block"})
keymap("n", "<leader>rbf", ":Refactor extract_block_to_file", {desc = "Extract Block to File"})

-- Undotree
keymap("n", "<leader>u", ":UndotreeToggle<cr>", { desc = "Toggle Undotree", silent = true })



--Normal Mode
keymap("n", "<leader>kj", ":nohl<cr>", { desc = "Clear Hightlights", silent = true })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Clear Hightlights", silent = true })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Clear Hightlights", silent = true })
keymap("n", "<C-s>", ":s/<C-r><C-w>/", { desc = "Replace word under Cursor"})
keymap('n', '<leader>cq', ':call setqflist([])<CR>:cclose<CR>', { noremap = true, silent = true })
keymap("n", "<bs>", "<C-^>", { silent = true, desc = "Switch to previous buffer" })
keymap("n", "<leader>qq", ":bd<cr>", { silent = true, desc = "Close current buffer" })
keymap("n", "<leader>qa", ":%bd<cr>", { silent = true, desc = "Close all buffers" })
keymap("n", "J",          "mzJ`z",       { silent = true, desc = "Append next line to current line with space" })
keymap("n", "gp",         "`[v`]",       { silent = true, desc = "Re-select last pasted text" })

-- Greatest keymap ever from ThePrimeagen
keymap({ "n", "x" }, "<leader>p", [["_dP]], { silent = true, desc = "Paste text from the clipboard, discarding the selected text" })

--Insert Mode
keymap("i", "kj", "<Esc>", {})
--Visual Mode
keymap("v", "kj", "<Esc>", {})
-- Search Mode
keymap("n", "n", "nzzzv", { silent = true, desc = "Move to next search match and center" })
keymap("n", "N", "Nzzzv", { silent = true, desc = "Move to previous search match and center" })

-- Move Visual Block
keymap("x", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move visual block down" })
keymap("x", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move visual block up" })

-- =============================================================================
-- Octo.nvim Shortcuts -- Leader + r (für Review/Repo)
-- =============================================================================
--local map = function(lhs, rhs, desc)
--  vim.keymap.set('n', lhs, rhs, { silent = true, desc = 'Octo: ' .. desc })
--end
keymap('n', ',ghr', '<cmd>Octo review start<cr>', { silent = true, desc = 'Octo: Start new review' })
keymap('n', ',ghR', '<cmd>Octo review submit<cr>', { silent = true, desc = 'Octo: Submit review' })
keymap('n', ',ghd', '<cmd>Octo review close<cr>', { silent = true, desc = 'Octo: Discard review' })
keymap('n', ',ghca', '<cmd>Octo review comment<cr>', { silent = true, desc = 'Octo: Add review comment' })
keymap('n', ',ghcs', '<cmd>Octo review suggestion<cr>', { silent = true, desc = 'Octo: Add review suggestion' })

-- Allgemeine Kommentar-Aktionen
keymap('n', 'ca', '<cmd>Octo comment add<cr>', { silent = true, desc = 'Octo: Add a standalone comment' })
keymap('n', 'cd', '<cmd>Octo comment delete<cr>', { silent = true, desc = 'Octo: Delete comment/suggestion' })

-- Hilfsfunktion, um eine Issue/PR-Nummer aus der visuellen Auswahl oder dem Register zu öffnen
local function open_octo_item(item_type)
  local number = vim.fn.getreg('"') -- Nummer aus dem Register holen
  if vim.fn.mode() == 'v' then -- Wenn im visuellen Modus, den ausgewählten Text nehmen
    vim.cmd('noautocmd silent! normal! "vy"')
    number = vim.fn.getreg('v')
  end
  vim.cmd('Octo ' .. item_type .. ' open ' .. vim.fn.trim(number))
end

-- Pull Requests
keymap('n', ',ghpl', '<cmd>Telescope octo pull_requests<cr>', { silent = true, desc = 'Octo: List Pull Requests' })
keymap('n', ',ghpa', '<cmd>Telescope octo pull_requests assignee=@me<cr>', { silent = true, desc = 'Octo: List my assigned PRs' })
keymap('n', ',ghpc', '<cmd>Octo pr create<cr>', { silent = true, desc = 'Octo: Create Pull Request' })
keymap('n', ',ghpb', '<cmd>Octo pr checkout<cr>', { silent = true, desc = 'Octo: Checkout PR branch' })

-- Issues
keymap('n', ',ghil', '<cmd>Telescope octo issues<cr>', { silent = true, desc = 'Octo: List Issues' })
keymap('n', ',ghia', '<cmd>Telescope octo issues assignee=@me<cr>', { silent = true, desc = 'Octo: List my assigned Issues' })
keymap('n', ',ghic', '<cmd>Octo issue create<cr>', { silent = true, desc = 'Octo: Create Issue' })
keymap('n', ',ghio', function() open_octo_item('issue') end, { silent = true, desc = 'Octo: Open Issue # (from selection/clipboard)' })
