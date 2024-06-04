return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls","yamlls","pyright","cmake","ltex"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        capabilities = capabilities
      })
      lspconfig.cmake.setup({
        capabilities = capabilities
      })
      lspconfig.ltex.setup({
        capabilities = capabilities
      })

      vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format,{})
      vim.keymap.set('n','K', vim.lsp.buf.hover,{})
      vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,{})
    end
  },
}
