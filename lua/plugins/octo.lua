return {
    "pwntester/octo.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("octo").setup()
    end,
}
