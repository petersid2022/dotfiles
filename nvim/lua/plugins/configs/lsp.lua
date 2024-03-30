return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { "j-hui/fidget.nvim",                opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc, remap = false })
        end

        vim.lsp.set_log_level("OFF")
        vim.lsp.inlay_hint.enable(event.buf, true)

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
          vim.lsp.handlers.hover,
          { border = "rounded" }
        )

        vim.diagnostic.config({
          float = { border = "rounded" }
        })

        map('K', vim.lsp.buf.hover, 'Open the Information Floating window')
        map('[d', vim.diagnostic.goto_prev, 'Go to previous Diagnostic message')
        map(']d', vim.diagnostic.goto_next, 'Go to next Diagnostic message')
        map('I', vim.diagnostic.open_float, 'Open the Diagnostic Floating window')
        map('<leader>ac', vim.lsp.buf.code_action, 'Request Code Action')
        map('<leader>lr', vim.lsp.buf.rename, 'Rename all references to the symbol under the cursor')
      end
    })

    local signs = { Error = '✘', Warn = '', Hint = '', Info = '󰉿' }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local lsp_capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities())

    local default_setup = function(server)
      require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
      })
    end

    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {},
      handlers = {
        default_setup,
      },
    })

    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      capabilities = lsp_capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            }
          },
          completion = {
            callSnippet = 'Replace',
          },
          telemetry = { enable = false },
        }
      }
    })

    lspconfig.gopls.setup({
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
            rangeVariableTypes = true
          },
        },
      },
    })

    lspconfig.zls.setup({
      cmd = { "zls" },
    })
  end,
}
