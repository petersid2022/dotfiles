local builtin = require('telescope.builtin')
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
--
-- vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>k", [["_dP]])
--
vim.keymap.set("n", "[c", function()
    require("treesitter-context").go_to_context()
end, { silent = true })

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>")
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")

function CycleVerticalSplits()
    local current_win = vim.fn.winnr()
    local total_wins = vim.fn.winnr('$')

    if current_win < total_wins then
        vim.cmd('wincmd j')
    else
        vim.cmd('wincmd k')
    end
end

vim.api.nvim_set_keymap('n', '<C-j>', ':lua CycleVerticalSplits()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':lua CycleVerticalSplits()<CR>', { noremap = true, silent = true })

-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
