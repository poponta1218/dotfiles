-- vim: set ft=lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

function merge_tables(t1, t2)
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
        notify = false,
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
        dependencies = {
            {
                "nvim-tree/nvim-web-devicons",
                opt = true,
            },
        },
        event = "VimEnter",
        config = function() require("config/lualine") end,
    },
    {
        "petertriho/nvim-scrollbar",
        dependencies = {
            {
                "kevinhwang91/nvim-hlslens",
            },
            {
                "lewis6991/gitsigns.nvim",
            },
        },
        event = "VimEnter",
        config = function() require("config/nvim-scrollbar") end,
    },
    -- Filer
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = {
            {
                "nvim-tree/nvim-web-devicons",
            },
        },
        cmd = {
            "Oil",
        },
        config = function() require("config/oil-nvim") end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
            },
            { -- not strictly required, but recommended
                "nvim-tree/nvim-web-devicons",
            },
            {
                "MunifTanjim/nui.nvim",
            },
            { -- Optional image support in preview window: See `# Preview Mode` for more information
                "3rd/image.nvim",
            },
            {
                "s1n7ax/nvim-window-picker",
                version = "2.*",
                config = function() require("config/nvim-window-picker") end,
            },
        },
        event = "VimEnter",
        config = function() require("config/neo-tree") end,
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
        config = function() require("config/nvim-treesitter") end,
    },
    -- Language Server Protocol
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "nvimdev/lspsaga.nvim",
                dependencies = {
                    {
                        {
                            "nvim-treesitter/nvim-treesitter",
                        },
                        {
                            "nvim-tree/nvim-web-devicons",
                        },
                    },
                },
                config = function() require("config/lspsaga") end,
            },
        },
        event = "VimEnter",
        config = function() require("config/lspconfig") end,
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
            },
        },
        event = "VeryLazy",
        config = function() require("config/none-ls") end,
    },
    -- Popup UI
    {
        "folke/noice.nvim",
        dependencies = {
            {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
            },
            {
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            },
        },
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
    },
    {
        "j-hui/fidget.nvim",
        event = "VeryLazy",
        opts = {},
        config = function() require("config/fidget") end,
    },
    -- Auto Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
            },
        },
        event = "InsertEnter",
        config = function() require("config/nvim-cmp") end,
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
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "VimEnter",
        config = function() require("config/indent-blankline") end,
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = {
            {
                "junegunn/fzf",
                build = "./install --bin",
                cmd = {
                    "FzfLua",
                },
            },
        },
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
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function() require("config/gitsigns") end,
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
        "norcalli/nvim-colorizer.lua",
        event = "VimEnter",
        config = function() require("colorizer").setup() end,
    },
}

require("lazy").setup(merge_tables(common_plugins, is_vscode and vscode_plugins or neovim_plugins), lazyOpts)
