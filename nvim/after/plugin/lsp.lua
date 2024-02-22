vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {})

		vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {})

		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
			{ buffer = event.buf, remap = false, desc = "go to defintion" })
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
			{ buffer = event.buf, remap = false, desc = "lsp buf hover" })
		vim.keymap.set("n", "I", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "<leader>ac", function() vim.lsp.buf.code_action() end,
			{ buffer = event.buf, remap = false, desc = "lsp code action quickfix" })
		vim.keymap.set("n", "<leader>lbr", function() vim.lsp.buf.rename() end,
			{ buffer = event.buf, remap = false, desc = "lsp code buffer rename" })
		vim.keymap.set({ 'n', 'x' }, '<space>f', function()
			vim.lsp.buf.format({ async = true })
		end, { buffer = event.buf, remap = false, desc = "lsp buffer format" })
	end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local default_setup = function(server)
	require('lspconfig')[server].setup({
		capabilities = lsp_capabilities,
	})
end

local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		default_setup,
	},
})

local lspconfig = require("lspconfig")

lspconfig.gopls.setup({
	cmd = { "gopls", "serve", "-logfile=/home/petrside/.gopls.log", "-rpc.trace" },
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

lspconfig.zls.setup({
	cmd = { "zls" },
})

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
			telemetry = { enable = false },
		}
	}
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
