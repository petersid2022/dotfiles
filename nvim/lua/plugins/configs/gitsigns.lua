return {
  'lewis6991/gitsigns.nvim',
  cond = function()
    if vim.fn.finddir('.git', vim.fn.getcwd()) ~= "" then
      return true
    end
  end,
  opts = {},
}
