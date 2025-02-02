return {
    "ibhagwan/fzf-lua",
    config = function()
        local fzf = require 'fzf-lua'

        fzf.setup({ 'max-perf' })

        vim.keymap.set("n", "<leader>wd", fzf.diagnostics_workspace)
        vim.keymap.set("n", "<leader>d", fzf.diagnostics_document)
        vim.keymap.set("n", "<leader>ff", fzf.files)
        vim.keymap.set("n", "<leader>fs", fzf.live_grep_native)
        vim.keymap.set("n", "<leader>sw", fzf.grep_cword)
        vim.keymap.set("n", "<leader>gf", fzf.git_files)
        vim.keymap.set("n", "<leader>gs", fzf.git_status)
        vim.keymap.set("n", "<leader>sp", fzf.spell_suggest)
        vim.keymap.set("n", "<leader>ht", fzf.helptags)
        vim.keymap.set("n", "<leader>bb", fzf.buffers)
        vim.keymap.set("n", "<leader>hm", fzf.manpages)
        vim.keymap.set("n", "<leader>co", fzf.colorschemes)
    end,
}
