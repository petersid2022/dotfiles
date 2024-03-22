vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc, remap = false })
        end

        vim.lsp.inlay_hint.enable(event.buf, true)

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover,
            { border = "single" }
        )

        vim.diagnostic.config({
            float = { border = "single" }
        })

        -- map('gd', vim.lsp.buf.definition, 'LSP: Go to defintion')
        map('K', vim.lsp.buf.hover, 'LSP: Buffer Hover')
        map('[d', vim.diagnostic.goto_prev, 'LSP: Go to previous Diagnostic message')
        map(']d', vim.diagnostic.goto_next, 'LSP: Go to next Diagnostic message')
        map('I', vim.diagnostic.open_float, 'LSP: Open the Diagnostic Floating window')
        map('<leader>ac', vim.lsp.buf.code_action, 'LSP: Code Action')
        map('<leader>lr', vim.lsp.buf.rename, 'LSP: Rename all references to the symbol under the cursor')
        map('<leader>f', function() vim.lsp.buf.format({ async = true }) end, 'LSP: Buffer Format')
    end
})

local signs = { Error = '✘', Warn = '▲', Hint = '■', Info = '✔' }
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
            },
            staticcheck = true,
            gofumpt = true,
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
