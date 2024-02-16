-- vim: ft=lua

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
        event = "VeryLazy",
        cmd = {
            "TSUpdateSync",
            "TSUPdate",
            "TSInstall",
        },
        config = function() require("config/nvim-treesitter") end,
    },
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
}

require("lazy").setup(merge_tables(common_plugins, is_vscode and vscode_plugins or neovim_plugins), lazyOpts)
