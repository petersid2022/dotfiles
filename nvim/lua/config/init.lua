require "config.remap"
require "config.set"
require "config.autocmds"
require "config.utils"

vim.cmd "colorscheme sorbet"

-- vim.opt.guicursor = 'n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor,a:blinkon100'
-- vim.api.nvim_set_hl(0, "Cursor", { fg = '#cc9900', bg = '#339966' })
-- vim.api.nvim_set_hl(0, "CursorReset", { fg = 'white', bg = 'white' })
vim.api.nvim_set_hl(0, 'yank_highlight', { bg = '#4a4a4a' })
vim.api.nvim_set_hl(0, 'Visual', { bg = '#4a4a4a' })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#D4D4D4', bg = '#2b2b2b' })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = 'NONE', bg = '#3c3c3c', bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = '#808080', bg = '#2b2b2b', strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = '#569CD6', bg = '#2b2b2b', bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpItemAbbrMatch' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = '#9CDCFE', bg = '#2b2b2b' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = '#C586C0', bg = '#2b2b2b' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = '#D4D4D4', bg = '#2b2b2b' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'NetrwDir', { fg = '#569CD6', bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'NetrwList', { fg = '#D4D4D4', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NetrwExec', { fg = '#C586C0', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NetrwSymLink', { fg = '#9CDCFE', bg = 'NONE', italic = true })

vim.api.nvim_create_user_command("Scratchpad", function()
  vim.cmd("tabedit")
  vim.cmd("setlocal buftype=nofile")
  vim.cmd("setlocal bufhidden=hide")
  vim.cmd("setlocal noswapfile")
end, {})
