return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim",           event = { "LspAttach " }, opts = {} },
    { "j-hui/fidget.nvim",                 event = { "LspAttach " }, opts = {} },
    { "williamboman/mason-lspconfig.nvim", event = { "LspAttach " } },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc, remap = false })
        end

        vim.lsp.set_log_level "OFF"

        vim.lsp.inlay_hint.enable(true, { event.buf })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

        vim.diagnostic.config {
          float = { border = "rounded" },
        }

        vim.api.nvim_set_hl(0, "NormalFloat", { guibg = nil })

        map("K", vim.lsp.buf.hover, "Open the Information Floating window")
        map("gd", vim.lsp.buf.definition, "Jump to definition")
        map("gD", vim.lsp.buf.declaration, "Jump to declaration")
        map("<leader>ac", vim.lsp.buf.code_action, "Request Code Action")
        map("<leader>lr", vim.lsp.buf.rename, "Rename all references to the symbol under the cursor")
        -- map("<leader>d", vim.diagnostic.setqflist, "Add all diagnostics to the quickfix list")
        map("I", vim.diagnostic.open_float, "Open the Diagnostic Floating window")
      end,
    })

    -- local signs = { Error = '✘', Warn = '', Hint = '', Info = '󰉿' }
    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    -- end

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

    require("mason-lspconfig").setup {
      handlers = { default_setup },
    }

    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          completion = { callSnippet = "Replace" },
        },
      },
    }

    lspconfig.gopls.setup {
      cmd = { "gopls" },
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = true,
          },
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
          },
        },
      },
    }

    lspconfig.verible.setup {
      cmd = { "verible-verilog-ls" },
      root_dir = function()
        return vim.loop.cwd()
      end,
    }

    lspconfig.zls.setup {
      cmd = { "zls" },
    }
  end,
}
