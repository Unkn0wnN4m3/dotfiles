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
        separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
    },
    highlights = {
        buffer_selected = {
            bold = true,
        },
    },
})
