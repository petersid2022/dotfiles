vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>")
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


-- skip to next error / go back to previous and the center
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- jump to occurence when searching
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


--vim.keymap.set("n", "<leader>1", "<cmd>BufferGoto 1<CR>")
--
--vim.keymap.set("n", "<leader>q", "<cmd>BufferClose<CR>")
--vim.keymap.set("n", "<leader>p", "<cmd>BufferPin<CR>")
--
--vim.keymap.set("n", "<leader><Tab>", "<cmd>BufferNext<CR>")

-- Toggle the file tree view with <Leader>e
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- telescope find text
vim.keymap.set("n", "<leader>fs", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
