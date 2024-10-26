-- vim: set ft=lua:
require("lsp_signature").setup({
    bind = true,
    doc_lines = 2,
    floating_window = true,
    hint_enable = true,
    hint_prefix = " ",
    hint_scheme = "String",
    hi_parameter = "Search",
    max_height = 12,
    max_width = 120,
    handler_opts = {
        border = "single",
    },
    zindex = 200,
    padding = "",
    shadow_blend = 0.5,
    shadow_guibg = "Black",
    use_lspsaga = true,
})
