local map = vim.keymap.set

-- Navigate windows
map("n", "<C-h>", "<C-w>h", { desc = "Goto left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Goto lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Goto upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Goto right window", remap = true })

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Navigate block
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected block down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected block up" })

-- Indent
map("n", ">", ">>", { desc = "Indent right" })
map("n", "<", "<<", { desc = "Indent left" })

map("v", ">", ">gv", { desc = "Indent right" })
map("v", "<", "<gv", { desc = "Indent left" })

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-[", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Yanking / Pasting
map("n", "y", "yy", { desc = "Yank" })

map("n", "<leader>y", '"+yy', { desc = "Yank to clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
