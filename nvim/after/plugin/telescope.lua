local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

vim.keymap.set('n', '<leader>ff', function()
    require('telescope.builtin').find_files(themes.get_dropdown({}))
end, { desc = "telescope find files" })

vim.keymap.set('n', '<leader>ls', function()
    builtin.lsp_document_symbols(themes.get_dropdown({}))
end , { desc = "telescope lsp_symbols" })

vim.keymap.set('n', '<leader>fs', function()
    require('telescope.builtin').live_grep(themes.get_dropdown({}))
end, { desc = "telescope grep live" })

vim.keymap.set('n', '<leader>gf', function() builtin.git_files(themes.get_dropdown({})) end, { desc = "telescope git files" })

vim.keymap.set('n', '<leader>gs', function() builtin.git_status(themes.get_dropdown({})) end, { desc = "telescope git status" })

vim.keymap.set('n', '<leader>lr', function() builtin.lsp_references(themes.get_dropdown({})) end, { desc = "telescope lsp_references" })

vim.keymap.set('n', '<leader>dw', function() builtin.diagnostics(themes.get_dropdown({})) end, { desc = "telescope workspace diagnostics" })

vim.keymap.set('n', '<leader>db', function()
    require('telescope.builtin').diagnostics(themes.get_dropdown({bufnr=0}))
end, { noremap = true, silent = true, desc = "telescope buffer diagnostics" })

vim.keymap.set('n', '<leader>sp', function()
    builtin.spell_suggest(themes.get_cursor({}))
end, { desc = "telescope spell suggest" })

vim.keymap.set('n', '<leader>t', function()
    require('telescope.builtin').keymaps(themes.get_dropdown({
        show_plug = false,
        modes = { "n" }
    }))
end, { desc = "telescope search keymaps" })
