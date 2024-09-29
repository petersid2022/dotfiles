return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    local enabled = {
      "c",
      "markdown",
      "markdown_inline",
      "vimdoc",
      "javascript",
      "cpp",
      "verilog",
      "php",
      "zig",
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
        enable = false
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      }
    }
  end
}
