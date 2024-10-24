-- vim: set ft=lua:
require("close_buffers").setup({
    filetype_ignore = {},
    file_grob_ignore = {},
    file_regex_ignore = {},
    preserve_window_layout = {
        "this",
        "nameless",
    },
    next_buffer_cmd = nil,
})
