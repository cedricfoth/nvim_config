local EXCALIDRAW_PATH = os.getenv("EXCALIDRAW_PATH") 
local EXCALIDRAW_TEMPLATES_PATH = os.getenv("EXCALIDRAW_TEMPLATES_PATH") 

return {
	"marcocofano/excalidraw.nvim",
	opts = {
		storage_dir = EXCALIDRAW_PATH,
		templates_dir = EXCALIDRAW_TEMPLATES_PATH,
		open_on_create = true,
		relative_path = true,
		picker = {
			link_scene_mapping = "<C-l>",
		},
	config = function()
		require("excalidraw").setup(opts)
	end,
	},
}
