vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<leader>C", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.g.copilot_filetypes = {
    ["*"] = false,
}
