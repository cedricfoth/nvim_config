return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "Zettelkasten",
        path = "/Users/cedricfoth/Documents/4_Obsidian/Zettelkasten",
      },
    },

    -- see below for full list of options 👇
  },
}
