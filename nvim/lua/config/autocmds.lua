local utils = require "config.utils"

local set = vim.opt_local

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup "YankHighlight",
  callback = function()
    vim.highlight.on_yank { higroup = "yank_highlight" }
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup "terminal",
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
    vim.bo.filetype = "terminal"
  end
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup "netrw",
  pattern = "netrw",
  callback = function(event)
    local function safe_del_keymaps(buf, mode, keymaps)
      for _, key in ipairs(keymaps) do
        pcall(vim.api.nvim_buf_del_keymap, buf, mode, key)
      end
    end

    local keymaps_to_remove = { "<c-l>", "v", "t", "h", "o", "qb", "qf", "qF", "qL", "%" }
    safe_del_keymaps(event.buf, "n", keymaps_to_remove)

    set.nu = true
    set.bufhidden = "hide"
    set.buftype = "nofile"

    vim.keymap.set("n", "%", utils.netrw_create_file, { buffer = event.buf, silent = true })
    vim.keymap.set("n", "<c-t>", utils.netrw_open_in_new_tab, { buffer = event.buf, silent = true })
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, remap = true, silent = true })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "qf",
    "help",
    "lspinfo",
    "man",
    "undotree",
    "checkhealth"
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, remap = true, silent = true })
  end
})
