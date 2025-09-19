return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",

        -- Adapters
        "nvim-neotest/neotest-python", -- Python
        "alfaix/neotest-gtest",        -- C++ (GoogleTest)
    },
    config = function()
        local neotest = require("neotest")

        neotest.setup({
            adapters = {
                -- Python
                require("neotest-python")({
                    dap = { justMyCode = false }, -- Debugging falls DAP installiert
                    runner = "pytest",            -- oder "unittest"
                }),
                -- C++ / GoogleTest
                require("neotest-gtest").setup({
                    -- Default build dir, falls du CMake benutzt
                    build_dir = "build",
                    -- executable = "path/to/tests" -- wenn du direkt eine Binary angeben willst
                }),
            },
        })

        -- Keymaps
        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        map("n", "<leader>tn", function()
            neotest.run.run()
        end, vim.tbl_extend("force", opts, { desc = "Neotest: Run current test" }))

        map("n", "<leader>tf", function()
            neotest.run.run(vim.fn.expand("%"))
        end, vim.tbl_extend("force", opts, { desc = "Neotest: Run all tests in file" }))

        map("n", "<leader>ta", function()
            neotest.run.run({ suite = true })
        end, vim.tbl_extend("force", opts, { desc = "Neotest: Run full test suite" }))

        map("n", "<leader>ts", function()
            neotest.summary.toggle()
        end, vim.tbl_extend("force", opts, { desc = "Neotest: Toggle summary panel" }))

        map("n", "<leader>to", function()
            neotest.output.open({ enter = true })
        end, vim.tbl_extend("force", opts, { desc = "Neotest: Open output window" }))

        map("n", "<leader>tp", function()
            neotest.output_panel.toggle()
        end, vim.tbl_extend("force", opts, { desc = "Neotest: Toggle output panel" }))

        map("n", "<leader>td", function()
            neotest.run.run({ strategy = "dap" })
        end, vim.tbl_extend("force", opts, { desc = "Neotest: Debug test (DAP)" }))
    end,
}
