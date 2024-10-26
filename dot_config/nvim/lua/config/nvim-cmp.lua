-- vim: set ft=lua:
require("cmp").setup({
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    formatting = {
        format = function(entry, item)
            local color_item = require("nvim-highlight-colors").format(entry, {
                kind = item.kind,
            })
            item = require("lspkind").cmp_format({
                mode = "symbol",
                maxwidth = {
                    menu = 50,
                    abbr = 50,
                },
                ellipsis_char = "…",
                show_labelDetails = true,
            })(entry, item)
            if color_item.abbr_hl_group then
                item.kind_hl_group = color_item.abbr_hl_group
                item.kind = color_item.abbr
            end
            return item
        end,
    },
    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },
    mapping = {
        ["<C-u>"] = require("cmp").mapping.scroll_docs(-4),
        ["<C-d>"] = require("cmp").mapping.scroll_docs(4),
        ["<C-Space>"] = require("cmp").mapping.complete(),
        ["<C-e>"] = require("cmp").mapping.close(),
        ["<CR>"] = require("cmp").mapping.confirm({
            behavior = require("cmp").ConfirmBehavior.Insert,
            select = true,
        }),
        ["<Tab>"] = require("cmp").mapping(function(fallback)
            if require("cmp").visible() then
                require("cmp").select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = require("cmp").mapping(function(fallback)
            if require("cmp").visible() then
                require("cmp").select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    sources = {
        {
            name = "copilot",
            group_index = 2,
        },
        {
            name = "nvim_lsp",
            group_index = 2,
        },
        {
            name = "luasnip",
            group_index = 2,
        },
        {
            name = "buffer",
            group_index = 2,
        },
        {
            name = "path",
            group_index = 2,
        },
    },
})

require("cmp").setup.cmdline(":", {
    completion = {
        completeopt = "menu,menuone,noinsert,noselect",
    },
    mapping = require("cmp").mapping.preset.cmdline(),
    sources = require("cmp").config.sources({
        {
            name = "cmdline",
            option = {
                ignore_cmds = {
                    "Man",
                    "!",
                },
            },
        },
        {
            name = "path",
        },
    }),
})
