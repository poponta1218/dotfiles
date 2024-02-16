-- vim: ft=lua

require("nvim-treesitter").setup({
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "csv",
        "dockerfile",
        "fortran",
        "go",
        "gomod",
        "html",
        "java",
        "javascript",
        "json",
        "jsonc",
        "julia",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "ocaml",
        "python",
        "regex",
        "ruby",
        "rust",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
    textobjects = {
        move = {
            enable = true,
            goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = "@class.outer",
            },
            goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@class.outer",
            },
            goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
            },
            goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@class.outer",
            },
        },
    },
})
