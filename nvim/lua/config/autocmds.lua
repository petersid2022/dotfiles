---@diagnostic disable: undefined-field
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup "YankHighlight",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup "terminal",
  callback = function()
    vim.cmd [[set norelativenumber]]
    vim.cmd [[set nonumber]]
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup "netrw",
  pattern = "netrw",
  callback = function(event)
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "<c-l>")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "qb")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "qf")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "qF")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "qL")
    vim.keymap.set("n", "q", function()
      vim.api.nvim_buf_delete(event.buf, { force = true })
    end, { buffer = event.buf, desc = "Neovim: Close Netrw", silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "help",
    "lspinfo",
    "notify",
    "qf",
    "startuptime",
    "undotree",
    "checkhealth",
    "gitsigns.blame",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, remap = true, silent = true })
  end,
})
