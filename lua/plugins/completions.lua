return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      local ls = require("luasnip")
      ls.setup({
        snip_env = {
          s = function(...)
            local snip = ls.s(...)
            -- we can't just access the global `ls_file_snippets`, since it will be
            -- resolved in the environment of the scope in which it was defined.
            table.insert(getfenv(2).ls_file_snippets, snip)
          end,
          parse = function(...)
            local snip = ls.parser.parse_snippet(...)
            table.insert(getfenv(2).ls_file_snippets, snip)
          end,
          -- remaining definitions.
        },
      })

      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/plugins/snippets" })

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-n>"] = cmp.mapping(function(fallback)
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<C-p>"] = cmp.mapping(function(fallback)
            if ls.jumpable(-1) then
              ls.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
