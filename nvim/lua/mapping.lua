require("config.lazy")

-- normalMovement remap
vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "l", "k")
vim.keymap.set("n", ";", "l")

-- visualMovement remap
vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "l", "k")
vim.keymap.set("v", ";", "l")

-- insertMovement remap
vim.keymap.set("i", "<C-j>", "<Left>")
vim.keymap.set("i", "<C-k>", "<C-o>j")
vim.keymap.set("i", "<C-l>", "<C-o>k")
vim.keymap.set("i", "<C-;>", "<Right>")

-- esc remap
vim.keymap.set("v", "<leader>vv", "<Esc>", { desc = "Exit visual mode" })
vim.keymap.set("i", "<leader>vv", "<Esc>", { desc = "Exit insert mode" })

-- copy map
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to \"+y" })

-- centerScreen map
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- bufferNavigation map
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- splitting/resizing map
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window Vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Decrease window width" })

-- moveLines up/down
vim.keymap.set("n", "<A-k>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-l>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-l>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })


-- visualModeIndenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- fileNavigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find", { desc = "Find file" })

-- quickConfigEdit
vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>g", ":e ~/chickenScratch/.identity/identity.txt<CR>", { desc = "Identity Reminder" })

-- copyFullFilePath
vim.keymap.set("n", "<leader>pa", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    print("file: ", path)
end)
