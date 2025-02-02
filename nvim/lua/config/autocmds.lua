vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("CustomLspAttach", { clear = true }),
    callback = function(event)
        local options = { buffer = event.buf, remap = false }
        local clients = vim.lsp.get_clients()
        for _, client in ipairs(clients) do
            vim.lsp.completion.enable(true, client.id, 0, { autotrigger = true })
        end
        vim.keymap.set("n", "K", vim.lsp.buf.hover, options)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
        vim.keymap.set("n", "I", vim.diagnostic.open_float, options)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, options)
        vim.keymap.set("n", "<leader>ll", vim.lsp.buf.references, options)
        vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, options)
        vim.keymap.set("n", "<leader>fb", function() vim.lsp.buf.format { async = true } end, options)
    end
})
