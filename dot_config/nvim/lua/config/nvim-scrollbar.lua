-- vim: set ft=lua:
require("scrollbar").setup({
    auto_hide = true,
    auto_hide_timeout = 500,
    color = {
        fg = "#4b5263",
        bg = "#282c34",
        cursor = "#61afef",
    },
    marks = {
        Search = {
            color = "lime",
        },
        Error = {
            color = "red",
        },
        Warn = {
            color = "orange",
        },
        Info = {
            color = "cyan",
        },
        Hint = {
            color = "gray",
        },
        Misc = {
            color = "purple",
        },
    },
})
