return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      notify_on_error = true,
      async = true,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback"
      },
      formatters_by_ft = {
        markdown = { "prettierd" },
        html = { "prettierd" },
        sh = { "shfmt" }
      }
    }

    vim.keymap.set("n", "<leader>fb", function()
      conform.format { lsp_format = "fallback", async = true }
    end, nil)
  end
}
