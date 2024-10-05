local M = {}

function M.toggle_language()
  local mode = vim.api.nvim_get_mode()
  if mode.mode ~= "n" then
    local key = vim.api.nvim_replace_termcodes("<C-^>", true, false, true)
    vim.api.nvim_feedkeys(key, 'i', false)
  end

  local current_spelllang = vim.opt.spelllang:get()[1]
  if current_spelllang == "el" then
    vim.opt.spelllang = "en"
    vim.opt.keymap = ""
  else
    vim.opt.spelllang = "el"
    vim.opt.keymap = "greek_utf-8"
  end
end

function M.list_next()
  local is_loclist = vim.fn.getloclist(0, { title = 0 }).title ~= ''
  if is_loclist then
    local loc_idx = vim.fn.getloclist(0, { idx = 0 }).idx
    local loc_list = vim.fn.getloclist(0)
    if loc_idx >= #loc_list then
      pcall(vim.cmd, 'lfirst')
    else
      pcall(vim.cmd, 'lnext')
    end
  else
    local qf_list = vim.fn.getqflist()
    local qf_idx = vim.fn.getqflist({ idx = 0 }).idx
    if qf_idx >= #qf_list then
      pcall(vim.cmd, 'cfirst')
    else
      pcall(vim.cmd, 'cnext')
    end
  end
end

function M.list_prev()
  local is_loclist = vim.fn.getloclist(0, { title = 0 }).title ~= ''
  if is_loclist then
    local loc_idx = vim.fn.getloclist(0, { idx = 0 }).idx
    if loc_idx <= 1 then
      pcall(vim.cmd, 'llast')
    else
      pcall(vim.cmd, 'lprev')
    end
  else
    local qf_idx = vim.fn.getqflist({ idx = 0 }).idx
    if qf_idx <= 1 then
      pcall(vim.cmd, 'clast')
    else
      pcall(vim.cmd, 'cprev')
    end
  end
end

return M
