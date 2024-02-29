vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Netrw", silent = true })
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word using Regex" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "Ξ", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "Κ", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy using the System Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>υ", [["+y]], { desc = "Copy using the System Clipboard" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ "n", "v" }, ".", "<nop>")

vim.keymap.set('n', '<leader>s', ':sp<bar>term<cr><c-w>J:resize10<cr>',
	{ noremap = true, silent = true, desc = "Launch terminal" })
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { noremap = true, silent = true })

vim.keymap.set({ 'n', 'i', 'v' }, "<leader>ot", "<cmd>ObsidianToday<cr>",
	{ silent = true, desc = "Obsidian: Open (or create) a new daily note" })
vim.keymap.set({ 'n', 'i', 'v' }, "<leader>of", "<cmd>ObsidianSearch<cr>",
	{ silent = true, desc = "Obsidian: Search for (or create) notes in the vault" })
vim.keymap.set({ 'n', 'i', 'v' }, "<leader>ol", "<cmd>ObsidianLinks<cr>",
	{ silent = true, desc = "Obsidian: Collect all links within the current buffer" })
vim.keymap.set({ 'n', 'i', 'v' }, "<leader>oz", "<cmd>ObsidianQuickSwitch<cr>",
	{ silent = true, desc = "Obsidian: Quickly switch to (or open) another note in the vault" })

-- Super useful this
vim.keymap.set({ 'n', 'i', 'v' }, "<leader>op",
	function()
		local current_file = vim.fn.expand('%:t')
		local cmd = string.format("!xdg-open \"obsidian://open?vault=work&file=%s\"", current_file)
		vim.cmd(cmd)
	end, { silent = true, desc = "Obsidian: Open current file with obsidian" })

for i = 1, 5 do
	local remap = string.format("<A-%s>", i)
	local navigate = string.format("<esc>%sgt", i)
	local description = "Move to tab " .. string.format("%s", i)
	vim.keymap.set({ 'n', 'v', 'i' }, remap, navigate,
		{ noremap = true, silent = true, desc = description })
end
