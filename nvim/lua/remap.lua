vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Neovim: Open Netrw", silent = true })

vim.keymap.set({ 'n', 'v' }, 'x', '"_x', { desc = "" })

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Neovim: Replace word using Regex" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "" })

vim.keymap.set("v", "Ξ", ":m '>+1<CR>gv=gv", { silent = true, desc = "" })

vim.keymap.set("v", "Κ", ":m '<-2<CR>gv=gv", { silent = true, desc = "" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true, desc = "" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, desc = "" })

vim.keymap.set({ "n", "v" }, ".", "<nop>", { desc = "" })

vim.keymap.set({ "n", "v" }, "<C-m>", "<nop>", { desc = "" })

vim.keymap.set('n', '<leader>s', ':sp<bar>term<cr><c-w>J:resize10<cr>',
	{ noremap = true, silent = true, desc = "Neovim: Launch terminal as a split" })

vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { noremap = true, silent = true, desc = "" })

-- vim.keymap.set({ 'n', 'v' }, "<leader>ot", "<cmd>ObsidianToday<cr>",
-- 	{ silent = true, desc = "Obsidian: Open (or create) a new daily note" })
--
-- vim.keymap.set({ 'n', 'v' }, "<leader>of", "<cmd>ObsidianSearch<cr>",
-- 	{ silent = true, desc = "Obsidian: Search for (or create) notes in the vault" })
--
-- vim.keymap.set({ 'n', 'v' }, "<leader>ol", "<cmd>ObsidianLinks<cr>",
-- 	{ silent = true, desc = "Obsidian: Collect all links within the current buffer" })
--
-- vim.keymap.set({ 'n', 'v' }, "<leader>of", "<cmd>ObsidianQuickSwitch<cr>",
-- 	{ silent = true, desc = "Obsidian: Quickly switch to (or open) another note in the vault" })
--
-- vim.keymap.set({ 'n', 'v' }, "<leader>op",
-- 	function()
-- 		local current_file = vim.fn.expand('%:t')
-- 		local cmd = string.format("!xdg-open \"obsidian://open?vault=work&file=%s\"", current_file)
-- 		vim.cmd(cmd)
-- 	end, { silent = true, desc = "Obsidian: Open current file with obsidian" })

for i = 1, 5 do
	local remap = string.format("<A-%s>", i)
	local navigate = string.format("<esc>%sgt", i)
	local description = "Neovim: Move to tab " .. string.format("%s", i)
	vim.keymap.set({ 'n', 'v', 'i' }, remap, navigate,
		{ noremap = true, silent = true, desc = description })
end

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Neovim: Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Neovim: Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Neovim: Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Neovim: Move focus to the upper window' })

vim.keymap.set('n', "<leader>gg", vim.cmd.Git, { desc = 'Vim Fugitive: Toggle window' })
