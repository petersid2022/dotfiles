require "config.lazy"
require "config.autocmds"
require "config.options"
require "config.utils"
require "config.remap"

vim.api.nvim_create_user_command("Scratchpad", function()
    vim.cmd("vnew")
    vim.cmd("setlocal buftype=nofile")
    vim.cmd("setlocal bufhidden=delete")
    vim.cmd("setlocal noswapfile")
end, {})

vim.cmd([[colorscheme retrobox]])

vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
