return {
	"3rd/image.nvim",
	opts = {
		backend = "kitty",
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = true,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "markdown", "vimwiki", "mermaid", "plantuml" },
			},
		},
		-- Breite und Positionierung:
		max_width = nil, -- "nil" erlaubt die volle Breite
		max_height = nil,
		max_width_window_percentage = 100, -- Nimmt die volle Fensterbreite ein
		max_height_window_percentage = 50, -- Begrenzt die Höhe, damit man noch Text sieht
		window_overlap_clear_enabled = true,
		editor_only_render_when_focused = true,
	},
}
