return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "yamlls", "pyright", "cmake", "ltex", "texlab", "matlab_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.cmake.setup({
        capabilities = capabilities,
      })

      lspconfig.texlab.setup({
        -- cmd = { "texlab", "-vvvv", "--log-file", "/tmp/texlab.log" },
        capabilities = capabilities,
        flags = {
          allow_incremental_sync = false,
        },
        log_level = vim.lsp.protocol.MessageType.Log,
        message_level = vim.lsp.protocol.MessageType.Log,
        settings = {
          texlab = {
            auxDirectory = "build",
            diagnosticsDelay = 50,
            build = {
              executable = "latexmk",
              onSave = true,
              args = {
                "-pdf",
                "-pdflua",
                "-quiet",
                "-interaction=nonstopmode",
                "-synctex=1",
                "-shell-escape",
                -- "-pvc",
                "-f",
                "-outdir=build",
                "%f",
              },
            },
            forwardSearch = {
              args = { "--synctex-forward", "%l:1:%f", "%p" },
              executable = "zathura",
            },
            chktex = { onOpenAndSave = true, onEdit = false },
            formatterLineLength = 120,
          },
        },
      })
      lspconfig.ltex.setup({
        capabilities = capabilities,
        on_attach = function()
          require("ltex_extra").setup({
            init_check = true,
          })
        end,
        settings = {
          ltex = {
            language = "ngerman",
            checkFrequency = "save",
          },
        },
      })
      lspconfig["matlab_ls"].setup({
        capabilities = capabilities,
        settings = {
          matlab = {
            indexWorkspace = true,
            installPath = "/Applications/MATLAB_R2024a.app/",
            matlabConnectionTiming = "onStart",
            telemetry = true,
          },
        },
      })

      vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
