local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.lsp.set_log_level("debug")
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    --vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "I", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() require("trouble").next({ skip_groups = true, jump = true }) end, opts)
    vim.keymap.set("n", "]d", function() require("trouble").previous({ skip_groups = true, jump = true }) end, opts)
    -- vim.keymap.set("n", "<leader>ac", function() vim.lsp.buf.code_action() end, opts)
    -- vim.keymap.set("n", "<leader>w", function() vim.lsp.buf.references() end, opts)
    --vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
    --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set({ 'n', 'x' }, '<space>f', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 100 })
    end, opts)
end)

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

local lspconfig = require("lspconfig")
-- lspconfig.gopls.setup({
--     cmd = { "gopls" },
-- })
lspconfig.gopls.setup({
    cmd = { "gopls", "serve", "-logfile=/home/petrside/.gopls.log", "-rpc.trace" },
    -- cmd = { "gopls" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
            verboseOutput = true,
        },
    },
})

lspconfig.rust_analyzer.setup({
    cmd = { "/home/petrside/.local/bin/rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})
