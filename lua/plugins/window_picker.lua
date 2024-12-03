return {
	"s1n7ax/nvim-window-picker",
	name = "window-picker",
	event = "VeryLazy",

	version = "2.*",
	config = function()
		require("window-picker").setup({
			-- type of hints you want to get
			-- following types are supported
			-- 'statusline-winbar' | 'floating-big-letter'
			-- 'statusline-winbar' draw on 'statusline' if possible, if not 'winbar' will be
			-- 'floating-big-letter' draw big letter on a floating window
			-- used
			hint = "floating-big-letter",

			-- when you go to window selection mode, status bar will show one of
			-- following letters on them so you can use that letter to select the window
			selection_chars = "FJDKSLA;CMRUEIWOQP",

			-- This section contains picker specific configurations
			picker_config = {
				statusline_winbar_picker = {
					-- You can change the display string in status bar.
					-- It supports '%' printf style. Such as `return char .. ': %f'` to display
					-- buffer file path. See :h 'stl' for details.
					selection_display = function(char, windowid)
						return "%=" .. char .. "%="
					end,

					-- whether you want to use winbar instead of the statusline
					-- "always" means to always use winbar,
					-- "never" means to never use winbar
					-- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
					use_winbar = "never", -- "always" | "never" | "smart"
				},

				floating_big_letter = {
					-- window picker plugin provides bunch of big letter fonts
					-- fonts will be lazy loaded as they are being requested
					-- additionally, user can pass in a table of fonts in to font
					-- property to use instead

					font = "ansi-shadow", -- ansi-shadow |
				},
			},

			-- whether to show 'Pick window:' prompt
			show_prompt = true,

			-- prompt message to show to get the user input
			prompt_message = "Pick window: ",
			filter_rules = {
				include_current_win = false,
				autoselect_one = true,
				-- filter using buffer options
				bo = {
					-- if the file type is one of following, the window will be ignored
					filetype = { "neo-tree", "neo-tree-popup", "notify" },
					-- if the buffer type is one of following, the window will be ignored
					buftype = { "terminal", "quickfix" },
				},
			},
		})
	end,
}
