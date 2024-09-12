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
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "<c-l>")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "v")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "t")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "h")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "qb")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "qf")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "qF")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "qL")
    pcall(vim.api.nvim_buf_del_keymap, event.buf, "n", "%")

    vim.api.nvim_command('setlocal buftype=nofile')
    vim.api.nvim_command('setlocal bufhidden=wipe')

    vim.keymap.set("n", "%", function()
      local netrw_cwd = vim.fn.getcwd()
      local ok, new_file_name = pcall(vim.fn.input, 'New File: ', netrw_cwd .. '/', 'file')
      if ok and new_file_name ~= '' then
        local netrw_win = vim.api.nvim_get_current_win()
        local edit_file = 'edit ' .. new_file_name
        pcall(vim.cmd, 'wincmd p')
        pcall(vim.cmd, edit_file)
        pcall(vim.api.nvim_set_current_win, netrw_win)
        pcall(vim.cmd, 'wincmd w')
      end
    end, { buffer = event.buf, silent = true })

    vim.keymap.set("n", "q", function()
      vim.api.nvim_buf_delete(event.buf, { force = true })
    end, { buffer = event.buf, silent = true })

    vim.keymap.set("n", "<c-t>", function()
      local filename = vim.fn.expand("<cfile>")
      local dir = vim.fn.getcwd()
      if filename ~= "" then
        vim.cmd("tabedit " .. dir .. "/" .. filename)
      end
    end, { buffer = event.buf, silent = true })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "qf",
    "help",
    "lspinfo",
    "man",
    "notify",
    "startuptime",
    "undotree",
    "checkhealth"
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, remap = true, silent = true })
  end
})
