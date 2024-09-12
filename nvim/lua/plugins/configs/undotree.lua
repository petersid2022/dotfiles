return {
  "mbbill/undotree",
  keys = {
    {
      "<leader>u",
      function()
        vim.cmd("UndotreeToggle")
        vim.cmd("wincmd w")
      end,
      desc = "Undotree: Toggle window"
    }
  }
}
