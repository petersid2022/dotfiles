require "config.set"
require "config.lazy"
require "config.remap"
require "config.utils"
require "config.autocmds"

vim.cmd "colorscheme sorbet"

vim.api.nvim_set_hl(0, 'yank_highlight', { bg = '#4a4a4a' })
vim.api.nvim_set_hl(0, 'Visual', { bg = '#4a4a4a' })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#D4D4D4', bg = '#2b2b2b' })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = 'NONE', bg = '#3c3c3c', bold = true })
vim.api.nvim_set_hl(0, 'NetrwDir', { fg = '#569CD6', bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'NetrwList', { fg = '#D4D4D4', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NetrwExec', { fg = '#C586C0', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NetrwSymLink', { fg = '#9CDCFE', bg = 'NONE', italic = true })

vim.api.nvim_create_user_command("Scratchpad", function()
  vim.cmd("tabedit")
  vim.cmd("setlocal buftype=nofile")
  vim.cmd("setlocal bufhidden=delete")
  vim.cmd("setlocal noswapfile")
end, {})
