local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		mode = "tabs",
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
	},
	highlights = {
		separator = {
			guifg = "#073642",
			guibg = "#002b36",
		},
		separator_selected = {
			guifg = "#073642",
		},
		background = {
			guifg = "#657b83",
			guibg = "#002b36",
		},
		buffer_selected = {
			guifg = "#fdf6e3",
			gui = "bold",
		},
		fill = {
			guibg = "#073642",
		},
	},
})
