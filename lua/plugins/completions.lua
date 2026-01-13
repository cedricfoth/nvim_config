return {
	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local ls = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").load({
				paths = "~/.config/nvim/lua/plugins/snippets",
			})

			ls.setup({
				snip_env = {
					s = function(...)
						local snip = ls.s(...)
						table.insert(getfenv(2).ls_file_snippets, snip)
					end,
					parse = function(...)
						local snip = ls.parser.parse_snippet(...)
						table.insert(getfenv(2).ls_file_snippets, snip)
					end,
				},
			})
		end,
	},

	-- Completion
	{

		"saghen/blink.cmp",
		-- version = "*",
		dependencies = {
			"L3MON4D3/LuaSnip",
		},
		opts = {
			-- Snippet Engine
			snippets = { preset = "luasnip" },

			-- Quellen (entspricht deinen cmp.sources)
			sources = {
				default = { "snippets", "lsp", "path", "buffer" },
			},

			completion = {
				menu = { border = "rounded" },
				documentation = { auto_show = true, window = { border = "rounded" } },
			},

			signature = { window = { border = "rounded" }, enabled = true },

			-- Keymaps
			keymap = {
				preset = "none",

				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },

				["<C-Space>"] = { "show", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				-- LuaSnip Integration
				["<C-n>"] = { "snippet_forward", "show" },

				["<C-p>"] = { "snippet_backward", "show" },
			},
		},
	},
}
