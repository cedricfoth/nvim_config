return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "github/copilot.vim",
    },
    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({})
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "yamlls",
                    "pyright",
                    "cmake",
                    "ltex",
                    "texlab",
                    "matlab_ls",
                    "jsonls",
                    "html",
                    "cssls",
                    "eslint",
                },
                automatic_enable = false,
            })
        end,
    },
    {
        "barreiroleo/ltex_extra.nvim",
        ft = { "markdown", "tex" },
        dependencies = { "neovim/nvim-lspconfig" },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
            })
            lspconfig.ccls.setup({
                capabilities = capabilities,

                init_options = {
                    cache = {
                        directory = ".ccls-cache",
                    },
                    compilationDatabaseDirectory = ".",
                },
                root_dir = lspconfig.util.root_pattern("compile_commands.json", ".ccls", ".git"),
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.cmake.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })

            lspconfig.texlab.setup({
                filetypes = { "tex", "latex" },
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
                on_attach = on_attach,
                capabilities = capabilities,
                use_spellfile = false,
                filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
                settings = {
                    ltex = {
                        enabled = { "latex", "tex", "bib", "markdown" },
                        language = "de-DE",
                        checkFrequency = "save",
                    },
                },
            })
            lspconfig["matlab_ls"].setup({
                filetypes = { "matlab", "octave" },
                settings = {
                    MATLAB = {
                        indexWorkspace = true,
                        installPath = vim.g.matlab_install_path or vim.fn.expand("/Applications/MATLAB_R2024b.app"),
                        matlabConnectionTiming = "onStart",
                        telemetry = true,
                    },
                },
            })

            lspconfig.sourcekit.setup({
                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })
            vim.keymap.set(
                "n",
                "<leader>lx",
                ":LspStop<cr>",
                { noremap = true, silent = true, desc = "Stop LSP Client" }
            )
            vim.keymap.set(
                "n",
                "<leader>ls",
                ":LspStart<cr>",
                { noremap = true, silent = true, desc = "Start LSP Client" }
            )
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover" })
            vim.keymap.set(
                "n",
                "gD",
                vim.lsp.buf.declaration,
                { noremap = true, silent = true, desc = "Go to Declaration" }
            )
            vim.keymap.set(
                "n",
                "gd",
                vim.lsp.buf.definition,
                { noremap = true, silent = true, desc = "Go to Definition" }
            )
            vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next <cr>", { desc = "Next Diagnostic", silent = true })
            vim.keymap.set(
                "n",
                "[d",
                ":Lspsaga diagnostic_jump_prev <cr>",
                { desc = "Previous Diagnostic", silent = true }
            )
            vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
        end,
    },
}
