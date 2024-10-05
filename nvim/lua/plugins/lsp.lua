return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
      callback = function(event)
        local clients = vim.lsp.get_clients()
        for _, client in ipairs(clients) do
          vim.lsp.completion.enable(true, client.id, 0, { autotrigger = true })
          vim.lsp.inlay_hint.enable(true)
        end

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "<leader>ll", vim.lsp.buf.references, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "I", vim.diagnostic.open_float, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "<leader>wd", vim.diagnostic.setqflist, { buffer = event.buf, remap = false })
        vim.keymap.set("n", "<leader>fb", function()
          vim.lsp.buf.format { async = true }
        end, { buffer = event.buf, remap = false })
      end
    })

    local lspconfig = require "lspconfig"

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } }
          }
        }
      },
      zls = true,
      gopls = true,
      ts_ls = true,
      clangd = true,
      basedpyright = true,
      rust_analyzer = true,
    }

    for name, config in pairs(servers) do
      if config == true then
        config = {}
      end
      lspconfig[name].setup(config)
    end
  end
}
