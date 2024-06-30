-- vim: set ft=lua
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.fprettify,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.markdownlint_cli2,
    },
})
