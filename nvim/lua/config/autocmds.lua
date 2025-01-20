vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("CustomLspAttach", { clear = true }),
  callback = function(event)
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
      vim.lsp.completion.enable(true, client.id, 0, { autotrigger = true })
      vim.keymap.set("n", "<leader>hh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end)
    end

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, remap = false })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, remap = false })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, remap = false })
    vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, { buffer = event.buf, remap = false })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = event.buf, remap = false })
    vim.keymap.set("n", "<leader>ll", vim.lsp.buf.references, { buffer = event.buf, remap = false })
    vim.keymap.set("n", "I", vim.diagnostic.open_float, { buffer = event.buf, remap = false })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { buffer = event.buf, remap = false })
    vim.keymap.set("n", "<leader>wd", vim.diagnostic.setqflist, { buffer = event.buf, remap = false })
    vim.keymap.set("n", "<leader>fb", function()
      vim.lsp.buf.format { async = true }
    end, { buffer = event.buf, remap = false })
  end
})
