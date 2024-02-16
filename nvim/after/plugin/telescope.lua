require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
                ["<esc>"] = require('telescope.actions').close,
                ["<Space>t"] = require('telescope.actions').close,
            },
        }
    }
}

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

vim.keymap.set('n', '<leader>ff', function()
    require('telescope.builtin').find_files(themes.get_ivy({}))
end, { desc = "TS find files" })

vim.keymap.set('n', '<leader>lds', function()
    builtin.lsp_document_symbols(themes.get_ivy({}))
end , { desc = "TS lsp symbols" })

-- vim.keymap.set('n', '<leader>lws', function()
--     builtin.lsp_workspace_symbols(themes.get_ivy({}))
-- end , { desc = "TS workspace lsp symbols" })

vim.keymap.set('n', '<leader>fs', function()
    require('telescope.builtin').live_grep(themes.get_ivy({}))
end, { desc = "TS grep live" })

vim.keymap.set('n', '<leader>gf', function() builtin.git_files(themes.get_ivy({})) end, { desc = "TS git files" })

vim.keymap.set('n', '<leader>gs', function() builtin.git_status(themes.get_ivy({})) end, { desc = "TS git status" })

vim.keymap.set('n', '<leader>lr', function() builtin.lsp_references(themes.get_ivy({})) end, { desc = "TS lsp references" })

vim.keymap.set('n', '<leader>dw', function() builtin.diagnostics(themes.get_ivy({})) end, { desc = "TS workspace diagnostics" })

vim.keymap.set('n', '<leader>db', function()
    require('telescope.builtin').diagnostics(themes.get_ivy({bufnr=0}))
end, { noremap = true, silent = true, desc = "TS buffer diagnostics" })

vim.keymap.set('n', '<leader>sp', function()
    builtin.spell_suggest(themes.get_cursor({}))
end, { desc = "TS spell suggest" })

vim.keymap.set('n', '<leader>t', function()
    require('telescope.builtin').keymaps(themes.get_ivy({
        show_plug = false,
        modes = { "n" }
    }))
end, { desc = "TS search keymaps" })

vim.keymap.set('n', '<leader>bb', function()
    require('telescope.builtin').buffers(themes.get_ivy({
        show_plug = false,
        modes = { "n" }
    }))
end, { desc = "TS neovim show buffers" })

vim.keymap.set('n', '<leader>bf', function()
    require('telescope.builtin').current_buffer_fuzzy_find(themes.get_ivy({
        show_plug = false,
        modes = { "n" }
    }))
end, { desc = "TS current buffer fzf find" })

vim.keymap.set('n', '<leader>mp', function()
    require('telescope.builtin').man_pages(themes.get_ivy({
        show_plug = false,
        modes = { "n" }
    }))
end, { desc = "TS man pages" })

vim.keymap.set('n', '<leader>gc', function()
    require('telescope.builtin').git_commits(themes.get_ivy({
        show_plug = false,
        modes = { "n" }
    }))
end, { desc = "TS git commits" })
