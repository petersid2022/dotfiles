return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local enabled = {
      "markdown",
      "markdown_inline",
      "vimdoc",
      "javascript",
      "c",
      "lua",
      "rust",
      "bash",
      "go",
      "gomod",
      "gosum",
      "vim",
      "json",
    }
    require("nvim-treesitter.configs").setup {
      ensure_installed = enabled,
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      indent = { enable = true },
      highlight = {
        enable = true,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 50 * 1024 -- 50 KB
            ---@diagnostic disable-next-line: undefined-field
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
            for _, enable in pairs(enabled) do
              if lang == enable then
                return false
              end
            end
            return true
          end,
        },
        additional_vim_regex_highlighting = false,
      }
    }
  end
}
