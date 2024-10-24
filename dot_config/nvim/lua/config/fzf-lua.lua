-- vim: set ft=lua:
require("fzf-lua").setup({
    winopts = {
        height = 0.85, -- window height
        width = 0.80, -- window width
        row = 0.35, -- window row position (0=top, 1=bottom)
        col = 0.50, -- window col position (0=left, 1=right)
        border = "rounded", -- 'none', 'single', 'double', 'thicc' or 'rounded'
        fullscreen = false, -- start fullscreen?
    },
})
