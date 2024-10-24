-- vim: set ft=lua:
function merge_tables(t1, t2)
    local merged = {}
    for key, val in pairs(t1) do
        merged[key] = val
    end
    for key, val in pairs(t2) do
        merged[key] = val
    end
    return merged
end

function apply_options(options)
    for key, val in pairs(options) do
        vim.opt[key] = val
    end
end

local common_opts = {
    encoding = "utf-8",
    fileencoding = "utf-8",
    title = true,
    backup = false,
    swapfile = false,
    shell = "zsh",
    expandtab = true,
    smartindent = true,
    shiftwidth = 2,
    tabstop = 2,
    splitbelow = true,
    splitright = true,
}

local vscode_opts = {}

local neovim_opts = {
    number = true,
    numberwidth = 4,
    relativenumber = true,
    scrolloff = 8,
    showmatch = true,
    matchtime = 1,
}

vim.opt.shortmess:append("c")

if vim.g.vscode then
    apply_options(merge_tables(common_opts, vscode_opts))
else
    apply_options(merge_tables(common_opts, neovim_opts))
end
