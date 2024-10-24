-- vim: set ft=lua:
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        async = false,
                        filter = function(client) return client.name == "null-ls" end,
                    })
                end,
            })
        end
    end,
})
