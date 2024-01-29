vim.scriptencoding = "utf-8"

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})

-- -- Don't auto commenting new lines
-- autocmd("BufEnter", {
--     pattern = "*",
--     command = "set fo-=c fo-=r fo-=o",
-- })

-- Restore cursor location when file is opened
-- autocmd({
--     "BufReadPost",
-- }, {
--     pattern = {
--         "*"
--     },
--     callback = function() vim.api.nvim_exec("silent! normal! g`\"zv", false) end,
-- })

autocmd("TextYankPost", {
    group = augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank {
            higroup = "IncSearch",
            timeout = 1000,
        }
    end,
})
