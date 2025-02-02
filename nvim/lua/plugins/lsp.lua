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
            zls = {},
            html = {},
            gopls = {},
            ts_ls = {},
            clangd = {},
            basedpyright = {},
            rust_analyzer = {},
            markdown_oxide = {},
        }

        for name, config in pairs(servers) do
            lspconfig[name].setup(config)
        end
    end
}
