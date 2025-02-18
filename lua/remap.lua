vim.g.mapleader = " "

-- File explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center the screen when scrolling up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over the current selection without yanking the replaced text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard in normal or visual mode
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Delete without yanking the deleted text
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Yank entire line to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Format the current file using an external tool
vim.keymap.set("n", "<leader>f", function()
    local filetype = vim.bo.filetype

    if filetype == "python" then
        vim.cmd("silent !black --quiet %")
    else
        print("No formatter available for this file type: ", filetype)
    end

    vim.cmd("edit")
end)
