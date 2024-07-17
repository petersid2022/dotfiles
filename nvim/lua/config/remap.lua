local function toggle_netrw()
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

local function toggle_calendar()
  local cal_buf = nil
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
    if filetype == 'calendar' then
      cal_buf = buf
      break
    end
  end

  if cal_buf then
    vim.api.nvim_buf_delete(cal_buf, { force = true })
  else
    vim.cmd('Calendar')
  end
end

local function toggle_quickfix()
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

local function quickfix_next()
  local qf_list = vim.fn.getqflist()
  local qf_idx = vim.fn.getqflist({ idx = 0 }).idx
  if qf_idx >= #qf_list then
    vim.cmd('cfirst')
  else
    vim.cmd('cnext')
  end
end

local function quickfix_prev()
  local qf_idx = vim.fn.getqflist({ idx = 0 }).idx
  if qf_idx <= 1 then
    vim.cmd('clast')
  else
    vim.cmd('cprev')
  end
end

vim.keymap.set("n", "<C-n>", quickfix_next, { desc = "Neovim: Go to next Quickfix item", silent = true })
vim.keymap.set("n", "<C-p>", quickfix_prev, { desc = "Neovim: Go to previous Quickfix item", silent = true })
vim.keymap.set("n", "<leader>q", toggle_quickfix, { desc = "Neovim: Open the Quickfix list", silent = true })
vim.keymap.set("n", '<leader><tab>', toggle_calendar, { desc = "Neovim: Open Calendar", silent = true })
vim.keymap.set("n", '<leader>e', toggle_netrw, { desc = "Neovim: Open Netrw", silent = true })
vim.keymap.set("n", '<leader>o', ':tabedit %:p:h<CR>', { desc = "Neovim: Open Netrw in a new tab", silent = true })
vim.keymap.set("n", "gt", "<nop>", { desc = nil, silent = true })
vim.keymap.set("", "`", "<nop>", { desc = nil, silent = false })
vim.keymap.set("", "<D-F1>", "<nop>", { desc = nil, silent = true })
vim.keymap.set("n", "n", "nzzzv", { desc = nil, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = nil, silent = true })
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "Terminal: Exit to Normal mode", silent = false })
vim.keymap.set("n", "<leader>`", "<cmd>sp<bar>term<cr><c-w>J<cmd>resize10<cr>i",
  { desc = "Neovim: Launch terminal as a split", silent = true })
vim.keymap.set("n", "<leader>re", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]],
  { desc = "Regex: Replace word", silent = false })
vim.keymap.set("", "<leader>y", [["+y]], { desc = "Neovim: Copy to system clipboard", silent = true })
vim.keymap.set("", "x", '"_x', { desc = "Neovim: Delete character without yanking", silent = true })
vim.keymap.set("x", "p", 'p<cmd>let @+=@0<CR><cmd>let @"=@0<CR>',
  { desc = "Visual Mode: Paste and keep yanked text", silent = true })
vim.keymap.set("n", "<leader>gr", function()
  vim.cmd('echo "Setting language to Greek"')
  vim.cmd [[set spelllang=el]]
  vim.cmd [[set keymap=greek_utf-8]]
end, { desc = "Neovim: Set spellchecking language to Greek", silent = false })
vim.keymap.set("n", "<leader>ag", function()
  vim.cmd('echo "Setting language to English"')
  vim.cmd [[set spelllang=en]]
  vim.cmd [[set keymap=""]]
end, { desc = "Neovim: Set spellchecking language to English", silent = false })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Visual Mode: Move selection down", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Visual Mode: Move selection up", silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Neovim: Scroll down and center", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Neovim: Scroll up and center", silent = true })
vim.keymap.set("n", "<C-q>", "<cmd>call setqflist([], 'r')<CR>", { desc = "Neovim: Clear Quickfix list", silent = true })
vim.keymap.set("n", "<C-h>", "<C-W>h", { desc = "Neovim: Move to left window", silent = true })
vim.keymap.set("n", "<C-j>", "<C-W>j", { desc = "Neovim: Move to bottom window", silent = true })
vim.keymap.set("n", "<C-k>", "<C-W>k", { desc = "Neovim: Move to top window", silent = true })
vim.keymap.set("n", "<C-l>", "<C-W>l", { desc = "Neovim: Move to right window", silent = true })
vim.keymap.set("n", "<C-z>", "<C-W>5<", { desc = "Neovim: Decrease window width", silent = true })
vim.keymap.set("n", "<C-x>", "<C-W>5>", { desc = "Neovim: Increase window width", silent = true })
vim.keymap.set("n", "\\", "<cmd>tabnext<cr>", { desc = "Neovim: Go to next tab", silent = true })
vim.keymap.set("n", "|", "<cmd>tabprevious<cr>", { desc = "Neovim: Go to previous tab", silent = true })
