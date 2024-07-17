return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      mode = "",
      desc = "Conform: Format buffer",
    },
  },
  opts = {
    notify_on_error = true,
    async = true,
    format_on_save = {
      timeout_ms = 2500,
      lsp_fallback = true,
    },
  },
}
