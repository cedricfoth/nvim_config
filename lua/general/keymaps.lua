--Normal Mode
-- -- Navigation
--vim.keymap.set('n','<c-h>',':wincmd h<CR>',{}) --Move Left
--vim.keymap.set('n','<c-l>',':wincmd l<CR>',{}) -- Move Right
--vim.keymap.set('n','<c-j>',':wincmd j<CR>',{}) --Move Down
--vim.keymap.set('n','<c-k>',':wincmd k<CR>',{}) -- Move Up
--
local select_block = require("utils.select_codeblock")

local keymap = vim.keymap.set

keymap({ "n", "v", "o" }, "ä", "]", { remap = true })
keymap({ "n", "v", "o" }, "ö", "[", { remap = true })
keymap("n", "ü", "'", { remap = true })

-- -- Split
keymap("n", "||", ":vsplit<cr>", { silent = true, desc = "Split window vertically" })
keymap("n", "--", ":split<cr>", { silent = true, desc = "Split window horizontally" })
keymap("n", "<Leader>wq", "<C-w>q", { desc = "Quit Split" }) -- Quit Split
keymap("n", "<Leader>we", "<C-w>=", { desc = "Equal Size" }) -- Equal Size
keymap("n", "<Leader>wt", "<C-w>T", { desc = "Open in Tab" }) -- Open in Tab
-- -- Window Resizing
keymap("n", "<Leader>wl", ":vert res +15<cr>", { silent = true, desc = "Increase window height" })
keymap("n", "<Leader>wh", ":vert res -15<cr>", { silent = true, desc = "Decrease window height" })
keymap("n", "<Leader>wk", ":res +15<cr>", { silent = true, desc = "Increase window width" })
keymap("n", "<Leader>wj", ":res -15<cr>", { silent = true, desc = "Decrease window width" })

-- -- Tabs
keymap("n", "<Leader>Tn", ":tabnew<CR>", { desc = "New Tab", silent = true }) -- New Tab
keymap("n", "<Leader>Tq", ":tabc<CR>", { desc = "Close Tab", silent = true }) -- Close Tab

-- keymap("n", "ää", ":tabnext<CR>", { desc = "Next Tab", silent = true }) -- Next Tab
-- keymap("n", "öö", ":tabprevious<CR>", { desc = "Previous Tab", silent = true }) -- Previous Tab

-- -- Vimtext
keymap("n", "<leader>vc", ":VimtexCompile<CR>", { desc = "Compile Latex Document", silent = true })
keymap(
	"n",
	"<leader>vz",
	":!zathura  --fork --synctex-forward %l:1:%f %p<CR><CR>",
	{ desc = "Open zathura for current document", silent = true }
)
keymap("n", "<leader>vt", ":VimtexTocToggle<CR>", { desc = "Toggle TOC", silent = true })
keymap("n", "<leader>vs", ":VimtexView<CR>", { desc = "Show in PDF", silent = true })
keymap("n", "<leader>ve", ":VimtexErrors<CR>", { desc = "Vimtex Errors", silent = true })

-- Obisidian commands
keymap("n", "<leader>oo", ":ObsidianOpen<cr>", { desc = "Open current File in Obsidian", silent = true })
keymap("n", "<leader>os", ":ObsidianFollowLink vsplit<cr>", { desc = "Open Link in vsplit", silent = true })
keymap("n", "<leader>oh", ":ObsidianFollowLink hsplit<cr>", { desc = "Open Link in hsplit", silent = true })
keymap("n", "<leader>ot", ":ObsidianTOC<cr>", { desc = "Open TOC", silent = true })

-- Diffview
keymap("n", "<leader>gd", ":DiffviewOpen<cr>", { desc = "Open Diffview", silent = true })
keymap("n", "<leader>gc", ":DiffviewClose<cr>", { desc = "Close Diffview", silent = true })

-- Copilot
keymap("i", "<C-l>", "<Plug>(copilot-accept-word)", { silent = true })

vim.g.copilot_no_tab_map = true
keymap("i", "<S-Tab>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})

-- Refactoring
keymap("x", "<leader>re", ":Refactor extract ", { desc = "Extract Function" })
keymap("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Extract Function to File" })

keymap("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract Variable" })

keymap({ "n", "x" }, "<leader>ri", ":Refactor inline_var ", { desc = "Inline Variable" })

keymap("n", "<leader>rI", ":Refactor inline_func ", { desc = "Inline Function" })

keymap("n", "<leader>rb", ":Refactor extract_block ", { desc = "Extract Block" })
keymap("n", "<leader>rbf", ":Refactor extract_block_to_file ", { desc = "Extract Block to File" })

-- Undotree
keymap("n", "<leader>u", ":UndotreeToggle<cr>", { desc = "Toggle Undotree", silent = true })

--Normal Mode
keymap("n", "<leader>lh", ":nohl<cr>", { desc = "Clear Hightlights", silent = true })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Clear Hightlights", silent = true })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Clear Hightlights", silent = true })
keymap("n", "<C-s>", ":s/<C-r><C-w>/", { desc = "Replace word under Cursor" })
keymap("n", "<leader>qq", ":call setqflist([])<CR>:cclose<CR>", { noremap = true, silent = true })
keymap("n", "<bs>", "<C-^>", { silent = true, desc = "Switch to previous buffer" })
keymap("n", "<leader>bq", ":bd<cr>", { silent = true, desc = "Close current buffer" })
keymap("n", "<leader>ba", ":%bd<cr>", { silent = true, desc = "Close all buffers" })

