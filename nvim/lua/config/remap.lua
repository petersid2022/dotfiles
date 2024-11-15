local utils = require "config.utils"

-- Quickfix / Location list
vim.keymap.set("n", "<C-n>", utils.list_next)
vim.keymap.set("n", "<C-p>", utils.list_prev)
vim.keymap.set("n", "<C-q>", [[:cexpr []<cr>]])
vim.keymap.set("n", "<leader>q", "<cmd>copen<cr>")

-- Native snippet / completion
vim.keymap.set("s", "<BS>", "<C-o>s")
vim.keymap.set("s", "<Tab>", [[:vim.snippet.jump(1)]])
vim.keymap.set("s", "<S-Tab>", [[:vim.snippet.jump(-1)]])
vim.keymap.set("i", "<C-b>", "<C-x><C-n>")
vim.keymap.set("i", "<C-f>", "<C-x><C-f>")
vim.keymap.set("i", "<C-l>", "<C-x><C-o>")

-- Tab / Pane management
vim.keymap.set("n", "<C-x>", "<C-W>5>")
vim.keymap.set("n", "<C-z>", "<C-W>5<")
vim.keymap.set("n", "\\", "<cmd>tabnext<cr>")
vim.keymap.set("n", "|", "<cmd>tabprevious<cr>")

-- Misc
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>")
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zzzv")
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zzzv")
vim.keymap.set({ "n", "i" }, "<M-s>", utils.toggle_language)
vim.keymap.set("n", "<leader>md", "<cmd>%!prettier --parser markdown<cr>")
vim.keymap.set("n", "<leader>`", "<cmd>sp<bar>term<cr><c-w>J<cmd>resize10<cr>i")
vim.keymap.set("n", "<leader>re", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])
