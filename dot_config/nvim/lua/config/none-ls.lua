-- vim: set ft=lua
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.formatting.fprettify.with({
            extra_args = {
                "--indent",
                "2",
                "--line-length",
                "132",
                "--enable-decl",
                "--strip-comments",
                "--preset",
                "3",
                "--case",
                "1",
                "1",
                "1",
                "1",
            },
        }),
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.diagnostics.markdownlint_cli2,
    },
})
