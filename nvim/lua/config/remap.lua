local map = function(mode, keys, func, desc, silent)
    vim.keymap.set(mode, keys, func, { desc = desc, silent = silent })
end

map("n", "<leader>pv", vim.cmd.Ex, "Neovim: Open Netrw", true)

map({ "n", "v" }, "<leader>y", [["+y]], "Neovim: Copy to system clipboard", true)
map({ "n", "v" }, "<leader>Y", [["+Y]], "Neovim: Copy to system clipboard", true)

map({ 'n', 'v' }, 'x', '"_x', nil, true)

map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]], "Neovim: Replace word [Regex]",
    false)

map("v", "J", ":m '>+1<CR>gv=gv", nil, true)
map("v", "K", ":m '<-2<CR>gv=gv", nil, true)
map("v", "Ξ", ":m '>+1<CR>gv=gv", nil, true)
map("v", "Κ", ":m '<-2<CR>gv=gv", nil, true)

map("n", "<C-d>", "<C-d>zz", nil, true)
map("n", "<C-u>", "<C-u>zz", nil, true)

-- map({ "n", "v" }, ".", "<nop>", nil, true)
map({ "n", "v" }, "<C-m>", "<nop>", nil, true)

map('n', '<leader>q', ':sp<bar>term<cr><c-w>J:resize10<cr>', "Neovim: Launch terminal as a split", false)

map('t', '<esc><esc>', '<c-\\><c-n>', nil, false)

-- map({ 'n', 'v' }, "<leader>ot", "<cmd>ObsidianToday<cr>",
-- 	{ silent = true, desc = "Obsidian: Open (or create) a new daily note" })
--
-- map({ 'n', 'v' }, "<leader>of", "<cmd>ObsidianSearch<cr>",
-- 	{ silent = true, desc = "Obsidian: Search for (or create) notes in the vault" })
--
-- map({ 'n', 'v' }, "<leader>ol", "<cmd>ObsidianLinks<cr>",
-- 	{ silent = true, desc = "Obsidian: Collect all links within the current buffer" })
--
-- map({ 'n', 'v' }, "<leader>of", "<cmd>ObsidianQuickSwitch<cr>",
-- 	{ silent = true, desc = "Obsidian: Quickly switch to (or open) another note in the vault" })
--
-- map({ 'n', 'v' }, "<leader>op",
-- 	function()
-- 		local current_file = vim.fn.expand('%:t')
-- 		local cmd = string.format("!xdg-open \"obsidian://open?vault=work&file=%s\"", current_file)
-- 		vim.cmd(cmd)
-- 	end, { silent = true, desc = "Obsidian: Open current file with obsidian" })

for i = 1, 5 do
    local remap = string.format("<A-%s>", i)
    local navigate = string.format("<esc>%sgt", i)
    local description = "Neovim: Move to tab " .. string.format("%s", i)
    map({ 'n', 'v', 'i' }, remap, navigate, description, false)
end

map('n', '<C-h>', '<C-w><C-h>', 'Neovim: Move focus to the left window', false)
map('n', '<C-l>', '<C-w><C-l>', 'Neovim: Move focus to the right window', false)
map('n', '<C-j>', '<C-w><C-j>', 'Neovim: Move focus to the lower window', false)
map('n', '<C-k>', '<C-w><C-k>', 'Neovim: Move focus to the upper window', false)

map('n', '<leader>mat', '<cmd>MarkdownPreviewToggle<cr>', 'Toggle Markdown Preview', false)
map('n', '<leader>mas', '<cmd>MarkdownPreviewStop<cr>', 'Stop Markdown Preview', false)
map('n', '<leader>max', '<cmd>MarkdownPreview<cr>', 'Start Markdown Preview', false)
