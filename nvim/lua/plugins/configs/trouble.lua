return {
  "folke/trouble.nvim",
  branch = "dev",
  config = function()
    local trouble = require "trouble"

    local map = function(mode, keys, func, desc, silent)
      vim.keymap.set(mode, keys, func, { desc = "Trouble: " .. desc, silent = silent })
    end

    trouble.setup()

    map("n", "<leader>ls",
      "<cmd>Trouble symbols toggle focus=true<cr>",
      "LSP Document Symbols")

    map("n", "ge",
      "<cmd>Trouble lsp toggle focus=true<cr>",
      "LSP References and Definitions")

    map("n", "gr",
      "<cmd>Trouble lsp_references toggle focus=true<cr>",
      "LSP References")

    map("n", "<leader>wd",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      "Workspace Diagnostics")

    map("n", "<leader>d",
      "<cmd>Trouble diagnostics toggle focus=true<cr>",
      "Document Diagnostics")
  end
}
