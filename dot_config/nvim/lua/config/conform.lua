-- vim: set ft=lua:
require("conform").setup({
    formatters_by_ft = {
        awk = {
            "awk",
        },
        bash = {
            "shfmt",
            "shellcheck",
        },
        fortran = {
            "fprettify",
        },
        go = {
            "gofmt",
            "goimports",
        },
        json = {
            "jq",
        },
        latex = {
            "latexindent",
        },
        lua = {
            "stylua",
        },
        markdown = {
            "markdownlint-cli2",
            "marcdown-toc",
            "mdsf",
        },
        python = {
            "ruff_fix",
            "ruff_format",
            "ruff_organize_imports",
            lsp_format = "fallback",
        },
        rust = {
            "rustfmt",
            lsp_format = "fallback",
        },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

require("conform").formatters.fprettify = {
    prepend_args = {
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
}
