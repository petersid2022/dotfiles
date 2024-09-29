return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require "conform"

    conform.setup {
      notify_on_error = true,
      async = true,
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
      formatters_by_ft = {
        javascript = { "prettierd" },
        html = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" }
      }
    }

    vim.keymap.set("n", "<leader>fb", function()
      conform.format { lsp_format = "fallback", async = true }
    end, nil)
  end
}
