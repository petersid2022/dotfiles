function CustomTab()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    s = s .. '%' .. i .. 'T'
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = vim.fn.tabpagebuflist(i)[winnr]
    local filename = vim.fn.bufname(bufnr)
    filename = vim.fn.fnamemodify(filename, ':t')
    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end
    s = s .. ' ' .. filename .. ' '
  end
  s = s .. '%#TabLineFill#%T'
  return s
end

vim.o.tabline = '%!v:lua.CustomTab()'
