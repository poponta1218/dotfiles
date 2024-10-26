-- vim: set ft=lua:
require("hlchunk").setup({
    chunk = {
        enable = true,
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
    },
    indent = {
        enable = false,
    },
    line_num = {
        enable = true,
    },
    blank = {
        enable = true,
        chars = {
            "··",
        },
    },
})
