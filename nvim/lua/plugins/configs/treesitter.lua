return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    local enabled = {
      "markdown",
      "markdown_inline",
      "vimdoc",
      "javascript",
      "c",
      "python",
      "lua",
      "rust",
      "bash",
      "go",
      "gomod",
      "gosum",
      "vim",
      "diff",
      "yaml",
      "html",
      "css",
      "json"
    }
    treesitter.setup {
      ensure_installed = enabled,
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      }
    }
  end
}
