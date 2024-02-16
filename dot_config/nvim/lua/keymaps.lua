-- vim: ft=lua

local opts = {
    noremap = true,
    silent = true,
}

local keymap = vim.api.nvim_set_keymap

-- Modes
-- normal_mode = "n",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- insert_mode = "i",
-- command_mode = "c",
-- terminal_mode = "t",

-- convert ; to : and vice versa
keymap("n", ";", ":", opts)
keymap("n", ":", ";", opts)
