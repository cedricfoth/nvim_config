return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "bibtex",
                "cmake",
                "cpp",
                "yaml",
                "python",
                "lua",
                "latex",
                "vim",
                "matlab",
                "markdown",
                "swift",
                "gitignore",
            },
            highlight = { enable = false },
            indent = { enable = true },
        })
    end,
}
