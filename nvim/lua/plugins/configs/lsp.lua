---@diagnostic disable: undefined-field
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim",           lazy = true, opts = {} },
    { "j-hui/fidget.nvim",                 lazy = true, opts = {} },
    { "williamboman/mason-lspconfig.nvim", lazy = true, opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
      callback = function(event)
        vim.lsp.inlay_hint.enable(true, { event.buf })
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
        vim.diagnostic.config { float = { border = "rounded" } }
        vim.api.nvim_set_hl(0, "NormalFloat", { guibg = nil })
        vim.keymap.set("n", "K", vim.lsp.buf.hover,
          { buffer = event.buf, desc = "LSP: Open the Information Floating window", remap = false })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition,
          { buffer = event.buf, desc = "LSP: Jump to definition", remap = false })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
          { buffer = event.buf, desc = "LSP: Jump to declaration", remap = false })
        vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action,
          { buffer = event.buf, desc = "LSP: Request Code Action", remap = false })
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename,
          { buffer = event.buf, desc = "LSP: Rename all references to the symbol under the cursor", remap = false })
        vim.keymap.set("n", "I", vim.diagnostic.open_float,
          { buffer = event.buf, desc = "LSP: Open the Diagnostic Floating window", remap = false })
      end,
    })

    local lsp_capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )

    local lspconfig = require "lspconfig"

    local default_setup = function(server)
      lspconfig[server].setup {
        capabilities = lsp_capabilities,
      }
    end

    require("mason-lspconfig").setup { handlers = { default_setup } }

    lspconfig.gopls.setup {
      cmd = { "gopls" },
      settings = {
        gopls = {
          analyses = { unusedparams = true, shadow = true },
          staticcheck = true,
          gofumpt = true,
          experimentalPostfixCompletions = true,
          verboseOutput = true,
          ["ui.inlayhint.hints"] = {
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            parameterNames = true,
            rangeVariableTypes = true,
          }
        }
      }
    }

    lspconfig.verible.setup {
      cmd = { "verible-verilog-ls" },
      root_dir = function()
        return vim.loop.cwd()
      end,
    }

    lspconfig.verible.setup {
      cmd = { "verible-verilog-ls" },
      root_dir = function()
        return vim.loop.cwd()
      end,
    }

    lspconfig.zls.setup { cmd = { "zls" } }
  end
}
