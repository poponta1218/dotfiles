-- vim: set ft=lua:
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = {
            buffer = ev.buf,
        }

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format {
                async = true,
            }
        end, opts)

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client == nil then
            return
        end
    end,
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

-- Bash
lspconfig.bashls.setup {
    capabilities = capabilities,
}

-- CSS
lspconfig.cssls.setup {
    capabilities = capabilities,
}

-- Fortran
lspconfig.fortls.setup {
    capabilities = capabilities,
}

-- Go
lspconfig.gopls.setup {
    capabilities = capabilities,
}

-- HTML
lspconfig.html.setup {
    capabilities = capabilities,
}

-- JSON
lspconfig.jsonls.setup {
    capabilities = capabilities,
}

-- LaTeX
lspconfig.texlab.setup {
    capabilities = capabilities,
}

-- Lua
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                },
            },
            format = {
                enable = "true",
                config = {
                    indent_style = "space",
                    indent_size = "4",
                    continuation_indent_size = "4",
                    quote_style = "double",
                    break_after_table_lb = "true",
                    extra_sep_at_table_end = "true",
                    chop_down_table = "true",
                    keep_simple_function_one_line = "true",
                    single_quote_to_double_quote = "true",
                },
            },
        },
    },
    capabilities = capabilities,
}

-- Markdown
lspconfig.markdown_oxide.setup {
    capabilities = vim.tbl_deep_extend("force", capabilities, {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    }),
}

-- Python
lspconfig.ruff_lsp.setup {
    capabilities = capabilities,
}
lspconfig.pyright.setup {
    capabilities = capabilities,
    settings = {
        pyright = {
            disableOrganizeImports = false,
        },
        python = {
            venvPath = ".venv",
            pythonPath = ".venv/bin/python",
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
}

-- Rust
lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    },
}

-- Yaml
lspconfig.yamlls.setup {
    capabilities = capabilities,
}
