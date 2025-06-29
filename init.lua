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

-- Auto commands
-- vim.api.nvim_create_autocmd("WinNew", {
--     pattern = "*",
--     callback = function()
--         vim.cmd("wincmd w")
--     end,
-- })

-- General Settings
require("general/general")


-- Plugin Management
require("lazy").setup("plugins")
--Keyboard Mappings
require("general/keymaps")

