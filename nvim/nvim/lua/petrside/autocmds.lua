vim.api.nvim_create_user_command("Scratchpad", function()
  vim.cmd("vnew")
  vim.cmd("setlocal buftype=nofile")
  vim.cmd("setlocal bufhidden=delete")
  vim.cmd("setlocal noswapfile")
end, {})

vim.api.nvim_create_user_command("LspStop", function()
  local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
  for _, client in ipairs(clients) do
    client:stop(true)
  end
end, {})

vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("checkhealth vim.lsp")
end, {})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
  end
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("CustomLspAttach", { clear = true }),
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })
  end
})
