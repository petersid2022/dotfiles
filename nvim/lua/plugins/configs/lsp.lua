return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim",           opts = {} },
    { "williamboman/mason-lspconfig.nvim", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
      callback = function(event)
        local clients = vim.lsp.get_clients()
        for _, client in ipairs(clients) do
          vim.lsp.completion.enable(true, client.id, 0, { autotrigger = true })
        end

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "I", vim.diagnostic.open_float, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "<leader>wd", vim.diagnostic.setqflist, { buffer = event.buf, remap = false })
      end
    })

    local lspconfig = require "lspconfig"

    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } }
        }
      }
    }

    local servers = {
      bashls = {
        cmd = { "/home/petrside/.local/share/nvim/mason/bin/bash-language-server" }
      },
      gopls = {
        cmd = { "/home/petrside/go/bin/gopls" },
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
      },
      templ = {
        cmd = { "/home/petrside/go/bin/templ" }
      },
      rust_analyzer = {
        cmd = { "/home/petrside/.local/bin/rust-analyzer" }
      },
      asm_lsp = {
        cmd = { "/home/petrside/.local/share/nvim/mason/bin/asm-lsp" }
      },
      zls = {
        cmd = { "zls" }
      },
      ts_ls = {
        cmd = { "/home/petrside/.local/share/nvim/mason/bin/typescript-language-server", "--stdio" }
      },
      clangd = {
        cmd = { "/usr/bin/clangd", "--background-index", "--clang-tidy", "--log=verbose" },
        init_options = {
          fallback_flags = { "-std=c++17" },
        }
      },
      verible = {
        cmd = { "verible-verilog-ls" },
        root_dir = function()
          return vim.loop.cwd()
        end
      }
    }

    for name, config in pairs(servers) do
      lspconfig[name].setup(config)
    end
  end
}
