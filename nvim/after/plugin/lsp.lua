vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {})

		vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {})

		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
			{ buffer = event.buf, remap = false, desc = "LSP: Go to defintion" })
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
			{ buffer = event.buf, remap = false, desc = "LSP: buffer hover" })
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'LSP: Go to previous [D]iagnostic message' })
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'LSP: Go to next [D]iagnostic message' })
		vim.keymap.set("n", "I", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "<leader>ac", function() vim.lsp.buf.code_action() end,
			{ buffer = event.buf, remap = false, desc = "LSP: Code Action" })
		vim.keymap.set("n", "<leader>lbr", function() vim.lsp.buf.rename() end,
			{ buffer = event.buf, remap = false, desc = "LSP: Buffer Rename" })
		vim.keymap.set({ 'n', 'x' }, '<space>f', function()
			vim.lsp.buf.format({ async = true })
		end, { buffer = event.buf, remap = false, desc = "LSP: Buffer Format" })
	end
})

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

lspconfig.gopls.setup({
	-- Passing in arguments like so:
	-- cmd = { "gopls", "serve", "-logfile=/home/petrside/.gopls.log", "-rpc.trace" },
	cmd = { "gopls" },
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
