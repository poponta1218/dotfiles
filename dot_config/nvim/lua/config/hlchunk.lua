-- vim: set ft=lua:
-- local function update_blank()
--     local shiftwidth = vim.bo.shiftwidth
--     local tabstop = vim.bo.tabstop
--
--     local enable = vim.bo.expandtab
--     local chars = ""
--     if enable == true then
--         if shiftwidth == 0 then
--             chars = string.rep("·", tabstop)
--         elseif shiftwidth >= 1 then
--             chars = string.rep("·", shiftwidth)
--         end
--     else
--         chars = "→"
--     end
--     return {
--         enable = true,
--         chars = {
--             chars,
--         },
--     }
-- end
-- local blank_table = update_blank()
--
require("hlchunk").setup({
    chunk = {
        enable = true,
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
    },
    indent = {
        enable = false,
        use_treesitter = true,
        ahead_lines = 10,
    },
    line_num = {
        enable = true,
    },
    blank = {
        enable = false,
        chars = {
            "·",
        },
    },
})

-- vim.api.nvim_create_autocmd({
--     "BufEnter",
-- }, {
--     pattern = "*",
--     callback = function()
--         blank_table = update_blank()
--         require("hlchunk").setup({
--             blank = blank_table,
--         })
--     end,
-- })

-- vim.api.nvim_create_autocmd({
--     "OptionSet",
-- }, {
--     pattern = {
--         "shiftwidth",
--         "tabstop",
--         "expandtab",
--     },
--     callback = function()
--         blank_table = update_blank()
--         require("hlchunk").setup({
--             blank = blank_table,
--         })
--     end,
-- })
