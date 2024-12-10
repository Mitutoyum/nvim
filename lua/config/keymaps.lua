local map = vim.keymap.set

-- Navigate windows
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize windows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate block
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })

-- Indent
map("n", ">", ">>")
map("n", "<", "<<")

map("v", ">", ">gv")
map("v", "<", "<gv")
