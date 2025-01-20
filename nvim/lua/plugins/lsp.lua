return {
  "neovim/nvim-lspconfig",
  config = function()
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
      html = true,
      gopls = true,
      ts_ls = true,
      clangd = true,
      basedpyright = true,
      rust_analyzer = true,
      markdown_oxide = true,
    }

    for name, config in pairs(servers) do
      if config == true then
        config = {}
      end
      lspconfig[name].setup(config)
    end
  end
}
