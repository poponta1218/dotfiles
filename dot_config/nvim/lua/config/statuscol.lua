-- vim: set ft=lua:
local builtin = require("statuscol.builtin")

require("statuscol").setup({
    relculright = true,
    ft_ignore = {
        "neo-tree",
    },
    segments = {
        {
            text = {
                builtin.foldfunc,
            },
            click = "v:lua.ScFa",
        },
        {
            text = {
                "%s",
            },
            click = "v:lua.ScSa",
        },
        {
            text = {
                builtin.lnumfunc,
                " ",
            },
            click = "v:lua.ScLa",
        },
    },
})
