local M = {}

function M.vimgrep()
  local ok, input = pcall(vim.fn.input, 'vimgrep > ')
  local vimgrep
  if ok then
    vimgrep = 'vimgrep /' .. input .. '/%'
    pcall(vim.cmd, vimgrep)
    vim.cmd("copen")
  end
end

function M.clear_qf()
  vim.notify("Clearing Quickfix list", nil, nil)
  vim.cmd("call setqflist([], 'r')")
end

function M.toggle_netrw()
  local netrw_buf = nil
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
    if filetype == 'netrw' then
      netrw_buf = buf
      break
    end
  end
  if netrw_buf then
    vim.api.nvim_buf_delete(netrw_buf, { force = true })
  else
    local current_file_path = vim.fn.expand('%:p:h')
    vim.cmd('Lexplore ' .. current_file_path)
  end
end

function M.toggle_language()
  local current_spelllang = vim.opt.spelllang:get()[1]
  if current_spelllang == "el" then
    vim.opt.spelllang = "en"
    vim.opt.keymap = ""
  else
    vim.opt.spelllang = "el"
    vim.opt.keymap = "greek_utf-8"
  end
  vim.notify("Language set to " .. vim.opt.spelllang:get()[1], nil, nil)
end

function M.toggle_quickfix()
  local quickfix_open = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      quickfix_open = true
      break
    end
  end
  if quickfix_open then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
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

function M.toggle_file_qf()
  local current_file = vim.api.nvim_buf_get_name(0)
  local config_path = vim.fn.stdpath "config"
  local relative_path = current_file:gsub(config_path, ""):sub(2)
  local qflist = vim.fn.getqflist()

  local exists = false
  for _, item in ipairs(qflist) do
    if item.text == relative_path then
      exists = true
      break
    end
  end

  if exists then
    local new_qflist = {}
    for _, item in ipairs(qflist) do
      if item.text ~= relative_path then
        table.insert(new_qflist, item)
      end
    end
    vim.fn.setqflist(new_qflist, 'r')
    print("Removed current file from quickfix list")
  else
    local item = {
      bufnr = vim.api.nvim_get_current_buf(),
      lnum = vim.fn.line('.'),
      col = vim.fn.col('.'),
      text = relative_path
    }
    vim.fn.setqflist({ item }, 'a')
    print("Added current file to quickfix list")
  end
end

return M
