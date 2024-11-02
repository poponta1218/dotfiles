-- vim: set ft=lua:
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            {
                "Failed to clone lazy.nvim:\n",
                "ErrorMsg",
            },
            {
                out,
                "WarningMsg",
            },
            {
                "\nPress any key to exit...",
            },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local function merge_tables(t1, t2)
    local merged = {}
    for _, v in ipairs(t1) do
        table.insert(merged, v)
    end
    for _, v in ipairs(t2) do
        table.insert(merged, v)
    end
    return merged
end

local is_vscode = vim.g.vscode == 1

local lazyOpts = {
    defaults = {
        lazy = true,
    },
    performance = {
        cache = {
            enabled = true,
        },
    },
    change_detection = {
        notify = true,
    },
    colorscheme = {
        "nordfox",
    },
}

local common_plugins = {
    {
        "tpope/vim-commentary",
        keys = {
            "gc",
        },
    },
    {
        "kylechui/nvim-surround",
        keys = {
            "cs",
            "ds",
            "ys",
            {
                "S",
                mode = "v",
            },
        },
    },
}

local vscode_plugins = {}

local neovim_plugins = {
    -- Appearance
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        config = function() require("config/nightfox") end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function() require("config/lualine") end,
    },
    {
        "petertriho/nvim-scrollbar",
        event = "VeryLazy",
        config = function() require("config/nvim-scrollbar") end,
    },
    {
        "kevinhwang91/nvim-hlslens",
        event = "BufRead",
        config = function() require("config/nvim-hlslens") end,
    },
    {
        "kyazdani42/nvim-web-devicons",
        opts = {},
    },
    {
        "romgrk/barbar.nvim",
        event = {
            "BufNewFile",
            "BufRead",
        },
        opts = {},
    },
    {
        "kazhala/close-buffers.nvim",
        event = {
            "BufNewFile",
            "BufRead",
        },
        config = function() require("config/close-buffers") end,
    },
    {
        "kevinhwang91/nvim-ufo",
        event = "VeryLazy",
        config = function() require("config/nvim-ufo") end,
    },
    {
        "kevinhwang91/promise-async",
    },
    {
        "brenoprata10/nvim-highlight-colors",
        event = "VeryLazy",
        config = function() require("config/nvim-highlight-colors") end,
    },
    -- Filer
    {
        "stevearc/oil.nvim",
        cmd = {
            "Oil",
        },
        config = function() require("config/oil-nvim") end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        event = "VimEnter",
        config = function() require("config/neo-tree") end,
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "3rd/image.nvim",
    },
    {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        event = "VeryLazy",
        config = function() require("config/nvim-window-picker") end,
    },
    -- Syntax Highlighter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
            {
                "nvim-treesitter/nvim-treesitter-context",
                opts = {
                    mode = "cursor",
                    max_lines = 3,
                },
            },
        },
        cmd = {
            "TSUpdateSync",
            "TSUPdate",
            "TSInstall",
        },
        event = {
            "BufReadPre",
            "BufWritePre",
            "BufNewFile",
        },
        config = function() require("config/nvim-treesitter") end,
    },
    -- Language Server Protocol
    {
        "neovim/nvim-lspconfig",
        event = {
            "BufReadPre",
            "BufWritePre",
            "BufNewFile",
        },
        config = function() require("config/lspconfig") end,
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function() require("config/lspsaga") end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "LspAttach",
        config = function() require("config/lsp_signature") end,
    },
    {
        "stevearc/conform.nvim",
        event = "InsertEnter",
        config = function() require("config/conform") end,
    },
    -- Popup UI
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function() require("config/noice") end,
    },
    {
        "MunifTanjim/nui.nvim",
    },
    {
        "rcarriga/nvim-notify",
        opts = {},
    },
    {
        "j-hui/fidget.nvim",
        event = "VeryLazy",
        config = function() require("config/fidget") end,
    },
    -- Auto Completion
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            {
                "saadparwaiz1/cmp_luasnip",
            },
        },
        event = "InsertEnter",
        config = function() require("config/luasnip") end,
    },
    {
        "zbirenbaum/copilot.lua",
        dependencies = {
            {
                "zbirenbaum/copilot-cmp",
                config = function() require("config/copilot-cmp") end,
            },
        },
        cmd = {
            "Copilot",
        },
        event = "InsertEnter",
        config = function() require("config/copilot") end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
            },
            {
                "hrsh7th/cmp-buffer",
            },
            {
                "hrsh7th/cmp-path",
            },
            {
                "hrsh7th/cmp-cmdline",
            },
            {
                "onsails/lspkind-nvim",
            },
        },
        event = {
            "InsertEnter",
            "CmdlineEnter",
        },
        config = function() require("config/nvim-cmp") end,
    },
    -- Git
    {
        "lewis6991/gitsigns.nvim",
        event = {
            "BufReadPre",
            "BufWritePre",
            "BufNewFile",
        },
        config = function() require("config/gitsigns") end,
    },
    -- Others
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "gw31415/scrollUptoLastLine.vim",
        keys = {
            "<MouseUp>",
        },
    },
    {
        "ibhagwan/fzf-lua",
        cmd = {
            "FzfLua",
        },
        config = function() require("config/fzf-lua") end,
    },
    {
        "markonm/traces.vim",
        keys = {
            {
                "s/",
                mode = "c",
            },
        },
    },
    {
        "ctrlpvim/ctrlp.vim",
        cmd = {
            "CtrlP",
            "CtrlPBuffer",
            "CtrlPMRU",
            "CtrlPMixed",
        },
        keys = {
            {
                "<C-p>",
                mode = "n",
            },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "shellRaining/hlchunk.nvim",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        config = function() require("config/hlchunk") end,
    },
    {
        "nmac427/guess-indent.nvim",
        opts = {},
        cmd = {
            "GuessIndent",
        },
    },
}

require("lazy").setup(merge_tables(common_plugins, is_vscode and vscode_plugins or neovim_plugins), lazyOpts)