keymap("n", "J", "mzJ`z", { silent = true, desc = "Append next line to current line with space" })
keymap("n", "gp", "`[v`]", { silent = true, desc = "Re-select last pasted text" })

-- Greatest keymap ever from ThePrimeagen
keymap(
	{ "n", "x" },
	"<leader>p",
	[["_dP]],
	{ silent = true, desc = "Paste text from the clipboard, discarding the selected text" }
)

--Insert Mode
keymap("i", "kj", "<Esc>", {})
--Visual Mode
keymap("v", "<C-k>", "<Esc>", {})
-- Search Mode
keymap("n", "n", "nzzzv", { silent = true, desc = "Move to next search match and center" })
keymap("n", "N", "Nzzzv", { silent = true, desc = "Move to previous search match and center" })

-- Move Visual Block
keymap("x", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move visual block down" })
keymap("x", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move visual block up" })

-- -- Hilfsfunktion, um eine Issue/PR-Nummer aus der visuellen Auswahl oder dem Register zu öffnen
-- local function open_octo_item(item_type)
-- 	local number = vim.fn.getreg('"') -- Nummer aus dem Register holen
-- 	if vim.fn.mode() == "v" then -- Wenn im visuellen Modus, den ausgewählten Text nehmen
-- 		vim.cmd('noautocmd silent! normal! "vy"')
-- 		number = vim.fn.getreg("v")
-- 	end
-- 	vim.cmd("Octo " .. item_type .. " open " .. vim.fn.trim(number))
-- end

-- -- Pull Requests
-- keymap("n", ",ghpl", "<cmd>Telescope octo pull_requests<cr>", { silent = true, desc = "Octo: List Pull Requests" })
-- keymap(
-- 	"n",
-- 	",ghpa",
-- 	"<cmd>Telescope octo pull_requests assignee=@me<cr>",
-- 	{ silent = true, desc = "Octo: List my assigned PRs" }
-- )
-- keymap("n", ",ghpc", "<cmd>Octo pr create<cr>", { silent = true, desc = "Octo: Create Pull Request" })
-- keymap("n", ",ghpb", "<cmd>Octo pr checkout<cr>", { silent = true, desc = "Octo: Checkout PR branch" })
--
-- -- Issues
-- keymap("n", ",ghil", "<cmd>Telescope octo issues<cr>", { silent = true, desc = "Octo: List Issues" })
-- keymap(
-- 	"n",
-- 	",ghia",
-- 	"<cmd>Telescope octo issues assignee=@me<cr>",
-- 	{ silent = true, desc = "Octo: List my assigned Issues" }
-- )
-- keymap("n", ",ghic", "<cmd>Octo issue create<cr>", { silent = true, desc = "Octo: Create Issue" })
-- keymap("n", ",ghio", function()
-- 	open_octo_item("issue")
-- end, { silent = true, desc = "Octo: Open Issue # (from selection/clipboard)" })

-- LSP Keymaps

keymap("n", "<leader>lr", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })
keymap("n", "<leader>lx", ":LspStop<cr>", { noremap = true, silent = true, desc = "Stop LSP Client" })
keymap("n", "<leader>ls", ":LspStart<cr>", { noremap = true, silent = true, desc = "Start LSP Client" })
keymap("n", "K", function()
	vim.lsp.buf.hover({ border = "single", max_height = 25, max_width = 120 })
end, { desc = "Hover Documentation" })
keymap("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to Declaration" })
keymap("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to Definition" })
-- keymap("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "Go to Reference" }) -- Deprecated due to new Lspsaga keymap
keymap("n", "]d", ":Lspsaga diagnostic_jump_next <cr>", { desc = "Next Diagnostic", silent = true })
keymap("n", "[d", ":Lspsaga diagnostic_jump_prev <cr>", { desc = "Previous Diagnostic", silent = true })
keymap({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
keymap("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
-- keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" }) -- Deprecated due to new Lspsaga keymap

-- Molten
keymap("n", "<leader>je", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "Jupyter: run operator selection" })
keymap("n", "<leader>jl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Jupyter: evaluate line" })
keymap("n", "<leader>jr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Jupyter: re-evaluate cell" })
keymap(
	"v",
	"<leader>jv",
	":<C-u>MoltenEvaluateVisual<CR>gv",
	{ silent = true, desc = "Jupyter: evaluate visual selection" }
)
keymap("n", "<leader>ji", function()
	local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
	if venv ~= nil then
		-- in the form of /home/benlubas/.virtualenvs/VENV_NAME
		venv = string.match(venv, "/.+/(.+)")
		vim.cmd(("MoltenInit %s"):format(venv))
	else
		vim.cmd("MoltenInit python3")
	end
end, { desc = "Jupyter: Initialize Molten for python3", silent = true })

--- Custom Script Commands
keymap({ "n", "v" }, "<leader>jbv", select_block.select_inner_code_block, {
	desc = "Select inner Markdown code block",
})
