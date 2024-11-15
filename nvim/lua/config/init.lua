require "config.lazy"
require "config.autocmds"
require "config.set"
require "config.utils"
require "config.remap"

vim.api.nvim_create_user_command("Scratchpad", function()
  vim.cmd("tabedit")
  vim.cmd("setlocal buftype=nofile")
  vim.cmd("setlocal bufhidden=delete")
  vim.cmd("setlocal noswapfile")
end, {})
