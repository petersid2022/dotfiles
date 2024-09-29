local M = {}

function M.netrw_open_in_new_tab()
  local filename = vim.fn.expand("<cfile>")
  local dir = vim.fn.getcwd()
  if filename ~= "" then
    vim.cmd("tabedit " .. dir .. "/" .. filename)
  end
end

function M.netrw_create_file()
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
  local mode = vim.api.nvim_get_mode()
  if mode.mode == "i" then
    vim.keymap.set("i", "<c-s>", "<c-^>")
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

function M.clear_qf()
  local qf_list = vim.fn.getqflist()
  if #qf_list == 0 then
    return
  end
  vim.cmd("call setqflist([], 'r')")
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

return M
