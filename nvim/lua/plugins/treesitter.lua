return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter = require "nvim-treesitter.configs"
        local enabled = { "comment", "c", "markdown", "markdown_inline", "vimdoc", "javascript", "cpp", "verilog", "php",
            "zig", "python", "lua", "rust", "bash", "go", "gomod", "gosum", "vim", "diff", "yaml", "html", "css", "json",
            "linkerscript" }
        treesitter.setup {
            ensure_installed = enabled,
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            indent = { enable = false },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            }
        }
    end
}
