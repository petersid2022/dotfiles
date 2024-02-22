vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "go to netrw" })
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace word" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "Ξ", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "Κ", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy to system clipboard" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ "n", "v" }, ".", "<nop>")

-- vim.keymap.set({"n", "v", "i"}, "<C-e>", "<C-y>", { desc = "Go one line up" })
-- vim.keymap.set({"n", "v", "i"}, "<C-s>", "<c-e>", { desc = "Go one line down" })

vim.keymap.set("n", "<leader>mab", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
vim.keymap.set("n", "<leade>mas", "<cmd>MarkdownPreviewStop<CR>", { desc = "Markdown Preview Stop" })
vim.keymap.set("n", "<leader>mat", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown Preview Toggle" })

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context()
end, { silent = true, desc = "treesitter go_to_context" })

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undotree" })

vim.keymap.set('n', '<leader>s', ':sp<bar>term<cr><c-w>J:resize10<cr>', { noremap = true, silent = true, desc = "Launch terminal" })
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
